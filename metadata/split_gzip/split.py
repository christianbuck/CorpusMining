#!/usr/bin/env python
# -*- coding: utf-8 -*-
import sys
from pyflate import Bitfield, RBitfield
# from pyflate import code_length_orders, OrderedHuffmanTable, extra_length_bits, length_base, distance_base, extra_distance_bits, HuffmanTable
from pyflate import *

# Sixteen bits of magic have been removed by the time we start decoding


def gzip_main(field):
    b = Bitfield(field)
    method = b.readbits(8)
    if method != 8:
        raise "Unknown (not type eight DEFLATE) compression method"

    # Use flags, drop modification time, extra flags and OS creator type.
    flags = b.readbits(8)
    # print 'flags', hex(flags)
    mtime = b.readbits(32)
    # print 'mtime', hex(mtime)
    extra_flags = b.readbits(8)
    # print 'extra_flags', hex(extra_flags)
    os_type = b.readbits(8)
    # print 'os_type', hex(os_type)

    if flags & 0x04:  # structured GZ_FEXTRA miscellaneous data
        xlen = b.readbits(16)
        b.dropbytes(xlen)
    while flags & 0x08:  # original GZ_FNAME filename
        if not b.readbits(8):
            break
    while flags & 0x10:  # human readable GZ_FCOMMENT
        if not b.readbits(8):
            break
    if flags & 0x02:  # header-only GZ_FHCRC checksum
        b.readbits(16)

    # print "gzip header skip", b.tell()
    out = []

    # print 'header 0 count 0 bits', b.tellbits()

    while True:
        header_start = b.tell()
        bheader_start = b.tellbits()
        # print 'new block at', b.tell()
        lastbit = b.readbits(1)
        # print "last bit", hex(lastbit)
        blocktype = b.readbits(2)
        # print "deflate-blocktype", blocktype, 'beginning at', header_start

        # print 'raw block data at', b.tell()
        if blocktype == 0:
            b.align()
            length = b.readbits(16)
            if length & b.readbits(16):
                raise "stored block lengths do not match each other"
            # print "stored block of length", length
            # print 'raw data at', b.tell(), 'bits', b.tellbits() - bheader_start
            # print 'header 0 count 0 bits', b.tellbits() - bheader_start
            for i in range(length):
                out.append(chr(b.readbits(8)))
            # print 'linear', b.tell()[0], 'count', length, 'bits',
            # b.tellbits() - bheader_start

        elif blocktype == 1 or blocktype == 2:  # Huffman
            main_literals, main_distances = None, None

            if blocktype == 1:  # Static Huffman
                static_huffman_bootstrap = [
                    (0, 8), (144, 9), (256, 7), (280, 8), (288, -1)]
                static_huffman_lengths_bootstrap = [(0, 5), (32, -1)]
                main_literals = HuffmanTable(static_huffman_bootstrap)
                main_distances = HuffmanTable(static_huffman_lengths_bootstrap)

            elif blocktype == 2:  # Dynamic Huffman
                literals = b.readbits(5) + 257
                distances = b.readbits(5) + 1
                code_lengths_length = b.readbits(4) + 4

                l = [0] * 19
                for i in range(code_lengths_length):
                    l[code_length_orders(i)] = b.readbits(3)

                dynamic_codes = OrderedHuffmanTable(l)
                dynamic_codes.populate_huffman_symbols()
                dynamic_codes.min_max_bits()

                # Decode the code_lengths for both tables at once,
                # then split the list later

                code_lengths = []
                n = 0
                while n < (literals + distances):
                    r = dynamic_codes.find_next_symbol(b)
                    if 0 <= r <= 15:  # literal bitlength for this code
                        count = 1
                        what = r
                    elif r == 16:  # repeat last code
                        count = 3 + b.readbits(2)
                        # Is this supposed to default to '0' if in the zeroth
                        # position?
                        what = code_lengths[-1]
                    elif r == 17:  # repeat zero
                        count = 3 + b.readbits(3)
                        what = 0
                    elif r == 18:  # repeat zero lots
                        count = 11 + b.readbits(7)
                        what = 0
                    else:
                        raise "next code length is outside of the range 0 <= r <= 18"
                    code_lengths += [what] * count
                    n += count

                main_literals = OrderedHuffmanTable(code_lengths[:literals])
                main_distances = OrderedHuffmanTable(code_lengths[literals:])

            # Common path for both Static and Dynamic Huffman decode now

            data_start = b.tell()
            # print 'raw data at', data_start, 'bits', b.tellbits() - bheader_start
            # print 'header 0 count 0 bits', b.tellbits() - bheader_start

            main_literals.populate_huffman_symbols()
            main_distances.populate_huffman_symbols()

            main_literals.min_max_bits()
            main_distances.min_max_bits()

            literal_count = 0
            literal_start = 0

            while True:
                lz_start = b.tellbits()
                r = main_literals.find_next_symbol(b)
                if 0 <= r <= 255:
                    if literal_count == 0:
                        literal_start = lz_start
                    literal_count += 1
                    # print 'found literal', `chr(r)`
                    out.append(chr(r))
                elif r == 256:
                    if literal_count > 0:
                        # print 'add 0 count', literal_count, 'bits',
                        # lz_start-literal_start, 'data',
                        # `out[-literal_count:]`
                        literal_count = 0
                    # print 'eos 0 count 0 bits', b.tellbits() - lz_start
                    # print 'end of Huffman block encountered'
                    break
                elif 257 <= r <= 285:  # dictionary lookup
                    if literal_count > 0:
                        # print 'add 0 count', literal_count, 'bits',
                        # lz_start-literal_start, 'data',
                        # `out[-literal_count:]`
                        literal_count = 0
                    length_extra = b.readbits(extra_length_bits(r))
                    length = length_base(r) + length_extra
                    # print 'dictionary lookup: length', length,

                    r1 = main_distances.find_next_symbol(b)
                    if 0 <= r1 <= 29:
                        distance = distance_base(
                            r1) + b.readbits(extra_distance_bits(r1))
                        cached_length = length
                        while length > distance:
                            out += out[-distance:]
                            length -= distance
                        if length == distance:
                            out += out[-distance:]
                        else:
                            out += out[-distance:length - distance]
                        # print 'copy', -distance, 'count', cached_length,
                        # 'bits', b.tellbits() - lz_start, 'data',
                        # `out[-cached_length:]`
                    elif 30 <= r1 <= 31:
                        raise "illegal unused distance symbol in use @" + \
                            `b.tell()`
                elif 286 <= r <= 287:
                    raise "illegal unused literal/length symbol in use @" + \
                        `b.tell()`
        elif blocktype == 3:
            raise "illegal unused blocktype in use @" + `b.tell()`

        if lastbit:
            # print "this was the last block, time to leave", b.tell()
            break

    footer_start = b.tell()
    bfooter_start = b.tellbits()
    b.align()
    crc = b.readbits(32)
    final_length = b.readbits(32)
    # print len(out)
    next_unused = b.tell()
    # print 'deflate-end-of-stream', 5, 'beginning at', footer_start, 'raw
    # data at', next_unused, 'bits', b.tellbits() - bfooter_start
    # print 'deflate-end-of-stream'
    # print 'crc', hex(crc), 'final length', final_length
    # print 'header 0 count 0 bits', b.tellbits()-bfooter_start

    return "".join(out)


if __name__ == '__main__':
    if len(sys.argv) != 2:
        program = sys.argv[0]
        print program + ':', 'usage:', program, '<filename.gz>|<filename.bz2>'
        sys.exit(0)

    filename = sys.argv[1]
    input = open(filename)
    field = RBitfield(input)

    while input:
        print input.tell()
        magic = field.readbits(16)
        if magic == 0x1f8b:  # GZip
            out = gzip_main(field)
        else:
            raise "Unknown file magic " + \
                hex(magic) + ", not a gzip/bzip2 file"

    input.close()

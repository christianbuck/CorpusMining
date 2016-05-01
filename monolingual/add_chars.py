#!/usr/bin/env python
# -*- coding: utf-8 -*-
import sys

magic_number = 'df6fa1abb58549287111ba8d776733e9'

total_bytes = 0
total_chars = 0
total_lines = 0
n_chars, n_bytes = 0, 0
buf = []


def process_buf(buf, n_chars, n_bytes):
    if not buf:
        return
    header = buf[0]
    header = "%s bytes:%d chars:%d lines:%d\n" % (
        header.rstrip(), n_bytes, n_chars, len(buf) - 1)
    sys.stdout.write(header)
    # for b in buf[1:]:
    #     sys.stdout.write(b)

for line in sys.stdin:
    if line.startswith(magic_number):
        # process_buf(buf, n_chars, n_bytes)
        total_lines += len(buf) - 1
        total_chars += n_chars
        total_bytes += n_bytes
        buf = [line]
        n_chars, n_bytes = 0, 0
    else:
        if line.strip():
            dec_line = line.decode('utf-8', 'ignore').strip()
            if not dec_line:
                continue
            buf.append(line)
            n_bytes += len(line)
            n_chars += len(dec_line)

# process_buf(buf, n_chars, n_bytes)
total_chars += n_chars
total_bytes += n_bytes
sys.stdout.write("%d\t%d\t%d" % (total_lines, total_bytes, total_chars))

#!/usr/bin/env python
# -*- coding: utf-8 -*-
import sys

if __name__ == "__main__":
    import argparse
    parser = argparse.ArgumentParser()
    parser.add_argument('md5list', help='list of md5sum <tab> filename',
                        type=argparse.FileType('r'))
    args = parser.parse_args(sys.argv[1:])

    hash2file = {}
    for line in args.md5list:
        # print line
        md5, filename = line.strip().split()
        hash2file[md5] = filename

    seen = set()
    for line in sys.stdin:
        md5, s3file = line.split()[-2:]
        if md5 in hash2file:
            print "# found %s:\t%s\t%s" % (md5, hash2file[md5], s3file)
            seen.add(md5)

    for md5 in hash2file:
        if md5 not in seen:
            print "# missing: %s:\t%s" % (md5, hash2file[md5])
            print "s3cmd put --continue-put --multipart-chunk-size-mb=500 /fs/nas/eikthyrnir0/commoncrawl/raw/%s s3://web-language-models/data.statmt.org/ngrams/raw/%s" % (hash2file[md5], hash2file[md5])

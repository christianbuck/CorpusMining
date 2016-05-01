#!/usr/bin/env python
# -*- coding: utf-8 -*-
import sys

""" Process every pair of URLs only once """

if __name__ == "__main__":
    import argparse
    parser = argparse.ArgumentParser()
    parser.add_argument('-outfile', type=argparse.FileType('w'),
                        help='output file', default=sys.stdout)
    args = parser.parse_args(sys.argv[1:])

    candidates = []
    known_pairs = set()

    for linenr, line in enumerate(sys.stdin):
        if (linenr + 1) % 10000 == 0:
            sys.stderr.write('.')
        if (linenr + 1) % 600000 == 0:
            sys.stderr.write("[%d]\n" % (linenr + 1))
        url, _crawl, _data = line.split('\t', 2)

        candidates.append((url, line))

        if len(candidates) == 2:
            source_url, source_line = candidates[0]
            target_url, target_line = candidates[1]
            key = "%s %s" % (source_url, target_url)
            print key
            if key not in known_pairs:
                # args.outfile.write(source_line)
                # args.outfile.write(target_line)
                known_pairs.add(key)
            candidates = []

    sys.stderr.write("[%d]\n" % (linenr + 1))

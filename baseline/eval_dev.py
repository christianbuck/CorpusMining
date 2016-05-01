#!/usr/bin/env python
# -*- coding: utf-8 -*-
import sys


def read_pairs(infile):
    pairs = []
    for line in infile:
        source_url, target_url = line.strip().split("\t")
        pairs.append(sorted([source_url, target_url]))
    pairs = map(tuple, pairs)
    return pairs


if __name__ == "__main__":
    import argparse
    parser = argparse.ArgumentParser()
    parser.add_argument('pairs',
                        help='pairs predicted',
                        type=argparse.FileType('r'))
    parser.add_argument('devset',
                        help='correct pairs in dev set',
                        type=argparse.FileType('r'))
    parser.add_argument('-fails',
                        help='report failed pairs',
                        type=argparse.FileType('w'))

    args = parser.parse_args(sys.argv[1:])

    predicted = set(read_pairs(args.pairs))
    dev = set(read_pairs(args.devset))

    recall = len(dev.intersection(predicted))
    print "Found %d out of %d = %f percent" % (recall, len(dev),
                                               float(recall) / len(dev))

    if args.fails:
        for u1, u2 in dev.difference(predicted):
            args.fails.write("%s\t%s\n" % (u1, u2))

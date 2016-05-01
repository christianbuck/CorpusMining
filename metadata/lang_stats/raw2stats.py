#!/usr/bin/env python
# -*- coding: utf-8 -*-

import sys

""" Read 2012 raw data and extract bytes stats """

magic_number = 'df6fa1abb58549287111ba8d776733e9'


def get_uri(line):
    return line.split()[2]

if __name__ == "__main__":
    import argparse

    parser = argparse.ArgumentParser()
    parser.add_argument('lang', help="language code")
    args = parser.parse_args()

    buf_size = 0
    uri = None
    for line in sys.stdin:
        if line.startswith(magic_number):
            if get_uri(line) == uri:
                # just another block from the same uri
                continue

            if buf_size > 0 and uri is not None:
                print "%s uri:%s language:%s bytes:%d" % \
                    (magic_number, uri, args.lang, buf_size)

            uri = get_uri(line)
            buf_size = 0
        else:
            buf_size += len(line)

#!/usr/bin/env python

import sys
from itertools import imap


def parse_documentlist(d):
    """ Convert diff-encoded doc-ids to raw ids """
    offset = 0
    document_list = []
    for i in imap(int, d.split(':')):
        offset += i
        document_list.append(i)
    return document_list


if __name__ == "__main__":
    import argparse
    parser = argparse.ArgumentParser()
    parser.add_argument('idx',
                        help='bitextor idx file',
                        type=argparse.FileType('r'))
    parser.add_argument('lang', help="Two letter language code")

    args = parser.parse_args(sys.argv[1:])

    for line in args.idx:
        lang, word, documents = line.strip().split()
        if lang != args.lang:
            continue
        documents = parse_documentlist(documents)
        for docid in documents:
            sys.stdout.write("%d\t%s\n" %(docid, word))

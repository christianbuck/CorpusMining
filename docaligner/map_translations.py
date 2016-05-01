#!/usr/bin/env python
# -*- coding: utf-8 -*-
import base64
import langid
import re
import sys

if __name__ == "__main__":
    import argparse
    parser = argparse.ArgumentParser()
    parser.add_argument('-mappings', type=argparse.FileType('r'), nargs='+',
                        help='filename-to-url mappings', required=True)
    # parser.add_argument('-outfile', type=argparse.FileType('w'),
    #                     help='output file', required=True)
    # parser.add_argument('-prefix', help='prefix added to make filenames',
    #                     default="/fs/syn0/pkoehn/crawl/data/site-crawls")
    # parser.add_argument('-lang', help='non-english language', default='fr')
    # parser.add_argument(
    #     '-splitter', help='moses sentence splitting script',
    #     default="/home/buck/net/build/moses-clean/scripts/ems/support/split-sentences.perl")
    # parser.add_argument(
    #     '-normalizer', help='moses normalization script',
    #     default="/home/buck/net/build/moses-clean/scripts/tokenizer/normalize-punctuation.perl")
    # parser.add_argument(
    #     '-tokenizer', help='moses tokenization script',
    #     default="/home/buck/net/build/moses-clean/scripts/tokenizer/tokenizer.perl")
    # parser.add_argument('-langsplit', help='langsplit executable',
    #                     default="/home/buck/net/build/mtma_bitext/html_convert/langsplit")
    # parser.add_argument(
    #     '-fromhtml', help='re-extract text from HTML', action='store_true')

    args = parser.parse_args(sys.argv[1:])

    filename2url = dict()
    for fh in args.mappings:
        for line in fh:
            filename, url = line[:-1].split('\t')
            assert filename not in filename2url
            filename2url[filename] = url

    for linenr, line in enumerate(sys.stdin):
        filename, text = line[:-1].split('\t', 1)
        if filename not in filename2url:
            print "No found:", filename
            sys.exit()

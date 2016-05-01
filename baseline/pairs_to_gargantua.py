#!/usr/bin/env python
# -*- coding: utf-8 -*-

from collections import defaultdict
import argparse
import cld2
import langid
import sys
import base64

    # outfile.write("\t".join((src_url,
    #                          tgt_url,
    #                          base64.b64encode(src_text.encode('utf-8')),
    #                          base64.b64encode(tgt_text.encode('utf-8')),
    #                          base64.b64encode(src_html.encode('utf-8')),
    #                          base64.b64encode(tgt_html.encode('utf-8')),)))

if __name__ == "__main__":
    import argparse
    parser = argparse.ArgumentParser()
    parser.add_argument('-outfile', type=argparse.FileType('w'),
                        help='output file', default=sys.stdout)
    parser.add_argument('-source_tokenizer',
                        help='call to source tokenizer, incl. args')
    parser.add_argument('-source_splitter',
                        help='call to source sentence splitter, incl. args')
    parser.add_argument('-target_tokenizer',
                        help='call to target tokenizer, incl. args')
    parser.add_argument('-target_splitter',
                        help='call to target sentence splitter, incl. args')
    parser.add_argument('-srclang',
                        help="source langauge e.g. en")
    parser.add_argument('-tgtlang',
                        help="target langauge e.g. fr")
    args = parser.parse_args()

    for line in sys.stdin:
        src_url, tgt_url, s, t, _, _ = line.split("\t")
        s = base64.b64decode(s).decode('utf-8')
        t = base64.b64decode(t).decode('utf-8')
        

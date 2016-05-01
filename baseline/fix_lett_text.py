#!/usr/bin/env python
# -*- coding: utf-8 -*-
import base64
import sys

from html2text import html2text
from textsanitzer import TextSanitizer

if __name__ == "__main__":
    import argparse
    parser = argparse.ArgumentParser()
    parser.add_argument(
        '-fromhtml', help='re-extract text from HTML', action='store_true')
    parser.add_argument(
        '-sanitize', help='sanitize utf-8', action='store_true')

    args = parser.parse_args()

    for linenr, line in enumerate(sys.stdin):
        try:
            lang, mime_type, enc, uri, html, text = line.split("\t")
        except ValueError:
            continue
        # uri = TextSanitizer.to_unicode(uri).encode('utf-8')
        text = html2text(base64.b64decode(html),
                         sanitize=args.sanitize,
                         ignore_br=False).encode('utf-8')
        text = base64.b64encode(text)
        print "\t".join((lang, mime_type, enc, uri, html, text))

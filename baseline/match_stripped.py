#!/usr/bin/env python
# -*- coding: utf-8 -*-
import sys
import tldextract
from collections import defaultdict

""" Take source language and target language candidates
and print those where a single stripped url has at least
two pages in different languages associated """


def get_tld(uri):
    try:
        netloc = uri.split(
            '//', 1)[1].split('/', 1)[0].split(':', 1)[0].split('@')[-1]
    except IndexError:
        return ""
    # netloc = urlparse(uri)
    try:
        tld = tldextract.extract(netloc)
    except UnicodeError:
        return None
    except IndexError:
        return None
    return tld


def process_buffer(buf, outfile):
    if not buf:
        return
    assert len(buf) == 1
    languages = defaultdict(list)
    stripped, lines = buf.items()[0]
    for line in lines:
        _, lang, loc, data = line.split('\t', 3)
        languages[lang].append(line)
    if len(languages) < 2:
        return
    for lang, lines in languages.iteritems():
        for line in lines:
            outfile.write(line)
            break


if __name__ == "__main__":
    import argparse
    parser = argparse.ArgumentParser()
    parser.add_argument('candidates', type=argparse.FileType('r'),
                        help='file containing candidates')
    parser.add_argument('outfile', type=argparse.FileType('w'),
                        default=sys.stdout)
    args = parser.parse_args(sys.argv[1:])

    buf = defaultdict(list)

    for line in args.candidates:
        key, _ = line.split('\t', 1)
        if key not in buf:
            process_buffer(buf, args.outfile)
            buf = defaultdict(list)
        buf[key].append(line)
    process_buffer(buf, args.outfile)

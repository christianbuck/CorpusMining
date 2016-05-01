#!/usr/bin/env python
# -*- coding: utf-8 -*-
import sys

if __name__ == "__main__":
    import argparse
    parser = argparse.ArgumentParser()
    parser.add_argument('-devset', help='url pairs from devset',
                        type=argparse.FileType('r'), required=True)

    args = parser.parse_args(sys.argv[1:])

    devset = set()
    for line in args.devset:
        surl, turl = line.strip().split("\t")
        devset.add(surl)
        devset.add(turl)

    seen = set()
    for line in sys.stdin:
        if len(line.strip().split("\t")) != 2:
            print "Malformed mapping: '%s'" % line.rstrip()
            sys.exit()
        filename, url = line.strip().split("\t")
        if url == 'unknown_url':
            url = "http://" + filename
        if not url.startswith("http://"):
            url = "http://" + url
        if url in devset:
            seen.add(url)

    print "Unseen:"
    print " ".join(list(devset.difference(seen)))

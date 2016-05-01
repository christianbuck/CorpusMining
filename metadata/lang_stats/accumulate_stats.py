#!/usr/bin/env python
# -*- coding: utf-8 -*-

import sys
from collections import defaultdict
import gzip
from math import log

magic_number = 'df6fa1abb58549287111ba8d776733e9'


# Example
# df6fa1abb58549287111ba8d776733e9 uri:http://0ceanfoam.tumblr.com/ encoding:utf-8 tld:com domain:tumblr bytes:417
# ENGLISH 99      816
# df6fa1abb58549287111ba8d776733e9 uri:http://0pointer.de/photos/?gallery=India%202008-11&photo=320 encoding:utf-8 tld:de domain:0pointer bytes:660
# ENGLISH 99      818
# df6fa1abb58549287111ba8d776733e9 uri:http://1-rockeiroapaixonado.tumblr.com/post/43320614237 encoding:utf-8 tld:com domain:tumblr bytes:2636
# ENGLISH 92      719
# PORTUGUESE      7       254


def parse_line(line):
    data = {}
    for item in line.rstrip().split()[1:]:
        try:
            key, value = item.split(':', 1)
            if key in ["bytes"]:
                value = int(value)
            data[key] = value
        except:
            pass
    return data


def entropy(lang_dist):
    total = float(sum(lang_dist.values()))
    h = 0
    for lang, count in lang_dist.iteritems():
        p = count / total
        h += p * log(p)
    return h

if __name__ == "__main__":
    import argparse
    parser = argparse.ArgumentParser()
    parser.add_argument('-minpercent', type=int, default=10,
                        help="ignore percentage smaller than this.")
    parser.add_argument('-minbytes', type=int, default=100,
                        help="ignore chunks smaller than this.")
    parser.add_argument('-lang', nargs='*',
                        help="Ignore all other languages but these.")
    args = parser.parse_args(sys.argv[1:])

    stats = defaultdict(lambda: defaultdict(int))

    header = None
    full_domain = None
    valid_languages = None
    if args.lang:
        valid_languages = [l.lower() for l in args.lang]

    for linenr, line in enumerate(sys.stdin):
        if line.startswith(magic_number):
            header = parse_line(line)
            full_domain = "%s.%s" % (header["domain"], header["tld"])
            continue

        lang, percent, confidence = line.split()

        percent = float(percent)
        if percent < args.minpercent:
            continue

        # print lang, valid_languages
        if valid_languages and lang.lower() not in valid_languages:
            continue

        bytes_in_lang = header["bytes"] * percent / 100
        if bytes_in_lang >= args.minbytes:
            stats[full_domain][lang] += bytes_in_lang
            # print full_domain, lang, bytes_in_lang

# del lang # fix pyflakes warning

for domain in stats:
    h = entropy(stats[domain])
    if h == 0.0:
        continue
    sys.stdout.write("%f %s" % (h, domain))
    counts = [(count, language)
              for language, count in stats[domain].iteritems()]
    counts.sort(reverse=True)
    for count, lang in counts:
        sys.stdout.write(" %s %d" % (lang, count))
    sys.stdout.write("\n")

#!/usr/bin/env python
# -*- coding: utf-8 -*-
import sys

""" Count how often source and target url differ in length """


if __name__ == "__main__":
    candidates = []
    total = 0
    different = 0
    for linenr, line in enumerate(sys.stdin):
        url, _crawl, _data = line.split('\t', 2)
        candidates.append(url)

        if len(candidates) == 2:
            total += 1
            if len(candidates[0]) != len(candidates[1]):
                different += 1
            candidates = []

    sys.stdout.write("%d/%d = %0.2f%%\n" % (total,
                                            different,
                                            100. * different / total))

#!/usr/bin/env python
# -*- coding: utf-8 -*-

import sys

for line in sys.stdin:
    line = line.strip().split('\t')
    if len(line) == 6:
        line.insert(5, "LINKS_PLACEHOLDER")
    sys.stdout.write("\t".join(line) + "\n")

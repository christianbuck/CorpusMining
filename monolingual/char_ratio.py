#!/usr/bin/env python
# -*- coding: utf-8 -*-
import sys

magic_number = 'df6fa1abb58549287111ba8d776733e9'

n_bytes = 0
n_chars = 0

for line in sys.stdin:
    if line.startswith(magic_number):
        continue
    line = line.strip()
    n_bytes += len(line)
    n_chars += len(line.decode('utf-8', 'ignore'))

    if n_bytes > 1024**3:  # 1GB
        print "%s\t%d\t%d\t%f" % \
            (sys.argv[1], n_bytes, n_chars, float(n_chars) / n_bytes)
        break

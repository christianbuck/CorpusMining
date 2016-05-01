#!/usr/bin/env python
# -*- coding: utf-8 -*-
import sys
from collections import defaultdict

lang2counts = defaultdict(int)

for line in sys.stdin:
	_, lang, size = line.split()
	lang2counts[lang] += int(size)

for lang, size in lang2counts.items():
	print "%s\t%d" %(lang, size)



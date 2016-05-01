#!/usr/bin/env python
# -*- coding: utf-8 -*-
import sys

seen_e = set()
seen_f = set()
written = set()

for line in sys.stdin:
    line = line.split('\t')
    e, f = None, None

    if line[0] == 'en' and line[2] == 'fr':
        e, f = line[1], line[3]
    elif line[0] == 'fr' and line[2] == 'en':
        f, e = line[1], line[3]
    else:
        continue

    if (f,e) in written:
    	continue
    written.add((f,e))

    assert e not in seen_e
    assert e not in seen_f
    seen_e.add(e)

    assert f not in seen_f
    assert f not in seen_e
    seen_f.add(f)

    print "%s\t%s" % (f, e)

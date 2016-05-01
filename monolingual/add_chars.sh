#!/bin/bash

b=`basename $1`
nice xzcat $1 | nice pypy ~/net/build/DataCollection/monolingual/add_chars.py > /fs/nas/eikthyrnir0/commoncrawl/raw/meta/${b/.raw.xz/.lines_bytes_chars}

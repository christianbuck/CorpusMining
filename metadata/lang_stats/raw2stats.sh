#!/bin/bash

SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
L=`basename $1`
L=${L/.2012.raw.xz/}
echo $L
nice xzcat $1 | nice pypy /home/buck/net/build/DataCollection/metadata/lang_stats/raw2stats.py ${L} | gzip -9 > /fs/nas/eikthyrnir0/commoncrawl/stats_2012/${L}.stats

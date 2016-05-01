#!/usr/bin/env bash

# Exit as soon as any command fails
set -e
set -o pipefail

BINDIR=/home/buck/net/build/DataCollection
PREFIX=$1
BASEDIR=$2

SHARDNAME=`basename $BASEDIR`
CRAWLNAME=`dirname $BASEDIR`
CRAWLNAME=`basename $CRAWLNAME`
OUTDIR=${PREFIX}/${CRAWLNAME}/${SHARDNAME}

echo $SHARDNAME
echo $CRAWLNAME
echo $OUTDIR
# exit 0

mkdir -p ${OUTDIR}
DONEFILE=${OUTDIR}/en_split.done

if [ ! -f ${DONEFILE} ]; then
    nice xzcat ${BASEDIR}/*.langsplit.xz | nice ${BINDIR}/monolingual/collect_lang_en .py \
        -en >(nice pigz -9 >${OUTDIR}/text.en.gz) 
    touch ${DONEFILE}
fi

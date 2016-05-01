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
exit 0

mkdir -p ${OUTDIR}

DONEFILE=${BASEDIR}/wmt_split.done

if [ ! -f ${DONEFILE} ]; then
    xzcat ${BASEDIR}/*.langsplit.xz | ${BINDIR}/monolingual/collect_lang_wmt.py \
        -de >(pigz -9 >${OUTDIR}/text.de.gz) \
        -cs >(pigz -9 >${OUTDIR}/text.cs.gz) \
        -fi >(pigz -9 >${OUTDIR}/text.fi.gz) \
        -ro >(pigz -9 >${OUTDIR}/text.ro.gz) \
        -ru >(pigz -9 >${OUTDIR}/text.ru.gz) \
        -tr >(pigz -9 >${OUTDIR}/text.tr.gz) \
        -bg >(pigz -9 >${OUTDIR}/text.bg.gz) \
        -it >(pigz -9 >${OUTDIR}/text.it.gz) 
    touch ${DONEFILE}
fi

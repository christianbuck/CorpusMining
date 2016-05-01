#!/bin/bash

# Downloads $1 which should be a CommonCrawl metadata file
# from 2012 or earlier, extracts location of each url,
# sorts by domainname and xzips the result

# Exit as soon as any command fails
set -e
set -o pipefail

# Virtual Env 
source /home/buck/net/build/virtualenvs/crawl/bin/activate

# Example filename:
# https://aws-publicdatasets.s3.amazonaws.com/common-crawl/parse-output/segment/1341690165636/metadata-00002

FILENAME=`echo $1 | awk  ' BEGIN { FS = "/" } { print $(NF-1) "/" $(NF) }'`
OUTFILE=${FILENAME}.meta.xz

# don't let temporary sort files fill up local /tmp
TMPDIR=./tmp/`hostname`
mkdir -p ${TMPDIR}

# Directory in which this script is stored
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )


if [ ! -f ${OUTFILE/.xz/.done} ]; then
  export CLASSPATH="/home/buck/net/build/hadoop-2.1.0-beta/share/hadoop/common/lib/commons-logging-1.1.1.jar:/home/buck/net/build/hadoop-2.1.0-beta/share/hadoop/common/lib/guava-11.0.2.jar:/home/buck/net/build/hadoop-2.1.0-beta/share/hadoop/common/lib/commons-configuration-1.6.jar:/home/buck/net/build/hadoop-2.1.0-beta/share/hadoop/common/lib/commons-lang-2.5.jar:/home/buck/net/build/hadoop-2.1.0-beta/share/hadoop/common/lib/hadoop-auth-2.1.0-beta.jar:/home/buck/net/build/hadoop-2.1.0-beta/share/hadoop/common/lib/slf4j-log4j12-1.6.1.jar:/home/buck/net/build/hadoop-2.1.0-beta/share/hadoop/common/lib/slf4j-api-1.6.1.jar:/home/buck/net/build/hadoop-2.1.0-beta/share/hadoop/common/lib/log4j-1.2.17.jar:/home/buck/net/build/hadoop-2.1.0-beta/share/hadoop/common/lib/avro-1.5.3.jar:/home/buck/net/build/ccreader/dist/ccreader.jar"

  wget $1 -c --quiet -O ./tmp/${FILENAME} 
  java ccreader.Ccreader ./tmp/$FILENAME 2>/dev/null | \
  ${DIR}/metadatabase.py --old 2012 x | \
  sort -t" " -S500M -k1,1 --compress-program=pigz --temporary-directory=${TMPDIR} --parallel=2 | \
  /home/buck/net/build/pxz/pxz -T 2 -9 -e \
  > ${OUTFILE}
  rm -f ./tmp/${FILENAME}
  touch ${OUTFILE/.xz/.done}
fi

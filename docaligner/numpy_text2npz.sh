#!/bin/bash

# Exit as soon as any command fails
set -e
set -o pipefail

OUTFILE=`basename $1`.npy
DONEFILE=npy/${OUTFILE}.done

if [ ! -f ${DONEFILE} ]; then
    echo $1
    nice python /home/buck/net/build/DataCollection/docaligner/numpy_text2npz.py $1 -out npy/${OUTFILE}
    touch ${DONEFILE}
fi

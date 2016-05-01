#!/bin/bash

for f in `cat test`; do /home/buck/net/build/DataCollection/docaligner/eval_model.py -prefix ${f} -devset /home/buck/net/experiments/wmt16/train/train.pairs -read_model paper/model.all -idx2url ${f}.urlmapping npy/${f}*.GaleChurch.npy.gz npy/${f}*.Structure.npy.gz npy/${f}*.TextDistance.npy.gz npy/${f}*.LinkJaccard.npy.gz npy/${f}*.NGramJaccard_1.npy.gz npy/${f}*.NGramJaccard_2.npy.gz npy/${f}*.NGramJaccard_3.npy.gz npy/${f}*.NGramJaccard_4.npy.gz  npy/${f}*Linkage.npy.gz cos_1/${f}.feats.Cosine_1.npy.gz cos_2/${f}.feats.Cosine_2.npy.gz cos_3/${f}.feats.Cosine_3.npy.gz cos_4/${f}.feats.Cosine_4.npy.gz cos_5/${f}.feats.Cosine_5.npy.gz cos_mono_1/${f}.feats.Cosine_1.npy.gz cos_mono_2/${f}.feats.Cosine_2.npy.gz cos_mono_3/${f}.feats.Cosine_3.npy.gz cos_mono_4/${f}.feats.Cosine_4.npy.gz cos_mono_5/${f}.feats.Cosine_5.npy.gz; done > paper/eval3.test.all

for f in `cat test`; do /home/buck/net/build/DataCollection/docaligner/eval_model.py -prefix ${f} -devset /home/buck/net/experiments/wmt16/train/train.pairs -read_model paper/model.allnotf -idx2url ${f}.urlmapping npy/${f}*.GaleChurch.npy.gz npy/${f}*.Structure.npy.gz npy/${f}*.TextDistance.npy.gz npy/${f}*.LinkJaccard.npy.gz npy/${f}*.NGramJaccard_1.npy.gz npy/${f}*.NGramJaccard_2.npy.gz npy/${f}*.NGramJaccard_3.npy.gz npy/${f}*.NGramJaccard_4.npy.gz  npy/${f}*Linkage.npy.gz cos_notf_1/${f}.feats.Cosine_1.npy.gz cos_notf_2/${f}.feats.Cosine_2.npy.gz cos_notf_3/${f}.feats.Cosine_3.npy.gz cos_notf_4/${f}.feats.Cosine_4.npy.gz cos_notf_5/${f}.feats.Cosine_5.npy.gz cos_mono_1/${f}.feats.Cosine_1.npy.gz cos_mono_2/${f}.feats.Cosine_2.npy.gz cos_mono_3/${f}.feats.Cosine_3.npy.gz cos_mono_4/${f}.feats.Cosine_4.npy.gz cos_mono_5/${f}.feats.Cosine_5.npy.gz; done > paper/eval3.test.allnotf

for f in `cat test`; do /home/buck/net/build/DataCollection/docaligner/eval_model.py -prefix ${f} -devset /home/buck/net/experiments/wmt16/train/train.pairs -read_model paper/model.no_mt -idx2url ${f}.urlmapping npy/${f}*.GaleChurch.npy.gz npy/${f}*.Structure.npy.gz npy/${f}*.TextDistance.npy.gz npy/${f}*.LinkJaccard.npy.gz npy/${f}*.NGramJaccard_1.npy.gz npy/${f}*.NGramJaccard_2.npy.gz npy/${f}*.NGramJaccard_3.npy.gz npy/${f}*.NGramJaccard_4.npy.gz npy/${f}*Linkage.npy.gz cos_mono_1/${f}.feats.Cosine_1.npy.gz cos_mono_2/${f}.feats.Cosine_2.npy.gz cos_mono_3/${f}.feats.Cosine_3.npy.gz cos_mono_4/${f}.feats.Cosine_4.npy.gz cos_mono_5/${f}.feats.Cosine_5.npy.gz; done > paper/eval3.test.no_mt

for f in `cat test`; do /home/buck/net/build/DataCollection/docaligner/eval_model.py -prefix ${f} -devset /home/buck/net/experiments/wmt16/train/train.pairs -read_model paper/model.cos -idx2url ${f}.urlmapping cos_1/${f}.feats.Cosine_1.npy.gz cos_2/${f}.feats.Cosine_2.npy.gz cos_3/${f}.feats.Cosine_3.npy.gz cos_4/${f}.feats.Cosine_4.npy.gz cos_5/${f}.feats.Cosine_5.npy.gz cos_mono_1/${f}.feats.Cosine_1.npy.gz cos_mono_2/${f}.feats.Cosine_2.npy.gz cos_mono_3/${f}.feats.Cosine_3.npy.gz cos_mono_4/${f}.feats.Cosine_4.npy.gz cos_mono_5/${f}.feats.Cosine_5.npy.gz; done > paper/eval3.test.cos

for f in `cat test`; do /home/buck/net/build/DataCollection/docaligner/eval_model.py -prefix ${f} -devset /home/buck/net/experiments/wmt16/train/train.pairs -read_model paper/model.cheap -idx2url ${f}.urlmapping npy/${f}*.GaleChurch.npy.gz npy/${f}*.LinkJaccard.npy.gz npy/${f}*.NGramJaccard_1.npy.gz npy/${f}*.NGramJaccard_2.npy.gz npy/${f}*.NGramJaccard_3.npy.gz npy/${f}*.NGramJaccard_4.npy.gz  npy/${f}*Linkage.npy.gz cos_1/${f}.feats.Cosine_1.npy.gz cos_2/${f}.feats.Cosine_2.npy.gz cos_3/${f}.feats.Cosine_3.npy.gz cos_4/${f}.feats.Cosine_4.npy.gz cos_5/${f}.feats.Cosine_5.npy.gz cos_mono_1/${f}.feats.Cosine_1.npy.gz cos_mono_2/${f}.feats.Cosine_2.npy.gz cos_mono_3/${f}.feats.Cosine_3.npy.gz cos_mono_4/${f}.feats.Cosine_4.npy.gz cos_mono_5/${f}.feats.Cosine_5.npy.gz; done > paper/eval3.test.cheap

for f in `cat test`; do /home/buck/net/build/DataCollection/docaligner/eval_model.py -prefix ${f} -devset /home/buck/net/experiments/wmt16/train/train.pairs -read_model paper/model.mono_cheap -idx2url ${f}.urlmapping npy/${f}*.LinkJaccard.npy.gz npy/${f}*.NGramJaccard_1.npy.gz npy/${f}*.NGramJaccard_2.npy.gz npy/${f}*.NGramJaccard_3.npy.gz npy/${f}*.NGramJaccard_4.npy.gz  npy/${f}*Linkage.npy.gz cos_mono_1/${f}.feats.Cosine_1.npy.gz cos_mono_2/${f}.feats.Cosine_2.npy.gz cos_mono_3/${f}.feats.Cosine_3.npy.gz cos_mono_4/${f}.feats.Cosine_4.npy.gz cos_mono_5/${f}.feats.Cosine_5.npy.gz; done > paper/eval3.test.mono_cheap

# Now with matching
for f in `cat test`; do /home/buck/net/build/DataCollection/docaligner/eval_model.py -prefix ${f} -devset /home/buck/net/experiments/wmt16/train/train.pairs -read_model paper/model.all -matching -idx2url ${f}.urlmapping npy/${f}*.GaleChurch.npy.gz npy/${f}*.Structure.npy.gz npy/${f}*.TextDistance.npy.gz npy/${f}*.LinkJaccard.npy.gz npy/${f}*.NGramJaccard_1.npy.gz npy/${f}*.NGramJaccard_2.npy.gz npy/${f}*.NGramJaccard_3.npy.gz npy/${f}*.NGramJaccard_4.npy.gz  npy/${f}*Linkage.npy.gz cos_1/${f}.feats.Cosine_1.npy.gz cos_2/${f}.feats.Cosine_2.npy.gz cos_3/${f}.feats.Cosine_3.npy.gz cos_4/${f}.feats.Cosine_4.npy.gz cos_5/${f}.feats.Cosine_5.npy.gz cos_mono_1/${f}.feats.Cosine_1.npy.gz cos_mono_2/${f}.feats.Cosine_2.npy.gz cos_mono_3/${f}.feats.Cosine_3.npy.gz cos_mono_4/${f}.feats.Cosine_4.npy.gz cos_mono_5/${f}.feats.Cosine_5.npy.gz; done > paper/eval3.test.matching.all

for f in `cat test`; do /home/buck/net/build/DataCollection/docaligner/eval_model.py -prefix ${f} -devset /home/buck/net/experiments/wmt16/train/train.pairs -read_model paper/model.allnotf -matching -idx2url ${f}.urlmapping npy/${f}*.GaleChurch.npy.gz npy/${f}*.Structure.npy.gz npy/${f}*.TextDistance.npy.gz npy/${f}*.LinkJaccard.npy.gz npy/${f}*.NGramJaccard_1.npy.gz npy/${f}*.NGramJaccard_2.npy.gz npy/${f}*.NGramJaccard_3.npy.gz npy/${f}*.NGramJaccard_4.npy.gz  npy/${f}*Linkage.npy.gz cos_notf_1/${f}.feats.Cosine_1.npy.gz cos_notf_2/${f}.feats.Cosine_2.npy.gz cos_notf_3/${f}.feats.Cosine_3.npy.gz cos_notf_4/${f}.feats.Cosine_4.npy.gz cos_notf_5/${f}.feats.Cosine_5.npy.gz cos_mono_1/${f}.feats.Cosine_1.npy.gz cos_mono_2/${f}.feats.Cosine_2.npy.gz cos_mono_3/${f}.feats.Cosine_3.npy.gz cos_mono_4/${f}.feats.Cosine_4.npy.gz cos_mono_5/${f}.feats.Cosine_5.npy.gz; done > paper/eval3.test.matching.allnotf

for f in `cat test`; do /home/buck/net/build/DataCollection/docaligner/eval_model.py -prefix ${f} -devset /home/buck/net/experiments/wmt16/train/train.pairs -read_model paper/model.no_mt -matching -idx2url ${f}.urlmapping npy/${f}*.GaleChurch.npy.gz npy/${f}*.Structure.npy.gz npy/${f}*.TextDistance.npy.gz npy/${f}*.LinkJaccard.npy.gz npy/${f}*.NGramJaccard_1.npy.gz npy/${f}*.NGramJaccard_2.npy.gz npy/${f}*.NGramJaccard_3.npy.gz npy/${f}*.NGramJaccard_4.npy.gz npy/${f}*Linkage.npy.gz cos_mono_1/${f}.feats.Cosine_1.npy.gz cos_mono_2/${f}.feats.Cosine_2.npy.gz cos_mono_3/${f}.feats.Cosine_3.npy.gz cos_mono_4/${f}.feats.Cosine_4.npy.gz cos_mono_5/${f}.feats.Cosine_5.npy.gz; done > paper/eval3.test.matching.no_mt

for f in `cat test`; do /home/buck/net/build/DataCollection/docaligner/eval_model.py -prefix ${f} -devset /home/buck/net/experiments/wmt16/train/train.pairs -read_model paper/model.cos -matching -idx2url ${f}.urlmapping cos_1/${f}.feats.Cosine_1.npy.gz cos_2/${f}.feats.Cosine_2.npy.gz cos_3/${f}.feats.Cosine_3.npy.gz cos_4/${f}.feats.Cosine_4.npy.gz cos_5/${f}.feats.Cosine_5.npy.gz cos_mono_1/${f}.feats.Cosine_1.npy.gz cos_mono_2/${f}.feats.Cosine_2.npy.gz cos_mono_3/${f}.feats.Cosine_3.npy.gz cos_mono_4/${f}.feats.Cosine_4.npy.gz cos_mono_5/${f}.feats.Cosine_5.npy.gz; done > paper/eval3.test.matching.cos

for f in `cat test`; do /home/buck/net/build/DataCollection/docaligner/eval_model.py -prefix ${f} -devset /home/buck/net/experiments/wmt16/train/train.pairs -read_model paper/model.cheap -matching -idx2url ${f}.urlmapping npy/${f}*.GaleChurch.npy.gz npy/${f}*.LinkJaccard.npy.gz npy/${f}*.NGramJaccard_1.npy.gz npy/${f}*.NGramJaccard_2.npy.gz npy/${f}*.NGramJaccard_3.npy.gz npy/${f}*.NGramJaccard_4.npy.gz  npy/${f}*Linkage.npy.gz cos_1/${f}.feats.Cosine_1.npy.gz cos_2/${f}.feats.Cosine_2.npy.gz cos_3/${f}.feats.Cosine_3.npy.gz cos_4/${f}.feats.Cosine_4.npy.gz cos_5/${f}.feats.Cosine_5.npy.gz cos_mono_1/${f}.feats.Cosine_1.npy.gz cos_mono_2/${f}.feats.Cosine_2.npy.gz cos_mono_3/${f}.feats.Cosine_3.npy.gz cos_mono_4/${f}.feats.Cosine_4.npy.gz cos_mono_5/${f}.feats.Cosine_5.npy.gz; done > paper/eval3.test.matching.cheap

for f in `cat test`; do /home/buck/net/build/DataCollection/docaligner/eval_model.py -prefix ${f} -devset /home/buck/net/experiments/wmt16/train/train.pairs -read_model paper/model.mono_cheap -matching -idx2url ${f}.urlmapping npy/${f}*.LinkJaccard.npy.gz npy/${f}*.NGramJaccard_1.npy.gz npy/${f}*.NGramJaccard_2.npy.gz npy/${f}*.NGramJaccard_3.npy.gz npy/${f}*.NGramJaccard_4.npy.gz  npy/${f}*Linkage.npy.gz cos_mono_1/${f}.feats.Cosine_1.npy.gz cos_mono_2/${f}.feats.Cosine_2.npy.gz cos_mono_3/${f}.feats.Cosine_3.npy.gz cos_mono_4/${f}.feats.Cosine_4.npy.gz cos_mono_5/${f}.feats.Cosine_5.npy.gz; done > paper/eval3.test.matching.mono_cheap

# Now for train

for f in `cat train`; do /home/buck/net/build/DataCollection/docaligner/eval_model.py -prefix ${f} -devset /home/buck/net/experiments/wmt16/train/train.pairs -read_model paper/model.all -idx2url ${f}.urlmapping npy/${f}*.GaleChurch.npy.gz npy/${f}*.Structure.npy.gz npy/${f}*.TextDistance.npy.gz npy/${f}*.LinkJaccard.npy.gz npy/${f}*.NGramJaccard_1.npy.gz npy/${f}*.NGramJaccard_2.npy.gz npy/${f}*.NGramJaccard_3.npy.gz npy/${f}*.NGramJaccard_4.npy.gz  npy/${f}*Linkage.npy.gz cos_1/${f}.feats.Cosine_1.npy.gz cos_2/${f}.feats.Cosine_2.npy.gz cos_3/${f}.feats.Cosine_3.npy.gz cos_4/${f}.feats.Cosine_4.npy.gz cos_5/${f}.feats.Cosine_5.npy.gz cos_mono_1/${f}.feats.Cosine_1.npy.gz cos_mono_2/${f}.feats.Cosine_2.npy.gz cos_mono_3/${f}.feats.Cosine_3.npy.gz cos_mono_4/${f}.feats.Cosine_4.npy.gz cos_mono_5/${f}.feats.Cosine_5.npy.gz; done > paper/eval3.train.all

for f in `cat train`; do /home/buck/net/build/DataCollection/docaligner/eval_model.py -prefix ${f} -devset /home/buck/net/experiments/wmt16/train/train.pairs -read_model paper/model.allnotf -idx2url ${f}.urlmapping npy/${f}*.GaleChurch.npy.gz npy/${f}*.Structure.npy.gz npy/${f}*.TextDistance.npy.gz npy/${f}*.LinkJaccard.npy.gz npy/${f}*.NGramJaccard_1.npy.gz npy/${f}*.NGramJaccard_2.npy.gz npy/${f}*.NGramJaccard_3.npy.gz npy/${f}*.NGramJaccard_4.npy.gz  npy/${f}*Linkage.npy.gz cos_notf_1/${f}.feats.Cosine_1.npy.gz cos_notf_2/${f}.feats.Cosine_2.npy.gz cos_notf_3/${f}.feats.Cosine_3.npy.gz cos_notf_4/${f}.feats.Cosine_4.npy.gz cos_notf_5/${f}.feats.Cosine_5.npy.gz cos_mono_1/${f}.feats.Cosine_1.npy.gz cos_mono_2/${f}.feats.Cosine_2.npy.gz cos_mono_3/${f}.feats.Cosine_3.npy.gz cos_mono_4/${f}.feats.Cosine_4.npy.gz cos_mono_5/${f}.feats.Cosine_5.npy.gz; done > paper/eval3.train.allnotf

for f in `cat train`; do /home/buck/net/build/DataCollection/docaligner/eval_model.py -prefix ${f} -devset /home/buck/net/experiments/wmt16/train/train.pairs -read_model paper/model.no_mt -idx2url ${f}.urlmapping npy/${f}*.GaleChurch.npy.gz npy/${f}*.Structure.npy.gz npy/${f}*.TextDistance.npy.gz npy/${f}*.LinkJaccard.npy.gz npy/${f}*.NGramJaccard_1.npy.gz npy/${f}*.NGramJaccard_2.npy.gz npy/${f}*.NGramJaccard_3.npy.gz npy/${f}*.NGramJaccard_4.npy.gz npy/${f}*Linkage.npy.gz cos_mono_1/${f}.feats.Cosine_1.npy.gz cos_mono_2/${f}.feats.Cosine_2.npy.gz cos_mono_3/${f}.feats.Cosine_3.npy.gz cos_mono_4/${f}.feats.Cosine_4.npy.gz cos_mono_5/${f}.feats.Cosine_5.npy.gz; done > paper/eval3.train.no_mt

for f in `cat train`; do /home/buck/net/build/DataCollection/docaligner/eval_model.py -prefix ${f} -devset /home/buck/net/experiments/wmt16/train/train.pairs -read_model paper/model.cos -idx2url ${f}.urlmapping cos_1/${f}.feats.Cosine_1.npy.gz cos_2/${f}.feats.Cosine_2.npy.gz cos_3/${f}.feats.Cosine_3.npy.gz cos_4/${f}.feats.Cosine_4.npy.gz cos_5/${f}.feats.Cosine_5.npy.gz cos_mono_1/${f}.feats.Cosine_1.npy.gz cos_mono_2/${f}.feats.Cosine_2.npy.gz cos_mono_3/${f}.feats.Cosine_3.npy.gz cos_mono_4/${f}.feats.Cosine_4.npy.gz cos_mono_5/${f}.feats.Cosine_5.npy.gz; done > paper/eval3.train.cos

for f in `cat train`; do /home/buck/net/build/DataCollection/docaligner/eval_model.py -prefix ${f} -devset /home/buck/net/experiments/wmt16/train/train.pairs -read_model paper/model.cheap -idx2url ${f}.urlmapping npy/${f}*.GaleChurch.npy.gz npy/${f}*.LinkJaccard.npy.gz npy/${f}*.NGramJaccard_1.npy.gz npy/${f}*.NGramJaccard_2.npy.gz npy/${f}*.NGramJaccard_3.npy.gz npy/${f}*.NGramJaccard_4.npy.gz  npy/${f}*Linkage.npy.gz cos_1/${f}.feats.Cosine_1.npy.gz cos_2/${f}.feats.Cosine_2.npy.gz cos_3/${f}.feats.Cosine_3.npy.gz cos_4/${f}.feats.Cosine_4.npy.gz cos_5/${f}.feats.Cosine_5.npy.gz cos_mono_1/${f}.feats.Cosine_1.npy.gz cos_mono_2/${f}.feats.Cosine_2.npy.gz cos_mono_3/${f}.feats.Cosine_3.npy.gz cos_mono_4/${f}.feats.Cosine_4.npy.gz cos_mono_5/${f}.feats.Cosine_5.npy.gz; done > paper/eval3.train.cheap

for f in `cat train`; do /home/buck/net/build/DataCollection/docaligner/eval_model.py -prefix ${f} -devset /home/buck/net/experiments/wmt16/train/train.pairs -read_model paper/model.mono_cheap -idx2url ${f}.urlmapping npy/${f}*.LinkJaccard.npy.gz npy/${f}*.NGramJaccard_1.npy.gz npy/${f}*.NGramJaccard_2.npy.gz npy/${f}*.NGramJaccard_3.npy.gz npy/${f}*.NGramJaccard_4.npy.gz  npy/${f}*Linkage.npy.gz cos_mono_1/${f}.feats.Cosine_1.npy.gz cos_mono_2/${f}.feats.Cosine_2.npy.gz cos_mono_3/${f}.feats.Cosine_3.npy.gz cos_mono_4/${f}.feats.Cosine_4.npy.gz cos_mono_5/${f}.feats.Cosine_5.npy.gz; done > paper/eval3.train.mono_cheap

# Now with matching
for f in `cat train`; do /home/buck/net/build/DataCollection/docaligner/eval_model.py -prefix ${f} -devset /home/buck/net/experiments/wmt16/train/train.pairs -read_model paper/model.all -matching -idx2url ${f}.urlmapping npy/${f}*.GaleChurch.npy.gz npy/${f}*.Structure.npy.gz npy/${f}*.TextDistance.npy.gz npy/${f}*.LinkJaccard.npy.gz npy/${f}*.NGramJaccard_1.npy.gz npy/${f}*.NGramJaccard_2.npy.gz npy/${f}*.NGramJaccard_3.npy.gz npy/${f}*.NGramJaccard_4.npy.gz  npy/${f}*Linkage.npy.gz cos_1/${f}.feats.Cosine_1.npy.gz cos_2/${f}.feats.Cosine_2.npy.gz cos_3/${f}.feats.Cosine_3.npy.gz cos_4/${f}.feats.Cosine_4.npy.gz cos_5/${f}.feats.Cosine_5.npy.gz cos_mono_1/${f}.feats.Cosine_1.npy.gz cos_mono_2/${f}.feats.Cosine_2.npy.gz cos_mono_3/${f}.feats.Cosine_3.npy.gz cos_mono_4/${f}.feats.Cosine_4.npy.gz cos_mono_5/${f}.feats.Cosine_5.npy.gz; done > paper/eval3.train.matching.all

for f in `cat train`; do /home/buck/net/build/DataCollection/docaligner/eval_model.py -prefix ${f} -devset /home/buck/net/experiments/wmt16/train/train.pairs -read_model paper/model.allnotf -matching -idx2url ${f}.urlmapping npy/${f}*.GaleChurch.npy.gz npy/${f}*.Structure.npy.gz npy/${f}*.TextDistance.npy.gz npy/${f}*.LinkJaccard.npy.gz npy/${f}*.NGramJaccard_1.npy.gz npy/${f}*.NGramJaccard_2.npy.gz npy/${f}*.NGramJaccard_3.npy.gz npy/${f}*.NGramJaccard_4.npy.gz  npy/${f}*Linkage.npy.gz cos_notf_1/${f}.feats.Cosine_1.npy.gz cos_notf_2/${f}.feats.Cosine_2.npy.gz cos_notf_3/${f}.feats.Cosine_3.npy.gz cos_notf_4/${f}.feats.Cosine_4.npy.gz cos_notf_5/${f}.feats.Cosine_5.npy.gz cos_mono_1/${f}.feats.Cosine_1.npy.gz cos_mono_2/${f}.feats.Cosine_2.npy.gz cos_mono_3/${f}.feats.Cosine_3.npy.gz cos_mono_4/${f}.feats.Cosine_4.npy.gz cos_mono_5/${f}.feats.Cosine_5.npy.gz; done > paper/eval3.train.matching.allnotf

for f in `cat train`; do /home/buck/net/build/DataCollection/docaligner/eval_model.py -prefix ${f} -devset /home/buck/net/experiments/wmt16/train/train.pairs -read_model paper/model.no_mt -matching -idx2url ${f}.urlmapping npy/${f}*.GaleChurch.npy.gz npy/${f}*.Structure.npy.gz npy/${f}*.TextDistance.npy.gz npy/${f}*.LinkJaccard.npy.gz npy/${f}*.NGramJaccard_1.npy.gz npy/${f}*.NGramJaccard_2.npy.gz npy/${f}*.NGramJaccard_3.npy.gz npy/${f}*.NGramJaccard_4.npy.gz npy/${f}*Linkage.npy.gz cos_mono_1/${f}.feats.Cosine_1.npy.gz cos_mono_2/${f}.feats.Cosine_2.npy.gz cos_mono_3/${f}.feats.Cosine_3.npy.gz cos_mono_4/${f}.feats.Cosine_4.npy.gz cos_mono_5/${f}.feats.Cosine_5.npy.gz; done > paper/eval3.train.matching.no_mt

for f in `cat train`; do /home/buck/net/build/DataCollection/docaligner/eval_model.py -prefix ${f} -devset /home/buck/net/experiments/wmt16/train/train.pairs -read_model paper/model.cos -matching -idx2url ${f}.urlmapping cos_1/${f}.feats.Cosine_1.npy.gz cos_2/${f}.feats.Cosine_2.npy.gz cos_3/${f}.feats.Cosine_3.npy.gz cos_4/${f}.feats.Cosine_4.npy.gz cos_5/${f}.feats.Cosine_5.npy.gz cos_mono_1/${f}.feats.Cosine_1.npy.gz cos_mono_2/${f}.feats.Cosine_2.npy.gz cos_mono_3/${f}.feats.Cosine_3.npy.gz cos_mono_4/${f}.feats.Cosine_4.npy.gz cos_mono_5/${f}.feats.Cosine_5.npy.gz; done > paper/eval3.train.matching.cos

for f in `cat train`; do /home/buck/net/build/DataCollection/docaligner/eval_model.py -prefix ${f} -devset /home/buck/net/experiments/wmt16/train/train.pairs -read_model paper/model.cheap -matching -idx2url ${f}.urlmapping npy/${f}*.GaleChurch.npy.gz npy/${f}*.LinkJaccard.npy.gz npy/${f}*.NGramJaccard_1.npy.gz npy/${f}*.NGramJaccard_2.npy.gz npy/${f}*.NGramJaccard_3.npy.gz npy/${f}*.NGramJaccard_4.npy.gz  npy/${f}*Linkage.npy.gz cos_1/${f}.feats.Cosine_1.npy.gz cos_2/${f}.feats.Cosine_2.npy.gz cos_3/${f}.feats.Cosine_3.npy.gz cos_4/${f}.feats.Cosine_4.npy.gz cos_5/${f}.feats.Cosine_5.npy.gz cos_mono_1/${f}.feats.Cosine_1.npy.gz cos_mono_2/${f}.feats.Cosine_2.npy.gz cos_mono_3/${f}.feats.Cosine_3.npy.gz cos_mono_4/${f}.feats.Cosine_4.npy.gz cos_mono_5/${f}.feats.Cosine_5.npy.gz; done > paper/eval3.train.matching.cheap

for f in `cat train`; do /home/buck/net/build/DataCollection/docaligner/eval_model.py -prefix ${f} -devset /home/buck/net/experiments/wmt16/train/train.pairs -read_model paper/model.mono_cheap -matching -idx2url ${f}.urlmapping npy/${f}*.LinkJaccard.npy.gz npy/${f}*.NGramJaccard_1.npy.gz npy/${f}*.NGramJaccard_2.npy.gz npy/${f}*.NGramJaccard_3.npy.gz npy/${f}*.NGramJaccard_4.npy.gz  npy/${f}*Linkage.npy.gz cos_mono_1/${f}.feats.Cosine_1.npy.gz cos_mono_2/${f}.feats.Cosine_2.npy.gz cos_mono_3/${f}.feats.Cosine_3.npy.gz cos_mono_4/${f}.feats.Cosine_4.npy.gz cos_mono_5/${f}.feats.Cosine_5.npy.gz; done > paper/eval3.train.matching.mono_cheap

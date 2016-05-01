#!/bin/bash

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

# echo $SHARDNAME
# echo $CRAWLNAME
# echo $OUTDIR

mkdir -p ${OUTDIR}

DONEFILE=${BASEDIR}/nonen_split.done

if [ ! -f ${DONEFILE} ]; then
    xzcat ${BASEDIR}/*.langsplit.xz | ${BINDIR}/monolingual/collect_lang_wmt.py \
        -da >(pigz -9 >${OUTDIR}/text.da.gz) \
        -nl >(pigz -9 >${OUTDIR}/text.nl.gz) \
        -fi >(pigz -9 >${OUTDIR}/text.fi.gz) \
        -fr >(pigz -9 >${OUTDIR}/text.fr.gz) \
        -de >(pigz -9 >${OUTDIR}/text.de.gz) \
        -iw >(pigz -9 >${OUTDIR}/text.iw.gz) \
        -it >(pigz -9 >${OUTDIR}/text.it.gz) \
        -ja >(pigz -9 >${OUTDIR}/text.ja.gz) \
        -ko >(pigz -9 >${OUTDIR}/text.ko.gz) \
        -no >(pigz -9 >${OUTDIR}/text.no.gz) \
        -pl >(pigz -9 >${OUTDIR}/text.pl.gz) \
        -pt >(pigz -9 >${OUTDIR}/text.pt.gz) \
        -ru >(pigz -9 >${OUTDIR}/text.ru.gz) \
        -es >(pigz -9 >${OUTDIR}/text.es.gz) \
        -sv >(pigz -9 >${OUTDIR}/text.sv.gz) \
        -zh >(pigz -9 >${OUTDIR}/text.zh.gz) \
        -cs >(pigz -9 >${OUTDIR}/text.cs.gz) \
        -el >(pigz -9 >${OUTDIR}/text.el.gz) \
        -is >(pigz -9 >${OUTDIR}/text.is.gz) \
        -lv >(pigz -9 >${OUTDIR}/text.lv.gz) \
        -lt >(pigz -9 >${OUTDIR}/text.lt.gz) \
        -ro >(pigz -9 >${OUTDIR}/text.ro.gz) \
        -hu >(pigz -9 >${OUTDIR}/text.hu.gz) \
        -et >(pigz -9 >${OUTDIR}/text.et.gz) \
        -xxx >(pigz -9 >${OUTDIR}/text.xxx.gz) \
        -un >(pigz -9 >${OUTDIR}/text.un.gz) \
        -bg >(pigz -9 >${OUTDIR}/text.bg.gz) \
        -hr >(pigz -9 >${OUTDIR}/text.hr.gz) \
        -sr >(pigz -9 >${OUTDIR}/text.sr.gz) \
        -ga >(pigz -9 >${OUTDIR}/text.ga.gz) \
        -gl >(pigz -9 >${OUTDIR}/text.gl.gz) \
        -tl >(pigz -9 >${OUTDIR}/text.tl.gz) \
        -tr >(pigz -9 >${OUTDIR}/text.tr.gz) \
        -uk >(pigz -9 >${OUTDIR}/text.uk.gz) \
        -hi >(pigz -9 >${OUTDIR}/text.hi.gz) \
        -mk >(pigz -9 >${OUTDIR}/text.mk.gz) \
        -bn >(pigz -9 >${OUTDIR}/text.bn.gz) \
        -id >(pigz -9 >${OUTDIR}/text.id.gz) \
        -la >(pigz -9 >${OUTDIR}/text.la.gz) \
        -ms >(pigz -9 >${OUTDIR}/text.ms.gz) \
        -ml >(pigz -9 >${OUTDIR}/text.ml.gz) \
        -cy >(pigz -9 >${OUTDIR}/text.cy.gz) \
        -ne >(pigz -9 >${OUTDIR}/text.ne.gz) \
        -te >(pigz -9 >${OUTDIR}/text.te.gz) \
        -sq >(pigz -9 >${OUTDIR}/text.sq.gz) \
        -ta >(pigz -9 >${OUTDIR}/text.ta.gz) \
        -be >(pigz -9 >${OUTDIR}/text.be.gz) \
        -jw >(pigz -9 >${OUTDIR}/text.jw.gz) \
        -oc >(pigz -9 >${OUTDIR}/text.oc.gz) \
        -ur >(pigz -9 >${OUTDIR}/text.ur.gz) \
        -bh >(pigz -9 >${OUTDIR}/text.bh.gz) \
        -gu >(pigz -9 >${OUTDIR}/text.gu.gz) \
        -th >(pigz -9 >${OUTDIR}/text.th.gz) \
        -ar >(pigz -9 >${OUTDIR}/text.ar.gz) \
        -ca >(pigz -9 >${OUTDIR}/text.ca.gz) \
        -eo >(pigz -9 >${OUTDIR}/text.eo.gz) \
        -eu >(pigz -9 >${OUTDIR}/text.eu.gz) \
        -ia >(pigz -9 >${OUTDIR}/text.ia.gz) \
        -kn >(pigz -9 >${OUTDIR}/text.kn.gz) \
        -pa >(pigz -9 >${OUTDIR}/text.pa.gz) \
        -gd >(pigz -9 >${OUTDIR}/text.gd.gz) \
        -sw >(pigz -9 >${OUTDIR}/text.sw.gz) \
        -sl >(pigz -9 >${OUTDIR}/text.sl.gz) \
        -mr >(pigz -9 >${OUTDIR}/text.mr.gz) \
        -mt >(pigz -9 >${OUTDIR}/text.mt.gz) \
        -vi >(pigz -9 >${OUTDIR}/text.vi.gz) \
        -fy >(pigz -9 >${OUTDIR}/text.fy.gz) \
        -sk >(pigz -9 >${OUTDIR}/text.sk.gz) \
        -zh_Hant >(pigz -9 >${OUTDIR}/text.zh-Hant.gz) \
        -fo >(pigz -9 >${OUTDIR}/text.fo.gz) \
        -su >(pigz -9 >${OUTDIR}/text.su.gz) \
        -uz >(pigz -9 >${OUTDIR}/text.uz.gz) \
        -am >(pigz -9 >${OUTDIR}/text.am.gz) \
        -az >(pigz -9 >${OUTDIR}/text.az.gz) \
        -ka >(pigz -9 >${OUTDIR}/text.ka.gz) \
        -ti >(pigz -9 >${OUTDIR}/text.ti.gz) \
        -fa >(pigz -9 >${OUTDIR}/text.fa.gz) \
        -bs >(pigz -9 >${OUTDIR}/text.bs.gz) \
        -si >(pigz -9 >${OUTDIR}/text.si.gz) \
        -nn >(pigz -9 >${OUTDIR}/text.nn.gz) \
        -xh >(pigz -9 >${OUTDIR}/text.xh.gz) \
        -zu >(pigz -9 >${OUTDIR}/text.zu.gz) \
        -gn >(pigz -9 >${OUTDIR}/text.gn.gz) \
        -st >(pigz -9 >${OUTDIR}/text.st.gz) \
        -tk >(pigz -9 >${OUTDIR}/text.tk.gz) \
        -ky >(pigz -9 >${OUTDIR}/text.ky.gz) \
        -br >(pigz -9 >${OUTDIR}/text.br.gz) \
        -tw >(pigz -9 >${OUTDIR}/text.tw.gz) \
        -yi >(pigz -9 >${OUTDIR}/text.yi.gz) \
        -so >(pigz -9 >${OUTDIR}/text.so.gz) \
        -ug >(pigz -9 >${OUTDIR}/text.ug.gz) \
        -ku >(pigz -9 >${OUTDIR}/text.ku.gz) \
        -mn >(pigz -9 >${OUTDIR}/text.mn.gz) \
        -hy >(pigz -9 >${OUTDIR}/text.hy.gz) \
        -lo >(pigz -9 >${OUTDIR}/text.lo.gz) \
        -sd >(pigz -9 >${OUTDIR}/text.sd.gz) \
        -rm >(pigz -9 >${OUTDIR}/text.rm.gz) \
        -af >(pigz -9 >${OUTDIR}/text.af.gz) \
        -lb >(pigz -9 >${OUTDIR}/text.lb.gz) \
        -my >(pigz -9 >${OUTDIR}/text.my.gz) \
        -km >(pigz -9 >${OUTDIR}/text.km.gz) \
        -bo >(pigz -9 >${OUTDIR}/text.bo.gz) \
        -dv >(pigz -9 >${OUTDIR}/text.dv.gz) \
        -chr >(pigz -9 >${OUTDIR}/text.chr.gz) \
        -syr >(pigz -9 >${OUTDIR}/text.syr.gz) \
        -lif >(pigz -9 >${OUTDIR}/text.lif.gz) \
        -or >(pigz -9 >${OUTDIR}/text.or.gz) \
        -as >(pigz -9 >${OUTDIR}/text.as.gz) \
        -co >(pigz -9 >${OUTDIR}/text.co.gz) \
        -ie >(pigz -9 >${OUTDIR}/text.ie.gz) \
        -kk >(pigz -9 >${OUTDIR}/text.kk.gz) \
        -ln >(pigz -9 >${OUTDIR}/text.ln.gz) \
        -mi >(pigz -9 >${OUTDIR}/text.mi.gz) \
        -wo >(pigz -9 >${OUTDIR}/text.wo.gz) \
        -ab >(pigz -9 >${OUTDIR}/text.ab.gz) \
        -aa >(pigz -9 >${OUTDIR}/text.aa.gz) \
        -ay >(pigz -9 >${OUTDIR}/text.ay.gz) \
        -ba >(pigz -9 >${OUTDIR}/text.ba.gz) \
        -bi >(pigz -9 >${OUTDIR}/text.bi.gz) \
        -dz >(pigz -9 >${OUTDIR}/text.dz.gz) \
        -fj >(pigz -9 >${OUTDIR}/text.fj.gz) \
        -kl >(pigz -9 >${OUTDIR}/text.kl.gz) \
        -ha >(pigz -9 >${OUTDIR}/text.ha.gz) \
        -ht >(pigz -9 >${OUTDIR}/text.ht.gz) \
        -ik >(pigz -9 >${OUTDIR}/text.ik.gz) \
        -iu >(pigz -9 >${OUTDIR}/text.iu.gz) \
        -ks >(pigz -9 >${OUTDIR}/text.ks.gz) \
        -rw >(pigz -9 >${OUTDIR}/text.rw.gz) \
        -mg >(pigz -9 >${OUTDIR}/text.mg.gz) \
        -na >(pigz -9 >${OUTDIR}/text.na.gz) \
        -om >(pigz -9 >${OUTDIR}/text.om.gz) \
        -rn >(pigz -9 >${OUTDIR}/text.rn.gz) \
        -sm >(pigz -9 >${OUTDIR}/text.sm.gz) \
        -sg >(pigz -9 >${OUTDIR}/text.sg.gz) \
        -sa >(pigz -9 >${OUTDIR}/text.sa.gz) \
        -ss >(pigz -9 >${OUTDIR}/text.ss.gz) \
        -ts >(pigz -9 >${OUTDIR}/text.ts.gz) \
        -tn >(pigz -9 >${OUTDIR}/text.tn.gz) \
        -vo >(pigz -9 >${OUTDIR}/text.vo.gz) \
        -za >(pigz -9 >${OUTDIR}/text.za.gz) \
        -kha >(pigz -9 >${OUTDIR}/text.kha.gz) \
        -sco >(pigz -9 >${OUTDIR}/text.sco.gz) \
        -lg >(pigz -9 >${OUTDIR}/text.lg.gz) \
        -gv >(pigz -9 >${OUTDIR}/text.gv.gz) \
        -sr_ME >(pigz -9 >${OUTDIR}/text.sr-ME.gz) \
        -ak >(pigz -9 >${OUTDIR}/text.ak.gz) \
        -ig >(pigz -9 >${OUTDIR}/text.ig.gz) \
        -mfe >(pigz -9 >${OUTDIR}/text.mfe.gz) \
        -haw >(pigz -9 >${OUTDIR}/text.haw.gz) \
        -ceb >(pigz -9 >${OUTDIR}/text.ceb.gz) \
        -ee >(pigz -9 >${OUTDIR}/text.ee.gz) \
        -gaa >(pigz -9 >${OUTDIR}/text.gaa.gz) \
        -blu >(pigz -9 >${OUTDIR}/text.blu.gz) \
        -kri >(pigz -9 >${OUTDIR}/text.kri.gz) \
        -loz >(pigz -9 >${OUTDIR}/text.loz.gz) \
        -lua >(pigz -9 >${OUTDIR}/text.lua.gz) \
        -luo >(pigz -9 >${OUTDIR}/text.luo.gz) \
        -new >(pigz -9 >${OUTDIR}/text.new.gz) \
        -ny >(pigz -9 >${OUTDIR}/text.ny.gz) \
        -os >(pigz -9 >${OUTDIR}/text.os.gz) \
        -pam >(pigz -9 >${OUTDIR}/text.pam.gz) \
        -nso >(pigz -9 >${OUTDIR}/text.nso.gz) \
        -raj >(pigz -9 >${OUTDIR}/text.raj.gz) \
        -crs >(pigz -9 >${OUTDIR}/text.crs.gz) \
        -tum >(pigz -9 >${OUTDIR}/text.tum.gz) \
        -ve >(pigz -9 >${OUTDIR}/text.ve.gz) \
        -war >(pigz -9 >${OUTDIR}/text.war.gz) \
        -nr >(pigz -9 >${OUTDIR}/text.nr.gz) \
        -zzb >(pigz -9 >${OUTDIR}/text.zzb.gz) \
        -zzp >(pigz -9 >${OUTDIR}/text.zzp.gz) \
        -zzh >(pigz -9 >${OUTDIR}/text.zzh.gz) \
        -tlh >(pigz -9 >${OUTDIR}/text.tlh.gz) \
        -zze >(pigz -9 >${OUTDIR}/text.zze.gz) \
        -xx_Zyyy >(pigz -9 >${OUTDIR}/text.xx-Zyyy.gz) \
        -xx_Latn >(pigz -9 >${OUTDIR}/text.xx-Latn.gz) \
        -xx_Grek >(pigz -9 >${OUTDIR}/text.xx-Grek.gz) \
        -xx_Cyrl >(pigz -9 >${OUTDIR}/text.xx-Cyrl.gz) \
        -xx_Armn >(pigz -9 >${OUTDIR}/text.xx-Armn.gz) \
        -xx_Hebr >(pigz -9 >${OUTDIR}/text.xx-Hebr.gz) \
        -xx_Arab >(pigz -9 >${OUTDIR}/text.xx-Arab.gz) \
        -xx_Syrc >(pigz -9 >${OUTDIR}/text.xx-Syrc.gz) \
        -xx_Thaa >(pigz -9 >${OUTDIR}/text.xx-Thaa.gz) \
        -xx_Deva >(pigz -9 >${OUTDIR}/text.xx-Deva.gz) \
        -xx_Beng >(pigz -9 >${OUTDIR}/text.xx-Beng.gz) \
        -xx_Guru >(pigz -9 >${OUTDIR}/text.xx-Guru.gz) \
        -xx_Gujr >(pigz -9 >${OUTDIR}/text.xx-Gujr.gz) \
        -xx_Orya >(pigz -9 >${OUTDIR}/text.xx-Orya.gz) \
        -xx_Taml >(pigz -9 >${OUTDIR}/text.xx-Taml.gz) \
        -xx_Telu >(pigz -9 >${OUTDIR}/text.xx-Telu.gz) \
        -xx_Knda >(pigz -9 >${OUTDIR}/text.xx-Knda.gz) \
        -xx_Mlym >(pigz -9 >${OUTDIR}/text.xx-Mlym.gz) \
        -xx_Sinh >(pigz -9 >${OUTDIR}/text.xx-Sinh.gz) \
        -xx_Thai >(pigz -9 >${OUTDIR}/text.xx-Thai.gz) \
        -xx_Laoo >(pigz -9 >${OUTDIR}/text.xx-Laoo.gz) \
        -xx_Tibt >(pigz -9 >${OUTDIR}/text.xx-Tibt.gz) \
        -xx_Mymr >(pigz -9 >${OUTDIR}/text.xx-Mymr.gz) \
        -xx_Geor >(pigz -9 >${OUTDIR}/text.xx-Geor.gz) \
        -xx_Hang >(pigz -9 >${OUTDIR}/text.xx-Hang.gz) \
        -xx_Ethi >(pigz -9 >${OUTDIR}/text.xx-Ethi.gz) \
        -xx_Cher >(pigz -9 >${OUTDIR}/text.xx-Cher.gz) \
        -xx_Cans >(pigz -9 >${OUTDIR}/text.xx-Cans.gz) \
        -xx_Ogam >(pigz -9 >${OUTDIR}/text.xx-Ogam.gz) \
        -xx_Runr >(pigz -9 >${OUTDIR}/text.xx-Runr.gz) \
        -xx_Khmr >(pigz -9 >${OUTDIR}/text.xx-Khmr.gz) \
        -xx_Mong >(pigz -9 >${OUTDIR}/text.xx-Mong.gz) \
        -xx_Hira >(pigz -9 >${OUTDIR}/text.xx-Hira.gz) \
        -xx_Kana >(pigz -9 >${OUTDIR}/text.xx-Kana.gz) \
        -xx_Bopo >(pigz -9 >${OUTDIR}/text.xx-Bopo.gz) \
        -xx_Hani >(pigz -9 >${OUTDIR}/text.xx-Hani.gz) \
        -xx_Yiii >(pigz -9 >${OUTDIR}/text.xx-Yiii.gz) \
        -xx_Ital >(pigz -9 >${OUTDIR}/text.xx-Ital.gz) \
        -xx_Goth >(pigz -9 >${OUTDIR}/text.xx-Goth.gz) \
        -xx_Dsrt >(pigz -9 >${OUTDIR}/text.xx-Dsrt.gz) \
        -xx_Qaai >(pigz -9 >${OUTDIR}/text.xx-Qaai.gz) \
        -xx_Tglg >(pigz -9 >${OUTDIR}/text.xx-Tglg.gz) \
        -xx_Hano >(pigz -9 >${OUTDIR}/text.xx-Hano.gz) \
        -xx_Buhd >(pigz -9 >${OUTDIR}/text.xx-Buhd.gz) \
        -xx_Tagb >(pigz -9 >${OUTDIR}/text.xx-Tagb.gz) \
        -xx_Limb >(pigz -9 >${OUTDIR}/text.xx-Limb.gz) \
        -xx_Tale >(pigz -9 >${OUTDIR}/text.xx-Tale.gz) \
        -xx_Linb >(pigz -9 >${OUTDIR}/text.xx-Linb.gz) \
        -xx_Ugar >(pigz -9 >${OUTDIR}/text.xx-Ugar.gz) \
        -xx_Shaw >(pigz -9 >${OUTDIR}/text.xx-Shaw.gz) \
        -xx_Osma >(pigz -9 >${OUTDIR}/text.xx-Osma.gz) \
        -xx_Cprt >(pigz -9 >${OUTDIR}/text.xx-Cprt.gz) \
        -xx_Brai >(pigz -9 >${OUTDIR}/text.xx-Brai.gz) \
        -xx_Bugi >(pigz -9 >${OUTDIR}/text.xx-Bugi.gz) \
        -xx_Copt >(pigz -9 >${OUTDIR}/text.xx-Copt.gz) \
        -xx_Talu >(pigz -9 >${OUTDIR}/text.xx-Talu.gz) \
        -xx_Glag >(pigz -9 >${OUTDIR}/text.xx-Glag.gz) \
        -xx_Tfng >(pigz -9 >${OUTDIR}/text.xx-Tfng.gz) \
        -xx_Sylo >(pigz -9 >${OUTDIR}/text.xx-Sylo.gz) \
        -xx_Xpeo >(pigz -9 >${OUTDIR}/text.xx-Xpeo.gz) \
        -xx_Khar >(pigz -9 >${OUTDIR}/text.xx-Khar.gz) \
        -xx_Bali >(pigz -9 >${OUTDIR}/text.xx-Bali.gz) \
        -xx_Xsux >(pigz -9 >${OUTDIR}/text.xx-Xsux.gz) \
        -xx_Phnx >(pigz -9 >${OUTDIR}/text.xx-Phnx.gz) \
        -xx_Phag >(pigz -9 >${OUTDIR}/text.xx-Phag.gz) \
        -xx_Nkoo >(pigz -9 >${OUTDIR}/text.xx-Nkoo.gz) \
        -xx_Sund >(pigz -9 >${OUTDIR}/text.xx-Sund.gz) \
        -xx_Lepc >(pigz -9 >${OUTDIR}/text.xx-Lepc.gz) \
        -xx_Olck >(pigz -9 >${OUTDIR}/text.xx-Olck.gz) \
        -xx_Vaii >(pigz -9 >${OUTDIR}/text.xx-Vaii.gz) \
        -xx_Saur >(pigz -9 >${OUTDIR}/text.xx-Saur.gz) \
        -xx_Kali >(pigz -9 >${OUTDIR}/text.xx-Kali.gz) \
        -xx_Rjng >(pigz -9 >${OUTDIR}/text.xx-Rjng.gz) \
        -xx_Lyci >(pigz -9 >${OUTDIR}/text.xx-Lyci.gz) \
        -xx_Cari >(pigz -9 >${OUTDIR}/text.xx-Cari.gz) \
        -xx_Lydi >(pigz -9 >${OUTDIR}/text.xx-Lydi.gz) \
        -xx_Cham >(pigz -9 >${OUTDIR}/text.xx-Cham.gz) \
        -xx_Lana >(pigz -9 >${OUTDIR}/text.xx-Lana.gz) \
        -xx_Tavt >(pigz -9 >${OUTDIR}/text.xx-Tavt.gz) \
        -xx_Avst >(pigz -9 >${OUTDIR}/text.xx-Avst.gz) \
        -xx_Egyp >(pigz -9 >${OUTDIR}/text.xx-Egyp.gz) \
        -xx_Samr >(pigz -9 >${OUTDIR}/text.xx-Samr.gz) \
        -xx_Lisu >(pigz -9 >${OUTDIR}/text.xx-Lisu.gz) \
        -xx_Bamu >(pigz -9 >${OUTDIR}/text.xx-Bamu.gz) \
        -xx_Java >(pigz -9 >${OUTDIR}/text.xx-Java.gz) \
        -xx_Mtei >(pigz -9 >${OUTDIR}/text.xx-Mtei.gz) \
        -xx_Armi >(pigz -9 >${OUTDIR}/text.xx-Armi.gz) \
        -xx_Sarb >(pigz -9 >${OUTDIR}/text.xx-Sarb.gz) \
        -xx_Prti >(pigz -9 >${OUTDIR}/text.xx-Prti.gz) \
        -xx_Phli >(pigz -9 >${OUTDIR}/text.xx-Phli.gz) \
        -xx_Orkh >(pigz -9 >${OUTDIR}/text.xx-Orkh.gz) \
        -xx_Kthi >(pigz -9 >${OUTDIR}/text.xx-Kthi.gz) \
        -xx_Batk >(pigz -9 >${OUTDIR}/text.xx-Batk.gz) \
        -xx_Brah >(pigz -9 >${OUTDIR}/text.xx-Brah.gz) \
        -xx_Mand >(pigz -9 >${OUTDIR}/text.xx-Mand.gz) \
        -xx_Cakm >(pigz -9 >${OUTDIR}/text.xx-Cakm.gz) \
        -xx_Merc >(pigz -9 >${OUTDIR}/text.xx-Merc.gz) \
        -xx_Mero >(pigz -9 >${OUTDIR}/text.xx-Mero.gz) \
        -xx_Plrd >(pigz -9 >${OUTDIR}/text.xx-Plrd.gz) \
        -xx_Shrd >(pigz -9 >${OUTDIR}/text.xx-Shrd.gz) \
        -xx_Sora >(pigz -9 >${OUTDIR}/text.xx-Sora.gz) \
        -xx_Takr >(pigz -9 >${OUTDIR}/text.xx-Takr.gz)
    touch ${DONEFILE}
fi

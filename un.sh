#!/bin/sh
#total=`xz --robot -l $1 | grep 'totals' | awk '{print $5}'`
total=`gzip -l $1 | grep tar | awk '{printf $2}'`
block=`expr $(expr $total / 51200) + 1`
tar --blocking-factor=$block --checkpoint=1 --checkpoint-action='exec=printf "$(expr $TAR_CHECKPOINT - 1)  \r\n"' -xpf $1 -C $2 | dialog --title Unpacking --gauge 请耐心等待解压完成 0 0

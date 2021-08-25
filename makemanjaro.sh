#!/bin/bash
echo 可忽略的错误提示有:
echo 'tar: ./: Cannot hard link to ‘./’: Permission denied (无root权限的手机常见，硬链接需要root权限)'
echo 'tar: Exiting with failure status due to previous errors (因为上一条，所以出现本条错误提示)'
echo '/bin/pacman-key: line 214: awk: command not found (下载的基础rootfs没有awk等命令，很快会安装)'
echo 'warning: could not get file information for xxx (因为第一条，所以出现本条错误提示)'
echo '/usr/lib/tmpfiles.d/systemd-tmp.conf:11: Failed to replace specifiers in '/tmp/systemd-private-%b-*': Permission denied'
echo 'Failed to check for chroot() environment: No such file or directory'
echo 'Skipped: Device manager is not running.'
echo 'Skipped: Current root is not booted'
echo
echo '5s后开始，5s内可以Ctrl+c停止执行'
sleep 5s
clear
read -p '请输入系统安装目标路径(例:/data/data/com.termux/manjarofs): ' ROOTFSPATH
mkdir -p $ROOTFSPATH ; cd $ROOTFSPATH ; wget https://mirrors.tuna.tsinghua.edu.cn/osdn/storage/g/m/ma/manjaro-arm/.rootfs/Manjaro-ARM-aarch64-latest.tar.gz ; proot --link2symlink tar -xpf *.tar.gz ; rm *.tar.gz ; rm -rf proc ; mkdir proc
temp=$(mktemp --tmpdir=$ROOTFSPATH)
echo '0.54 0.41 0.30 1/931 370386' > proc/.loadavg
echo 'cpu  1050008 127632 898432 43828767 37203 63 99244 0 0 0
cpu0 212383 20476 204704 8389202 7253 42 12597 0 0 0
cpu1 224452 24947 215570 8372502 8135 4 42768 0 0 0
cpu2 222993 17440 200925 8424262 8069 9 17732 0 0 0
cpu3 186835 8775 195974 8486330 5746 3 8360 0 0 0
cpu4 107075 32886 48854 8688521 3995 4 5758 0 0 0
cpu5 90733 20914 27798 1429573 2984 1 11419 0 0 0
intr 53261351 0 686 1 0 0 1 12 31 1 20 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 7818 0 0 0 0 0 0 0 0 255 33 1912 33 0 0 0 0 0 0 3449534 2315885 2150546 2399277 696281 339300 22642 19371 0 0 0 0 0 0 0 0 0 0 0 2199 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 2445 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 162240 14293 2858 0 151709 151592 0 0 0 284534 0 0 0 0 0 0 0 0 0 0 0 0 0 0 185353 0 0 938962 0 0 0 0 736100 0 0 1 1209 27960 0 0 0 0 0 0 0 0 303 115968 452839 2 0 0 0 0 0 0 0 0 0 0 0 0 0 160361 8835 86413 1292 0 0 0 0 0 0 0 0 0 0 0 0 0 0 3592 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 6091 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 35667 0 0 156823 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 138 2667417 0 41 4008 952 16633 533480 0 0 0 0 0 0 262506 0 0 0 0 0 0 126 0 0 1558488 0 4 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 2 2 8 0 0 6 0 0 0 10 3 4 0 0 0 0 0 3 0 0 0 0 0 0 0 0 0 0 0 20 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 12 1 1 83806 0 1 1 0 1 0 1 1 319686 2 8 0 0 0 0 0 0 0 0 0 244534 0 1 10 9 0 10 112 107 40 221 0 0 0 144
ctxt 90182396
btime 1595203295
processes 270853
procs_running 2
procs_blocked 0
softirq 25293348 2883 7658936 40779 539155 497187 2864 1908702 7229194 279723 7133925
' > proc/.stat
echo '284684.56 513853.46' > proc/.uptime
echo 'Linux version 5.4.0-faked (termux@androidos) (gcc version 4.9.x (Faked /proc/version by Proot-Distro) ) #1 SMP PREEMPT Fri Jul 10 00:00:00 UTC 2020' > proc/.version
echo 'nr_free_pages 146031
nr_zone_inactive_anon 196744
nr_zone_active_anon 301503
nr_zone_inactive_file 2457066
nr_zone_active_file 729742
nr_zone_unevictable 164
nr_zone_write_pending 8
nr_mlock 34
nr_page_table_pages 6925
nr_kernel_stack 13216
nr_bounce 0
nr_zspages 0
nr_free_cma 0
numa_hit 672391199
numa_miss 0
numa_foreign 0
numa_interleave 62816
numa_local 672391199
numa_other 0
nr_inactive_anon 196744
nr_active_anon 301503
nr_inactive_file 2457066
nr_active_file 729742
nr_unevictable 164
nr_slab_reclaimable 132891
nr_slab_unreclaimable 38582
nr_isolated_anon 0
nr_isolated_file 0
workingset_nodes 25623
workingset_refault 46689297
workingset_activate 4043141
workingset_restore 413848
workingset_nodereclaim 35082
nr_anon_pages 599893
nr_mapped 136339
nr_file_pages 3086333
nr_dirty 8
nr_writeback 0
nr_writeback_temp 0
nr_shmem 13743
nr_shmem_hugepages 0
nr_shmem_pmdmapped 0
nr_file_hugepages 0
nr_file_pmdmapped 0
nr_anon_transparent_hugepages 57
nr_unstable 0
nr_vmscan_write 57250
nr_vmscan_immediate_reclaim 2673
nr_dirtied 79585373
nr_written 72662315
nr_kernel_misc_reclaimable 0
nr_dirty_threshold 657954
nr_dirty_background_threshold 328575
pgpgin 372097889
pgpgout 296950969
pswpin 14675
pswpout 59294
pgalloc_dma 4
pgalloc_dma32 101793210
pgalloc_normal 614157703
pgalloc_movable 0
allocstall_dma 0
allocstall_dma32 0
allocstall_normal 184
allocstall_movable 239
pgskip_dma 0
pgskip_dma32 0
pgskip_normal 0
pgskip_movable 0
pgfree 716918803
pgactivate 68768195
pgdeactivate 7278211
pglazyfree 1398441
pgfault 491284262
pgmajfault 86567
pglazyfreed 1000581
pgrefill 7551461
pgsteal_kswapd 130545619
pgsteal_direct 205772
pgscan_kswapd 131219641
pgscan_direct 207173
pgscan_direct_throttle 0
zone_reclaim_failed 0
pginodesteal 8055
slabs_scanned 9977903
kswapd_inodesteal 13337022
kswapd_low_wmark_hit_quickly 33796
kswapd_high_wmark_hit_quickly 3948
pageoutrun 43580
pgrotated 200299
drop_pagecache 0
drop_slab 0
oom_kill 0
numa_pte_updates 0
numa_huge_pte_updates 0
numa_hint_faults 0
numa_hint_faults_local 0
numa_pages_migrated 0
pgmigrate_success 768502
pgmigrate_fail 1670
compact_migrate_scanned 1288646
compact_free_scanned 44388226
compact_isolated 1575815
compact_stall 863
compact_fail 392
compact_success 471
compact_daemon_wake 975
compact_daemon_migrate_scanned 613634
compact_daemon_free_scanned 26884944
htlb_buddy_alloc_success 0
htlb_buddy_alloc_fail 0
unevictable_pgs_culled 258910
unevictable_pgs_scanned 3690
unevictable_pgs_rescued 200643
unevictable_pgs_mlocked 199204
unevictable_pgs_munlocked 199164
unevictable_pgs_cleared 6
unevictable_pgs_stranded 6
thp_fault_alloc 10655
thp_fault_fallback 130
thp_collapse_alloc 655
thp_collapse_alloc_failed 50
thp_file_alloc 0
thp_file_mapped 0
thp_split_page 612
thp_split_page_failed 0
thp_deferred_split_page 11238
thp_split_pmd 632
thp_split_pud 0
thp_zero_page_alloc 2
thp_zero_page_alloc_failed 0
thp_swpout 4
thp_swpout_fallback 0
balloon_inflate 0
balloon_deflate 0
balloon_migrate 0
swap_ra 9661
swap_ra_hit 7872
' > proc/.vmstat
echo '#!/data/data/com.termux/files/usr/bin/bash

unset LD_PRELOAD
export RFSML=$(cd `dirname $0`; pwd)
export TLANG=C
export TUSER=0:0
export SHLX=bash
export THOME=/root
command="
proot \
	--kill-on-exit \
		--link2symlink \
		-i $TUSER \
		-r $RFSML \
		-b $RFSML \
		-b $RFSML/tmp:/dev/shm \
		-b $RFSML/proc/.vmstat:/proc/vmstat \
		-b $RFSML/proc/.version:/proc/version \
		-b $RFSML/proc/.uptime:/proc/uptime \
		-b $RFSML/proc/.stat:/proc/stat \
		-b $RFSML/proc/.loadavg:/proc/loadavg \
		-b /sys \
		-b /proc/self/fd:/dev/fd \
		-b /proc \
		-b /dev/urandom:/dev/random \
		-b /dev \
		--cwd=/root \
		-L \
		--kernel-release=5.4.0-faked \
		--sysvipc \
			/usr/bin/env \
				-i HOME=$THOME \
				PATH=/usr/local/sbin:/usr/local/bin:/bin:/usr/bin:/sbin:/usr/sbin:/usr/games:/usr/local/games \
				TERM=$TERM \
				LANG=$TLANG \
			/bin/$SHLX --login"
#执行命令行
test -z "$*" && exec $command || exec $command -c "$*"' > $temp
bash $temp 'echo "nameserver 8.8.8.8 " > /etc/resolv.conf'
bash $temp 'pacman-key --init ; pacman-key --populate archlinuxarm manjaro-arm'
bash $temp 'pacman-mirrors -c China -m rank'
bash $temp 'pacman -Syyu --noconfirm'
bash $temp 'pacman -S base base-devel --noconfirm'
bash $temp 'sed -i "s/#zh_CN/zh_CN/g" /etc/locale.gen ; locale-gen'
sed -i 's/TLANG=C/TLANG=zh_CN.UTF-8/g' $temp
bash $temp 'pacman-key --recv-keys 7931B6D628C8D3BA;pacman-key --finger 7931B6D628C8D3BA;pacman-key --lsign-key 7931B6D628C8D3BA'
echo '[arch4edu]
Server = https://mirrors.bfsu.edu.cn/arch4edu/$arch'>>$ROOTFSPATH/etc/pacman.conf
bash $temp 'pacman -Rscn fakeroot --noconfirm'
bash $temp 'pacman -Sy yay fakeroot-tcp --noconfirm'
mv $temp $ROOTFSPATH/manjaro; chmod +x $ROOTFSPATH/manjaro
ln -sf $ROOTFSPATH/manjaro $PREFIX/bin/manjaro
cd
clear
echo "正在进入rootfs"
echo "注意，之后进入执行manjaro(已将$ROOTFSPATH/manjaro链接到/data/data/com.termux/files/usr/bin/manjaro)"
echo "PS:建议新建一个用户(useradd username (username为用户名))，并修改$ROOTFSPATH/manjaro文件，将export TUSER=0:0中的0:0改为$ROOTFSPATH/etc/passwd文件中的UID:GID，例如1000:1000(特殊情况下为1001:1001)，并将THOME修改为/home/username(username为新建用户名)"
echo "PS:如果常用的话，建议修改/data/data/com.termux/manjarofs/manjaro文件，在command=xx命令行参数中的-b /dev下新建一行-b /sdcard，这会使真实设备的/sdcard可在rootfs系统中可访问"
echo "注意!!!如果加入-b /sdcard的话，就不要执行rm -rf /*，这会使你的个人文件丢失殆尽!!!如果想要执行rm -rf /*进行装x，请进入bellard.org/jslinux"
bash $ROOTFSPATH/manjaro

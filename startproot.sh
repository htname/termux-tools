#!/data/data/com.termux/files/usr/bin/bash

info() {
	echo "ROOTFS启动中。。。"
	echo "By 你的名字"
	sleep 0.25s
	echo "吧啦点什么"
	[ -n "$MayB" ] && echo "已映射/mnt/sdcard /mnt/termux"
	echo "正在启动pulseaudio..."
	pulseaudio --start #可选，启动pulseaudio服务，在$PREFIX/etc/pulse/default.pa最后一行加入 load-module module-native-protocol-tcp listen=0.0.0.0 auth-anonymous=1 可以打开音频服务，监听4713
}
unset LD_PRELOAD
export RFSML= #rootfs目录
export TLANG= #语言环境{可选C,zh_CN.UTF-8}
#可以修改登录用户
export TUSER= #用户UID:GID{可选0:0是root，一般情况1000:1000是普通用户，具体查看/etc/passwd}
#可以修改登录shell
export SHLX= #登录所用SHELL{可选bash,zsh,fish,ash....}
#可以修改登录目录
export THOME= #登录用户主目录，可选{/root,/home/username}

##删除下行注释，可以将手机目录进行映射，这里将/sdcard映射到/mnt/sdcard，termux目录映射到/etc/termux
#export MayB='-b /sdcard:/mnt/sdcard -b /data/data/com.termux/files:/mnt/termux'

command="
proot \
    --kill-on-exit \
    --link2symlink \
    -i $TUSER \
    -r $RFSML \
    -b /dev \
    -b /proc \
    -b /sys/class/power_supply/battery:/sys/class/power_supply/battery \
    -b $RFSML/prod/version:/proc/version \
    -b $RFSML$THOME:/dev/shm \
$MayB
    -w $THOME \
      /usr/bin/env \
        -i HOME=$THOME \
		PATH=/usr/local/sbin:/usr/local/bin:/bin:/usr/bin:/sbin:/usr/sbin:/usr/games:/usr/local/games
        TERM=$TERM \
        SHELL=$SHLX \
        LANG=$TLANG \
      /bin/$SHLX --login"
#执行命令行
test -z "$*" && info && exec $command || exec $command -c "$*"

##这里可以进行./startxxx apt update等等直接执行命令

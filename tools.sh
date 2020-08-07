#!/bin/env bash
clear
#获取信息
arch=$(uname -m)
os=$(uname -o)
kernel=$(uname -r)
if [ -x "$(command -v apt)" ]; then
	pm=apt
	pmi='apt install'
elif [ -x "$(command -v yum)" = "0" ]; then
	pm=yum
	pmi='yum install'
elif [ -x "$(type pacman)" ]; then
	pm=pacman
	pmi='pacman -S'
else
	pm=unknow
	pmi='echo 无法安装'
fi
check() {
	[ ! -x "$(command -v $1)" ] && echo -e "未安装$2，正在安装" && $pmi $2
}
check dialog dialog
#dialog --msgbox 欢迎～ 20 50
quit(){
	dialog --infobox 再见（〜^㉨^\)〜 0 0
	exit 0
}
trap "quit" HUP INT QUIT TRAP ABRT KILL TERM STOP
l1(){
choose=$(dialog --title MLTools --ok-label 确认 --cancel-label 退出 --clear --stdout --menu 请选择 20 50 2 \
	1 日用 \
	2 科技 \
	3 稀有 \
	4 测试 \
	5 开发 \
	6 关于及帮助)
[ "$?" != 0 ] && quit
case $choose in
	1)
		c1=$(dialog --title MLTools-日用 --ok-label 确认 --cancel-label 返回 --clear --stdout --menu 请选择 20 50 2 \
	1 系统信息 \
    2 更新软件 \
    3 系统监控 \
    4 软件换源 \
    5 底部键盘)
		[ "$?" != 0 ] && l1
		case $c1 in
			1)
				dialog --backtitle MLTools --ok-label 没毛病 --prgbox 系统信息 "printf '%s：%s\n' 架构 $arch 系统 $os 内核 $kernel 当前shell $(echo $SHELL | sed "s/$(echo $PREFIX | sed 's/\//\\\//g')//g")" 20 50
				l1
				;;
			2)
				l1
				;;
			3)
				l1
				;;
			4)
				l1
				;;
			5)
				l1
				;;
		esac
		;;
	2)
		;;
	3)
		;;
	4)
		;;
	5)
		;;
esac
}
l1

#!/bin/bash
trap 'printf "\e[K";printf "[  \e[32mOK\e[0m  ]\n";exit' 1 2 3 4 6 9 15
p=("[\e[31m*\e[0m     ]" "[\e[1;31m*\e[0m\e[31m*\e[0m    ]" "[\e[31m*\e[1;31m*\e[0m\e[31m*\e[0m   ]" "[ \e[31m*\e[1;31m*\e[0m\e[31m*\e[0m  ]" "[  \e[31m*\e[1;31m*\e[0m\e[31m*\e[0m ]" "[   \e[31m*\e[1;31m*\e[0m\e[31m*\e[0m]" "[    \e[31m*\e[1;31m*\e[0m]" "[     \e[31m*\e[0m]")
while :
do
for i in {0..7} {6..1}
do
	printf "${p[$i]} $(date "+%H:%M:%S")\r"
	sleep 0.25s
done
done


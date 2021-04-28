#!/bin/bash

#guess number game;
init() {
  echo " ################################### "
  echo "                                     "
  echo "        Guess Number Game            "
  echo "                                     "
  echo " ################################### "
}
game() {
  number=$(($RANDOM % 100))
  while :; do
    read -p "输入你要猜测的数字: " n1
    n2=$(echo $n1 | sed 's/[0-9]//g')
    if [ ! -z $n2 ]; then
      echo "你输入的不是一个数字."
      continue
    fi
    if [ $n1 == $number ]; then
      echo "你猜对了."
      read -p "你还想再玩一次么？（yes/no）" an1
      while true; do
        case $an1 in
        yes)
          game
          break
          ;;
        no)
          break
          ;;
        *)
          exit
          ;;
        esac
      done
      break
    elif [ $n1 -gt $number ]; then
      echo "猜大了."
      continue
    else
      echo "猜小了."
      continue
    fi
  done
}

while true; do
  init
  echo "1: Start Game "
  echo "0: exit       "
  read -p " please input 0-1:" NUM

  case $NUM in
  1)
    game
    break
    ;;
  0)
    break
    ;;
  esac

done

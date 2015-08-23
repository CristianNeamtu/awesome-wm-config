#!/bin/sh
ACTION=`zenity --list --radiolist --text="Select logout action" --title="Logout" --column "Choice" --column "Action" TRUE Shutdown FALSE Reboot`

if [ -n "${ACTION}" ];then
  case $ACTION in
  Shutdown)
    poweroff
    ;;
  Reboot)
    reboot
    ;;
  esac
fi
#! /bin/bash
## Simple tool to swith HTTP&HTTPS proxy on osx
## Before use this tool,
## you need to set you proxy server in network setting mannually
## and make sure grant NOPASSWD privilege to the operator.

if [ "No" == `networksetup -getwebproxy Wi-Fi | awk 'NR==1 {print $2}'` ]; then
   echo "Turning HTTP proxy on now.."
   sudo networksetup -setwebproxystate Wi-Fi on
else
   echo "Turning HTTP proxy off now.."
   sudo networksetup -setwebproxystate Wi-Fi off
fi

if [ "No" == `networksetup -getsecurewebproxy Wi-Fi | awk 'NR==1 {print $2}'` ]; then
   echo "Turning HTTPS proxy on now.."
   sudo networksetup -setsecurewebproxystate Wi-Fi on
else
   echo "Turning HTTPS proxy off now.."
   sudo networksetup -setsecurewebproxystate Wi-Fi off
fi

osascript -e 'tell application "Terminal" to quit' &
exit

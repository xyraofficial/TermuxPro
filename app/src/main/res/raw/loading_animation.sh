#!/data/data/com.termux/files/usr/bin/bash

# Simple loading animation
spinner=( '⠋' '⠙' '⠹' '⠸' '⠼' '⠴' '⠦' '⠧' '⠇' '⠏' )
echo -n "Loading Termux... "
for i in {1..20}; do
  echo -ne "\b${spinner[i%10]}"
  sleep 0.1
done
echo -e "\bDone!"

# Progress bar animation
echo -n "["
for i in {1..20}; do
  echo -n "#"
  sleep 0.05
done
echo "] 100%"
sleep 0.5
clear

#!/bin/bash
echo "All variables passed to the script: $@"
echo "Number of variables passed: $#"
echo "script name: $0"
echo "present working diredctory is $PWD"
echo "user running the script is $USER"
echo "home directory is $HOME"
echo "PID of the script is $$"
sleep 10 &
echo "PID of the last command ranin background is $!"

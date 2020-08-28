#!/bin/bash
set -x

### MKDIR
#log
mkdir -p ~/downloads/log/aria
mkdir -p ~/downloads/log/hh
mkdir -p ~/downloads/log/rclone
mkdir -p ~/downloads/log/youtubedl
#Hentai@Home
mkdir -p ~/downloads/hath
#download
mkdir -p ~/downloads/downloading
mkdir -p ~/downloads/completed
mkdir -p ~/downloads/watch
#software
mkdir -p ~/downloads/aria
mkdir -p ~/downloads/youtubedl
mkdir -p ~/downloads/u2
#rclone
mkdir -p ~/downloads/gd

### chmod +x 
chmod +x ~/downloads/script/*
chmod +x ~/downloads/script/alias/*
chmod +x ~/downloads/tool/*

##setup bashrc
cp ~/downloads/config/.bashrc ~/.bashrc



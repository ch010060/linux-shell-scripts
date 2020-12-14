#!/bin/bash

rclone move src: dst: --progress --checkers 4 --transfers 4 --use-mmap --buffer-size 0M --tpslimit 4 --no-traverse

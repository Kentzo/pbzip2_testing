#!/bin/bash
wget -P $1 http://dl.dropbox.com/u/1999451/dummy.mov
wget -P $1 http://dl.dropbox.com/u/1999451/dummy.sql

echo "Process dummy.mov"
pbzip2 -p$2 -vk $1/dummy.mov 2>$1/mov.log
echo "Process dummy.sql"
pbzip2 -p$2 -vk $1/dummy.sql 2>$1/sql.log
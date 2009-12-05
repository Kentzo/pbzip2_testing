#!/bin/bash
print_sizes()
{
    echo "Input file size: " >> $3
    ls -l $1 | awk '{print $5}' >> $3
    echo "Output file size: " >> $3
    ls -l $2 | awk '{print $5}' >> $3
}
wget -P $1 http://dl.dropbox.com/u/1999451/dummy.mov
wget -P $1 http://dl.dropbox.com/u/1999451/dummy.sql

pbzip2 -p$2 -vk $1/dummy.mov 2>$1/pbzip2.mov.log
print_sizes $1/dummy.mov $1/dummy.mov.bz2 $1/pbzip2.mov.log

pbzip2 -p$2 -vk $1/dummy.sql 2>$1/pbzip2.sql.log
print_sizes $1/dummy.sql $1/dummy.sql.bz2 $1/pbzip2.sql.log

(time 7za a $1/dummy.mov.7z $1/dummy.mov) 2>$1/p7zip.mov.log
print_sizes $1/dummy.mov $1/dummy.mov.7z $1/p7zip.mov.log

(time 7za a $1/dummy.sql.7z $1/dummy.sql) 2>$1/p7zip.sql.log
print_sizes $1/dummy.sql $1/dummy.sql.7z $1/p7zip.sql.log
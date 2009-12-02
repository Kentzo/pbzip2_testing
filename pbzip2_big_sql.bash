#!bin/bash

wget -P $1 http://download.wikimedia.org/enwiki/latest/enwiki-latest-stub-articles.xml.gz
echo "Decompress file"
gzip -d enwiki-latest-stub-articles.xml.gz

pbzip2 -p$2 -vk $1/enwiki-latest-stub-articles.xml 2>$1/big_sql.log

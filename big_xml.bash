#!bin/bash
print_sizes()
{
    echo "Input file size: " >> $3
    ls -l $1 | awk '{print $5}' >> $3
    echo "Output file size: " >> $3
    ls -l $2 | awk '{print $5}' >> $3
}

wget -P $1 http://download.wikimedia.org/enwiki/latest/enwiki-latest-stub-articles.xml.gz
gzip -d enwiki-latest-stub-articles.xml.gz

pbzip2 -p$2 -vk $1/enwiki-latest-stub-articles.xml 2>$1/bzip2.enwiki-latest-stub-articles.xml.log
print_sizes $1/enwiki-latest-stub-articles.xml $1/enwiki-latest-stub-articles.xml.bz2 $1/bzip2.enwiki-latest-stub-articles.xml.log

(time 7za a $1/enwiki-latest-stub-articles.xml.7z $1/enwiki-latest-stub-articles.xml) 2>$1/p7zip.enwiki-latest-stub-articles.xml.log
print_sizes $1/enwiki-latest-stub-articles.xml $1/enwiki-latest-stub-articles.xml.7z $1/p7zip.enwiki-latest-stub-articles.xml.log
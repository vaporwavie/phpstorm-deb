#!/bin/bash

NUMBER_OF_FILES_PS=`ls -1 PhpStorm-*.tar.gz 2> /dev/null | wc -l`
NUMBER_OF_FILES_PC=`ls -1 PyCharm-*.tar.gz 2> /dev/null | wc -l`

if [ "$NUMBER_OF_FILES_PS" == "0" ]
then
	echo "There are no PhpStorm source packages in this directory."
	echo "Please go to https://www.jetbrains.com/phpstorm/download/index.html to download the .tar.gz file and try again."
	exit
fi

if [ $NUMBER_OF_FILES_PC == "0" ]
then
	echo "There are no PyCharm source packages in this directory."
	echo "Please go to https://www.jetbrains.com/pycharm/download/index.html to download the .tar.gz file and try again."
	exit
fi

if [ "$NUMBER_OF_FILES_PS" != "1" ]
then
	echo "There are multiple PhpStorm source packages in this directory."
	echo "Please remove old .tar.gz files and try again."
	exit
fi


if [ "$NUMBER_OF_FILES_PS" != "1" ]
then
	echo "There are multiple PyCharm source packages in this directory."
	echo "Please remove old .tar.gz files and try again."
	exit
fi

VERSION=`ls PhpStorm-*.tar.gz | sed -r 's/PhpStorm-([0-9\.]+).tar.gz/\1/'`

cp debian/changelog.dist debian/changelog

dch -v $VERSION -m "New upstream version" -D stable

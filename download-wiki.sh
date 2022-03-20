#!/bin/bash

BASENAME="enwiki-2021"
BASEURL="http://data.law.di.unimi.it/webdata"

mkdir -p graph

echo "Downloading graph and entities..."
for ext in properties graph md5sums fcl; do
	echo -e '\t' graph/$BASENAME.$ext
	wget -qc --output-document graph/$BASENAME.$ext $BASEURL/$BASENAME/$BASENAME.$ext
done

#!/bin/bash
#**************************
# Authored by Jorge Cabrera
#**************************
if [ ! $# -eq 1 ]; then
	echo "Cantidad de parametros incorrecta"
	exit 0
fi
if [ ! -d tmp ]; then
	mkdir "tmp"
fi
nombreArchivo=$(echo "$1" | sed 's@^\([^.]*\)\..*$@\1@')
sed '/^\s*$/d' "$1" | sed 's/\t//g;s/ //g' > "tmp/$nombreArchivo-+-.txt"

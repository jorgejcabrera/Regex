#!/bin/bash
#**************************
# Authored by Jorge Cabrera
#**************************
#$1: LOCALIDAD
#$2: DIA
if [ ! "$#" -eq 2 ]; then
	echo "Cantidad de parametros incorrecta"
	exit 0
fi
if [ ! -z "$(echo $1 | sed 's/[a-zA-Z ]*//')" ] || [ ! -z "$(echo $2 | sed 's/[a-zA-Z]*//')" ]; then
	echo "Los parametros tienen un formato inadecuado"
	exit 0
fi
 sed -n "s/^\([^;]*\);\([^;]*\);\([^;]*\);\([^_]*\)_\([^:]*\):$1$/\2/p" "DATOS.dat" | grep -o "$2" | wc -l
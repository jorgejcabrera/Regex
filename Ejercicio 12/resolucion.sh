#!/bin/bash
#**************************
# Authored by Jorge Cabrera
#**************************
if [ ! "$#" -eq 2 ]; then
	echo "Cantidad de parámetros incorrecta"
	exit 0
fi
if [ ! -z "$(echo $1 | sed 's/[a-zA-Z ]*//')" ] || [ ! -z "$(echo $2 | sed 's/[0-9]*//')" ]; then
	echo "Parametros incorrectos"
	exit 0
fi
GANO=$(sed -n "s/^\([^;]*\);$1;\(.*\)$/\2/p" "Catalogo_de_premios.dat" | grep "$2")
if [ ! -z "$GANO" ]; then
	echo "GANO"
	exit 1
fi
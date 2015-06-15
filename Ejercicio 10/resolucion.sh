#!/bin/bash
#**************************
# Authored by Jorge Cabrera
#**************************
if [ ! "$#" -eq 1 ]; then
	echo "Cantidad de parametros incorrecta"
	exit 0
fi
if [ ! -z "$(echo "$1" | sed 's/[0-9]*//')" ]; then
	echo "Parametro incorrecto, debe ser un numero"
	exit 0
fi
segmento=$(grep "^\([^;]*\);$1$" "Segmento_Intereses.dat" | sed 's/^\([^;]*\);\([^;]*\)$/\1/')
grep "^\([^;]*\);\([^;]*\);$segmento;\([^;]*\);\([^;]*\)$" "Registro_Navegacion.dat" | sed 's/^\([^;]*\);\([^;]*\);.*$/\1|\2/g' | sort -u
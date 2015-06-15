#!/bin/bash
#**************************
# Authored by Jorge Cabrera
#**************************
if [ ! "$#" -eq 1 ]; then
	echo "La cantidad de parametros es incorrecta"
	exit 0
fi
isNumber=$(echo "$1" | sed 's/[0-9]*//g')
if [ ! -z "$isNumber" ]; then
	echo "La variable no es un numero"
	exit 0
fi
tipoPlazoFijo=$(grep "^\([^|]*\)|$1|\([^|]*\)|\([^|]*\)|\([^|]*\)|\([^|]*\)$" "MaestrosPlazoFijos.dat" | sed 's/^\([^|]*\)|\([^|]*\)|\([^|]*\)|\([^|]*\)|\([^|]*\)|\([^|]*\)$/\4/')
grep "^$tipoPlazoFijo|\([^|]*\)|\([^|]*\)$" "CuentasPorTiposPlazoFijos.dat" | sed 's/^\([^|]*\)|\([^|]*\)|\([^|]*\)$/\2.\3/'
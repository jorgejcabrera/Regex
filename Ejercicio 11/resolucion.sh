#!/bin/bash
#**************************
# Authored by Jorge Cabrera
#**************************
if [ ! "$#" -eq 3 ]; then
	echo "Cantidad de parámetros incorrecta"
	exit 0
fi 
if [ ! -z "$(echo "$1" | sed 's/[a-zA-Z]*//')" ] || [ ! -z "$(echo "$2" | sed 's/[a-zA-Z]*//')" ] || [ ! -z "$(echo "$3" | sed 's/[a-zA-Z]*//')" ]; then
	echo "Parametros incorrectos"
	exit 0
fi
codigoDeEspecialidad=$(grep "^\([^:]*\):$2:$3$" "Especialidades.dat" | sed 's/^\([^:]*\):\([^:]*\):\([^:]*\)$/\1/')
grep "^\([^+]*\)+\([^+]*\)+$codigoDeEspecialidad+$1+\([^+]*\)$" "Prestadores.lis" | sed 's@^\([^+]*\)+\([^+]*\)+\([^+]*\)+\([^+]*\)+\([^+]*\)$@\2 \5@'
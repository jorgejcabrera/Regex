#!/bin/bash
#**************************
# Authored by Jorge Cabrera
#**************************
if [ ! $# -eq 1 ]; then
	echo "Cantidad de parametros invalida"
	exit 0
fi
numeroPatente="$1"
marca=$(grep "^\([^:]*\):$numeroPatente:.*$" RODADOS.dat | sed 's@^.*:\([^:]*\)$@\1@')
cuit=$(grep "^\([^:]*\):$numeroPatente:.*$" RODADOS.dat | sed 's@^.*:\([^:]*\):\([^:]*\):\([^:]*\)$@\1@')
nombre=$(grep "^.*;$cuit;\([^;]*\);\([^;]*\);\([^;]*\)$" TELEFONOS.dat | sed 's@^.*;\([^;]*\);\([^;]*\)$@\1@')
numeroDeTelefono=$(grep "^.*;$cuit;\([^;]*\);\([^;]*\);\([^;]*\)$" TELEFONOS.dat | sed 's@^.*;\([^;]*\);\([^;]*\)$@\2@')
echo "$nombre $cuit $numeroDeTelefono"
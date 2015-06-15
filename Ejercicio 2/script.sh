#!/bin/bash
#**************************
# Authored by Jorge Cabrera
#**************************
#filtrar importes mayores a 3000.01
if [ ! $# -eq 1 ]; then
	echo "Cantidad de parametros invalida"
fi
nroCliente="$1"
primerRango="3000.0[1-9]*"					#filtramos desde 3000.01-3000.09
segundoRango="3000.[1-9][0-9]*"				#filtramos desde 3000.10-3000.99
tercerRango="300[1-9].[0-9]*"				#filtramos desde 3001.00-3009.99
cuartoRango="30[1-9][0-9].[0-9]*"			#filtramos desde 3010.00-3099.99
quintoRango="3[1-9][0-9]\{2\}.[0-9]*"		#filtramos desde 3100.00-3999.99
sextoRango="[4-9][0-9]\{3\}.[0-9]*"			#filtramos desde 4000.00-9999.99
septimoRango="[0-9]\{5\}.[0-9]"				#filtramos desde 10000.00-

nombreCliente=$(grep "^$nroCliente.*$" CLIENTES.dat | sed -n 's/^\([^:]*\):\([^:]*\):\([^:]*\):.*$/\3/p')
grep "^$nroCliente;\([^;]*\);\([^;]*\);\($primerRango\|$segundoRango\|$tercerRango\|$cuartoRango\|$quintoRango\|$sextoRango\|$septimoRango\);.*$" "FACTURAS.dat" | sed "s/^\([^;]*\);\([^;]*\);\([^;]*\);\([^;]*\);.*$/$nombreCliente \1 \2 \4/" > "salida.txt"
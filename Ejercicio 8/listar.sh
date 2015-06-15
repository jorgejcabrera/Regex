#!/bin/bash
#**************************
# Authored by Jorge Cabrera
#**************************
#FILTRAR RESULTADOS MAYORES A 987,65
#sed -n option will not print anything unless an explicit request to print is found
#sed /p print flag
sed -n 's/^\([^=]*\)=\([^=]*\)=\(987,6[6-9]*\|98[8-9],[0-9]*\|[0-9]\{4,\},[0-9]*\)=.*$/\1 \2 \3/p' "StockValorizado.dat"

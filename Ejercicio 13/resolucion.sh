#!/bin/bash
#**************************
# Authored by Jorge Cabrera
#**************************
primerRango="\(987,6[5-9]\)"				#987,65-987,69
segundoRango="\(987,[7-9][0-9]\)"			#987,70-987,99
tercerRango="\(9[8-9][8-9],[0-9]\{2\}\)"	#988,00-999,99
cuartoRango="\([0-9]\{4,\},[0-9]\{2\}\)"	#1000,00-
grep -o "^\([^=]*\)=\([^=]*\)=\($primerRango\|$segundoRango\|$tercerRango\|$cuartoRango\)$" "StockValorizado.dat" | sed 's/^\([^=]*\)=\([^=]*\)=\([^=]*\)$/\3/g'
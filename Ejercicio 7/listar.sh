#!/bin/bash
#**************************
# Authored by Jorge Cabrera
#**************************
primerRango="[0-7][0-9]"	#filtramos de 00-79
segundoRango="8[0-6]"		#filtramos de 80-86
grep "^.*?\($primerRango\|$segundoRango\)?\([^?]*\)$" "Funciones.dat" | sed -n 's/^\([^?]*\)?\([^?]*\)?\([^?]*\)?\([^?]*\)?\([0-9]*\)?\([^?]*\)$/Pelicula:\1 Fecha:\4 Expectadores:\5 Cine:\6/p'
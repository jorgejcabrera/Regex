#!/bin/bash
#**************************
# Authored by Jorge Cabrera
#**************************
primerRango="20[1-9]"			#filtramos de 201-209
segundoRango="2[1-9][0-9]"		#filtramos de 210-299
tercerRango="[3-9][0-9]\{2\}"	#filtramos de 300-999
cuartoRango="[0-9]\{4,\}"		#filtramos de 1000-		
grep "^\([^]]*\)]\([0-9]*\)]\([a-zA-Z ]*\)]\($primerRango\|$segundoRango\|$tercerRango\|$cuartoRango\)]\([a-zA-Z ]*\)]\([a-zA-Z]*\)]ACTIVO]\([^]]*\)]\([^]]*\)]\([^]]*\)]JUBILACION]\([^]]*\)]\([^]]*\)$" "TramitesAportantes.txt" | sort -u | wc -l
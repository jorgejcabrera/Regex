#!/bin/bash
#**************************
# Authored by Jorge Cabrera
#**************************

if [ ! $# -eq 1 ]; then
	echo "Cantidad de parametros incorrecta"
	exit 0
fi
tipoDeSolicitud="$1"
#hacemos un sort -u (unique) para eliminar duplicados ya que solo puede haber un relacion activa
codigoDeNovedad=$(grep "^\([^/]*\)/$tipoDeSolicitud/S/.*$" "TRADUCTOR.info" | sed -n 's/^\([^/]*\)\/.*$/\1/p' | sort -u)
novedad=$(grep "^$codigoDeNovedad+.*$" NOVEDADES.dat)
nroLinea=$(echo ""$novedad"" | sed 's/^.*+\([^+]*\)+\([^+]*\)+\([^+]*\)$/\1/g')
operadorNuevo=$(echo "$novedad" | sed 's/^.*+\([^+]*\)+\([^+]*\)+\([^+]*\)$/\2/g')
operadorViejo=$(echo "$novedad" | sed 's/^.*+\([^+]*\)+\([^+]*\)+\([^+]*\)$/\3/g')
fechaDesde=$(echo "$novedad" | sed 's/^\([^+]*\)+\([^+]*\)+\([^+]*\)+.*$/\2/g')
fechaHasta=$(echo "$novedad" | sed 's/^\([^+]*\)+\([^+]*\)+\([^+]*\)+.*$/\3/g')
echo "$codigoDeNovedad:$nroLinea:$operadorNuevo:$operadorViejo:$fechaDesde:$fechaHasta" > "NOVEDADES_INBOUND.dat"
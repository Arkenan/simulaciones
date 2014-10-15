#!/bin/bash

#crea la carpeta de output.
if [ ! -d './output' ]
then 
	mkdir output & echo "Creando carpeta de output..."
else
	if [ -f './output/animacion.mp4' ]
	then
		read -p "Ya existe una animación, desea sobreescribirla? [s/n]: " resp
		while [ ! $resp = "s" ] && [ ! $resp = "n" ]
		do
			read -p "Por favor responda con 's' o 'n' y en minuscula: " resp
		done
		if [ $resp = 'n' ]
		then
			echo "Cerrando aplicación."
			return
		fi
	fi
fi

echo "Ploteando y Guardando imágenes..."
octave sim.m
echo "Listo."

cd output

echo "Redimensionando imagenes..."
#Todas las imagenes del mismo tamaño Y MISMO TIPO DE COLOR.
mogrify -resize 1200X900 -define png:color-type=2 *.png
echo "Listo."

echo"Convirtiendo fotogramas a video..."
#conversion a video
avconv -i "%05d.png" -r 25  animacion.mp4 
echo "Fin."

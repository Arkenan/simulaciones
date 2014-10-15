#!/bin/bash

#crea la carpeta de output.
if [ ! -d './output' ]
then mkdir output & echo "Creando carpeta de output..."
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

#!/bin/bash

#crea la carpeta de output.
if [ ! -d './output' ]
then mkdir output
fi

octave sim.m

cd output

#Todas las imagenes del mismo tamaño Y MISMO TIPO DE COLOR.
mogrify -resize 1200X900 -define png:color-type=2 *.png

#conversion a video
avconv -i "%05d.png" -r 25  animacion.mp4 

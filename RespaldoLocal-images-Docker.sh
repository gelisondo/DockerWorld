#!/bin/bash

IMAGENES=`docker images | cut -d " " -f 1 | grep -v "REPOSITORY"`

for line in $IMAGENES
do

    ImagenSINSLASH=`echo $line | tr "/" "-"`
    echo "Se realizara BK de la imagen $line"
    docker save $line > $ImagenSINSLASH.tar
done
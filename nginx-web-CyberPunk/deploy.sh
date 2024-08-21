#!/bin/bash

echo "##############################################################################################################"
echo "# You can execute this script with 2 atributtes, the firs pass the name IMAGE/CT and the second pass the TAG #"
echo "# If you dont pass arguments when execute this script, use the default name (wcpunk) and tag (1.0)           #"
echo "# If you want to pass the expecific port to comunicate with docker add the thert argument, example 8082      #"
echo "# for default use 8081                                                                                       #"
echo "# Example: ./deploy imagename tagname 8083                                                                   #"
echo "##############################################################################################################"
sleep 2


UID=`id -u`

if [ $UID -nq 0 ];
then
    echo "You need root privileges to run this script"
    sleep 2
    exit 0
fi


#VERIFICAMOS QUE EXISTAN ARGUMENTOS SI NO ES ASÍ UTILIZAREMOS NOMBRES POR DEFECTO.
if [ -z $($1) ];
then
    echo "is unset or set to the empty string"
    #Set default value
    IMAGENAME="wcpunk"
else
    echo "Set name with argument, $1"
    IMAGENAME="$1"
fi

#Verify the second arguments, or set default name
if [ -z $($2) ];
then
    echo "is unset or set to the empty string"
    #Set default value
    IMAGENAME="1.0"
else
    echo "Set name with argument, $2"
    IMAGENAME="$2"
fi


#Alocate all CT name, when run state.
#Filtramos el nombre de la imagen con un grep y agregamos otro grep para filtrar el TAG. De esta manera obtenemos la imagen puntual que queremos recrear.
#Este doble filtro se aplica por que es posible que tengamos una imagen con el mismo nombre pero con diferente TAG.

OSIMAGES=`docker images | grep $IMAGENNAME | grep $IMAGETAG`
OSIMAGEFILTER=`echo $OSIMAGES | cut -d " " -f 1`
OSIMAGEFILTERTAG=`echo $OSIMAGES | cut -d " " -f 2`

if [ $OSIMAGEFILTER -z ];
then
    echo "The imagen name or tag don't exist, generate new imagens without delete previus version"
    echo ""
    echo "Make the images with dockerfile instructions"
    sleep 1
    docker build -t IMAGENAME:IMAGETAG .

    echo "Run docker images to make a container IMAGENAME"
    sleep 1
    docker run -it --rm -d -p 8081:80 --name IMAGENAME IMAGENAME:IMAGETAG 

else
    echo "Delete this images: $OSIMAGEFILTER"
    docker rmi $OSIMAGEFILTER:$OSIMAGEFILTERTAG

    echo "Make the images with dockerfile instructions"
    sleep 1
    docker build -t IMAGENAME:IMAGETAG .


    echo "Run docker images to make a container IMAGENAME"
    sleep 1
    docker run -it --rm -d -p 8081:80 --name IMAGENAME IMAGENAME:IMAGETAG 
fi



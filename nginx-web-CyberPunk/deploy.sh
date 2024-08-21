#!/bin/bash

UID=`id -u`

if [ $UID -nq 0 ];
then
    echo "You need a id 0 to run this script"
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


# Make the images with dockerfile instructions
docker build -t IMAGENAME:IMAGETAG .

# Run docker images to make a container IMAGENAME
docker run -it --rm -d -p 8081:80 --name IMAGENAME IMAGENAME:IMAGETAG 


#Alocate all CT name, when run state.
CTRUN=`docker images | cut -d " " -f 1 | grep -v "REPOSITORY"`

for ctname in $(echo $CTRUN)
do

    if [ $IMAGENAME -eq $ctname ];
    then

        echo "Delete this images: $ctname"
        docker rmi $IMAGENAME:$IMAGETAG

    fi


done 


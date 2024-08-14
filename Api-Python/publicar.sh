#!/bin/bash
#Variables:
USUARIO="1world2geeks"
REPO="testing"
IMAGEN="api-pytest-public"
VERSION="1.0"

echo "Es momento de publicar tu imagen"

docker build -t $USUARIO/$IMAGEN:$VERSION .
if [ $? -ne 0 ];
then 
  echo "Error al construir la imagen $IMAGEN"
  exit 3;
fi

echo "¡A publicar amigos!"

docker push $USUARIO/$IMAGEN:$VERSION
if [ $? -ne 0 ];
then
  echo "Error al publicar la imagen $IMAGEN"
  exit 4;
else
  echo "Se publico correctamente la imagen $IMAGEN"
fi
FROM ubuntu:14.04
MAINTAINER Eugenio <e.mikebravo3@gmail.com>

#Actualizar e instalar programas necesarios
RUN apt-get update && apt-get install -y gcc build-essential cmake wget zip

#Descarga googletest
RUN cd usr/src &&\
 wget https://github.com/google/googlemock/archive/release-1.7.0.zip &&\
 wget https://github.com/google/googletest/archive/release-1.8.0.zip 

#Instalacion de googletest
RUN cd usr/src &&\
 unzip release-1.7.0.zip &&\
 unzip release-1.8.0.zip &&\
 mv googletest-release-1.8.0 gtest &&\
 cd gtest &&\
 cmake . &&\
 make &&\
 cd googlemock &&\
 mv libg* /usr/lib/ &&\
 cd gtest &&\
 mv libg* /usr/lib/
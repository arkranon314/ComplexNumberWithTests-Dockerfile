# ComplexNumberWithTests-Dockerfile
 This repository has a C++ project that it's tested with gtest. In addition, it has venn added a dockerfile, in order to create a docker image with the tools and libraries ready to test any googletest project based.

## Instalation
 First step is to download docker, then we can build the image from the same folder where we have the project, with the dockerfile inside, with this command: docker build -t imagename .

## Run the tests
 We just need to adjust the MakeLists.txt to our project structure and requirements, and example has been added in this repository adapted to the Chat C++ project.

 Then we run the docker image with this command: docker run -it --rm -v "$(pwd)":/destinationFolder -w /destinationFolder imagename /bin/bash -c "cmake.;make;./ExecutableName"

### Example with real values
 docker build -t eeugmig/tests .
 docker run -it --rm -v "$(pwd)":/home -w /home eeugmig/tests /bin/bash -c "cmake.;make;./Complex"


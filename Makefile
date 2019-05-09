SUDO=sudo

all: build run

build:
	${SUDO} docker build . -t py3-torando

run:
	${SUDO} docker run --rm -it py3-torando:latest


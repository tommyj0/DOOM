#!/bin/sh

# make -C linuxdoom-1.10 # old way of doing it

cmake -B build -S .

cmake --build build

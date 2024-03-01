#!/bin/bash
cd R_vecsub
nargo compile
for i in {1..10}
do
	time nargo prove | grep 'real'
done

#!/bin/bash

for setting in $(seq 6500 -50 2500)
do
	sct $setting
	sleep 0.1
done

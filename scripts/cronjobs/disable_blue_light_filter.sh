#!/bin/bash

for setting in $(seq 2500 50 6500)
do
	sct $setting
	sleep 0.1
done

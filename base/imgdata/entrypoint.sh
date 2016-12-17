#!/bin/bash

for i in `ls /entrypoint.d`; do
	/entrypoint.d/"$i"
done

$1

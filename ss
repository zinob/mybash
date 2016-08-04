#!/bin/bash

if [[ -t 1 ]] ; then
	lsTermopts="-hl --color=always"
fi

if [[ -f "$1" ]] ; then 
   type=$(file -L "$1")
	if [[ "$type" == *"text"* ]]; then 
		less "$1"
	elif [[ "$type" == *"image"* ]]; then 
		identify "$1"
		stat "$1"
	elif [[ "$type" == *" PDF "* ]]; then 
		pdftotext -enc Latin1 "$1" -|less
	else
		echo "----------"
		cat -A "$1"|fold|head -n 5
		echo
		echo "$type"
		echo
		stat "$1"
	fi
elif [[ -d "$1" ]] ; then 
   ls -rt $lsTermopts "$1"
elif [[ -z "$1" ]] ; then
   ls -rt $lsTermopts
else
   echo "ss: unable to find file or dirrectory: $1"
fi


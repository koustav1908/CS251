#!/bin/bash

mkdir albums
mkdir playlists
current=$( pwd )
for song in $current/songs/*; do
	album=$( head -n 1 $song )
	mkdir -p ./albums/$album
	ln -s $song $current/albums/$album/$( basename $song )
	i=1
	j=0
	while read line;do
		if [[ i -eq 2 ]]
		then
			j=$(( line + 3 ))
		elif [[ i -lt j ]]
		then
			playlist=$line
			mkdir -p ./playlists/$playlist
			ln -s $song $current/playlists/$playlist/$( basename $song )
		fi
		i=$((i+1))
	done < $song
done
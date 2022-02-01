#!/bin/sh
videoFiles=`ls *.[mM][pP]4 *.[mM][oO][vV] *.[wW][eE][bB][mM]  *.[mM][kK][vV] *.[aA][vV][iI] *.[fF][lL][vV] 2>/dev/null`
ffmpeg=`which ffmpeg 2>/dev/null` ;
if [ -z "$ffmpeg" ]
then
	echo "ffmpeg is not available. Try installing it first."
	exit
fi
if [ -z "$videoFiles" ]
then
	echo "No videos can be found on this directory. Try putting video files beside this script."
else
	echo $videoFiles
	for i in *
	do
		ffmpeg -i $i -c:v libvpx-vp9 -vf scale=512:512 -an ${i%.*}_Sticker.webm -hide_banner -loglevel error
	done
	echo "All files are converted successfully!"
fi
#!/bin/bash



# URL for the Google Text to Speech. Please replace space as %20 (escape character)
# Better to try in the browser first
str="https://translate.google.com/translate_tts?ie=UTF-8&tl=en-US&client=tw-ob&q=Hello!%20"

echo ${str}
hr=$(date +'%H')

str=$str"It's%20"$(date +'%-I')"%20O%20clock"
echo ${str}

# Logic to construct speech string according to conditions
if [ $hr -gt 12 ]
    then
	if [ $hr -gt 21 ]
		then
		str=$str"%20in%20the%20night"
	else
		str=$str"%20in%20the%20evening"
	fi

    else
        str=$str+"%20in%20the%20morning"
fi

# This will send constructed string to Google API and will create google_tts.mp3 from it's output
# -s mode for silent curl output
echo ${str}

curl ${str} -H 'Referer: http://translate.google.com/' -H 'User-Agent: stagefright/1.2 (Linux;Android 5.0)' -s > google_tts.mp3

# cvlc is console vlc player to play the actual message
# You can substitue houralert.mp3 according to your choice

cvlc --play-and-exit --quiet "houralert.mp3" "google_tts.mp3"

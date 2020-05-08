# PiTalkingClock
Announcement of time at every hour at 00 minutes on Raspberry PI devices. Using Google Translate API And Shell Script.

Basic Hourly annoucement in Voice. Simple 


## Requirement 
1. Raspberry Pi (or any *IX)
2. Purpose to listen hourly chime
3. Your favourite alert sound. (houralert.mp3)

## Understanding speech.sh
speech.sh is simple collection of few bash commands and logic to generate voice using Google Translate API. 



## Post work.
After testing correct annoucement, it's time to run script every hour. This can be achived using simple crontab.
Here are the quick helpers :
```
$crontab -e  [ then ]
```

append the following entry :

### Entry for crontab ( all * = Every minute)
	0 * * * * * /home/pi/speech.sh  

			
	* * * * * command to be executed
	- - - - -
	| | | | |
	| | | | ----- Day of week (0 - 7) (Sunday=0 or 7)
	| | | ------- Month (1 - 12)
	| | --------- Day of month (1 - 31)
	| ----------- Hour (0 - 23)
	------------- Minute (0 - 59)

	

Refer: https://alvinalexander.com/linux/unix-linux-crontab-every-minute-hour-day-syntax


### Extras 
- Its good idea to set main volume in bearable value,this can be done using this : (Already implemented in script)
```
$amixer -q -M sset PCM 50%
```

- Playing file via command using VLC player. I prefer VLC because 99% it's available on my devices. 
```
$cvlc --play-and-exit --quiet google_tts.mp3 			
```		 

- Actual Talking Clock file 
We can genreate mp3 file by building following string and calling using curl. Its self-explanatory.
```
curl 'https://translate.google.com/translate_tts?ie=UTF-8&q=Hello%20Everyone&tl=en&client=tw-ob' -H 'Referer: http://translate.google.com/' -H 'User-Agent: stagefright/1.2 (Linux;Android 5.0)' > google_tts.mp3
```

Refer : https://stackoverflow.com/questions/9893175/google-text-to-speech-api


		
	
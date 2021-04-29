# SonifyingSynesthesia
Synesthesia is a neurological condition where sensory information meant to stimulate one of the senses stimulates another. A common example of this is being able to see color when hearing music. This program switches this process and creates music based on color data. 

To see how the program works and examples check this video out! 
https://vimeo.com/538724006

How the code works: 

Red Hex Data -> determines chord notes 

Blue Hex Data -> determines melody notes

Green Hex Data -> detemines percussive notes 

Processing Download: https://processing.org/download/

MAX Download: https://cycling74.com/downloads

## Steps to using the program: 

1. You need to download OSC library in Processing.
2. You also need to download OSC and CMAT external libraries in MAX. 
3. Download the zip file from Github
4. Go to the 'data' folder and enter your own photo in (you can also test the code with the default photos) 
5. Go to the processing patch and change the name of the input photo
6. Make sure that the Max patch is turned ON 
7. Play the processing patch

## Customize the program:

If you would like to change the code or music look for "CUSTOMIZE HERE" within the code!

Aspects that are customizeable:

1. Delay settings 
2. Color output 
3. Volume 

### Debugging Issues: 

- If the sound isn't working check our Audio Output in Max.
- Check your port number and make sure it matches in both programs. 
- You may have changes the metronome to be too slow - mess around with the numbers. 
- Make sure your input photo and its name in the code matches.
- Any external files should go in the data folder. 


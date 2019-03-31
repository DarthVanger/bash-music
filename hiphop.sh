repeat=3
kick="./hiphop/Drums - One Shots/Kicks/Cymatics - Grime Kick 2.wav"
snare="./hiphop/Drums - One Shots/Snares/Cymatics - Hip-Hop Snare 1 - C.wav"
perc="./hiphop/Drums - One Shots/Percussion/Cymatics - Low Perc 13.wav"

sox "$kick" -p pad 0.5 0 pitch 200 |
sox - -m "$perc" -p pad 0.1 0 repeat 4 |
sox - -m "$kick" -p pad 0.25 0.5 pitch -300 |
sox - -m "$snare" -p pad 1 0 |
sox - output.wav

play output.wav repeat $repeat

repeat=3
kick="./hiphop/Drums - One Shots/Kicks/Cymatics - Grime Kick 2.wav"
snare="./hiphop/Drums - One Shots/Snares/Cymatics - Hip-Hop Snare 1 - C.wav"
sox "$kick" -p pad 0.5 0 pitch 200 |
sox - -m "$kick" -p pad 0.25 0.5 pitch -300 |
sox - -m "$snare" -p pad 1 0 |
sox - output.wav

play output.wav repeat $repeat

repeat=3
kick="./hiphop/Drums - One Shots/Kicks/Cymatics - Grime Kick 2.wav"
sox "$kick" -p pad 0.5 0 pitch 200 |
sox - -m "$kick" -p pad 0 0.5 pitch -300 |
sox - output.wav

play output.wav repeat $repeat

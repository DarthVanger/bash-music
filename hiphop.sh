repeat=3
kick="./hiphop/Drums - One Shots/Kicks/Cymatics - Grime Kick 2.wav"
snare="./hiphop/Drums - One Shots/Snares/Cymatics - Hip-Hop Snare 1 - C.wav"
perc="./hiphop/Drums - One Shots/Percussion/Cymatics - Low Perc 13.wav"

sox "$kick" out/output1.wav pad 0.5 0 pitch 200
sox "$perc" out/output2.wav pad 0.1 0 repeat 4
sox "$kick" out/output3.wav pad 0.25 0.5 pitch -300
sox "$snare" out/output4.wav pad 1 0

sox -m out/output*.wav out.wav

play out.wav repeat $repeat

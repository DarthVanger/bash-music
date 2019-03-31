repeat=3
kick="./hiphop/Drums - One Shots/Kicks/Cymatics - Grime Kick 2.wav"
snare="./hiphop/Drums - One Shots/Snares/Cymatics - Hip-Hop Snare 1 - C.wav"
perc="./hiphop/Drums - One Shots/Percussion/Cymatics - Low Perc 13.wav"

beat () {
  file="$1"
  position="$2"
  duration=$(soxi -D "$file")

  result=$(echo "$position-$duration" | bc)
  echo "pad 0 $result"
}

rm out/*

sox "$kick" out/output1.wav pitch 200 $(beat "$kick" 1) repeat 3
#sox "$perc" out/output2.wav pad 0.75 0 repeat 3
#sox "$kick" out/output3.wav pad 0.25 0.5 pitch -300 repeat 3
#sox "$snare" out/output4.wav pad 1 0 repeat 3

sox out/* output.wav pad 0 4 trim 0 4

play output.wav repeat $repeat

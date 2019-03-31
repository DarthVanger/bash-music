repeat=3
kick="./hiphop/Drums - One Shots/Kicks/Cymatics - Grime Kick 2.wav"
snare="./hiphop/Drums - One Shots/Snares/Cymatics - Hip-Hop Snare 1 - C.wav"
perc="./hiphop/Drums - One Shots/Percussion/Cymatics - Low Perc 13.wav"

beat () {
  file="$1"
  position="$2"
  duration=$(soxi -D "$file")

  result=$(echo "$position-$duration" | bc)
  repeat_number=$(echo "4/$position-1" | bc)
  echo "pad 0 $result repeat $repeat_number"
}

rm out/*
rm output.wav

sox "$kick" out/output1.wav pitch 200 $(beat "$kick" 0.25)
sox "$perc" out/output2.wav $(beat "$perc" 0.5)
sox "$kick" out/output3.wav pitch -300 $(beat "$kick" 0.75)
sox "$snare" out/output4.wav $(beat "$snare" 1)

sox -m out/* output.wav pad 0 4 trim 0 4

play output.wav repeat $repeat

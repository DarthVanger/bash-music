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

beat2 () {
  file="$1"
  frequency="$2"
  repeats=$(echo "4/$frequency-1" | bc)
  for i in $(seq 0 $repeats)
  do
    random=$(shuf -i0-1000 -n1)
    pad=$(echo "$i*$frequency" | bc)
    sox "$file" out/output-$i-$random.wav pad $pad
  done
}

rm out/*
rm output.wav

beat2 "$kick" 0.1

#sox "$kick" out/output1.wav pitch 200 pad 0 0
#sox "$kick" out/output2.wav pitch 200 pad 1 0
#sox "$kick" out/output3.wav pitch 200 pad 2 0
#sox "$kick" out/output4.wav pitch 200 pad 3 0
#sox "$perc" out/output5.wav pad 0 0
#sox "$perc" out/output6.wav pad 0.25 0
#sox "$perc" out/output7.wav pad 0.5 0
#sox "$perc" out/output8.wav pad 0.75 0
#sox "$perc" out/output9.wav pad 1 0
#sox "$kick" out/output10.wav pitch -300 $(beat "$kick" 0.75)
#sox "$snare" out/output11.wav $(beat "$snare" 1)

sox -m out/* output.wav pad 0 4 trim 0 4 vol 20dB

play output.wav repeat $repeat

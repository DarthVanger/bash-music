repeat=3
kick="./hiphop/Drums - One Shots/Kicks/Cymatics - Grime Kick 2.wav"
snare="./hiphop/Drums - One Shots/Snares/Cymatics - Hip-Hop Snare 1 - C.wav"
perc="./hiphop/Drums - One Shots/Percussion/Cymatics - Low Perc 13.wav"

beat () {
  file="$1"; shift;
  frequency="$1" shift;
  repeats=$(echo "4/$frequency-1" | bc)
  for i in $(seq 0 $repeats)
  do
    random=$(shuf -i0-1000 -n1)
    pad=$(echo "$i*$frequency" | bc)
    sox "$file" out/output-$i-$random.wav pad $pad $@
  done
}

rm out/*
rm output.wav

beat "$kick" 0.25
beat "$perc" 0.5
beat "$kick" 0.75 pitch -400
beat "$snare" 1

sox -m out/* output.wav pad 0 4 trim 0 4 vol 20dB

play output.wav repeat $repeat

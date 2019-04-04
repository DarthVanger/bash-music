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

once () {
  file="$1"; shift;
  random=$(shuf -i0-1000 -n1)
  sox "$file" out/output-$random.wav $@
}

set_length () {
  file="$1"; shift;
  desired_length="$1"; shift;
  random=$(shuf -i0-1000 -n1)
  original_length=$(soxi -D "$file")
  newfile="out/output-$random.wav"
  sox "$file" "$newfile" tempo $(echo "$original_length/$desired_length" | bc -l)
  echo "$newfile"
}

kick="./hiphop/Drums - One Shots/Kicks/Cymatics - Grime Kick 2.wav"
snare="./hiphop/Drums - One Shots/Snares/Cymatics - Hip-Hop Snare 1 - C.wav"
perc="./hiphop/Drums - One Shots/Percussion/Cymatics - Low Perc 13.wav"
riser="./hiphop/FX/Risers/Cymatics - Hip-Hop Riser 3 - 150 BPM E.wav"
downlifter="./hiphop/FX/Downlifters/Cymatics - Hip-Hop Downlifter 1 - 140 BPM C.wav"
impact="./hiphop/FX/Impacts/Cymatics - Halloween Ultimate Impact 13.wav"
banging808="./hiphop/808s/Cymatics - Bangin 808 2 - C.wav"
grime808="./hiphop/808s/Cymatics - Grime 808 25 - G.wav"
hiphop808="./hiphop/808s/Cymatics - Hip-Hop 808 10 - B.wav"
trap808="./hiphop/808s/Cymatics - Trap 808 2 - D.wav"
booming808="./hiphop/808s/Cymatics - Boomin 808 1 - C.wav"
vocal_chant="./hiphop/Vocal Chants/Cymatics - Hip-Hop Vocal Chant 1 - Crowd Breath.wav"
vocal_chant_titan="./hiphop/Vocal Chants/Cymatics - Titan Vocal Chant - Flex.wav"
melody_loop="./hiphop/Melody Loops/Cymatics - Hip-Hop Melody Loop 10 - 128 BPM C# Min.wav"
dubstep="dubstep/Synths - One Shots/Cymatics - Dubstep Growl 5 - F.wav"
synth1="./synth/synth1.wav"
synth2="./synth/synth2.wav"
hiphop_loop="./hiphop/Melody Loops/Cymatics - Hip-Hop Melody Loop 10 - 128 BPM C# Min.wav"
drum_loop="./hiphop/Drums - Loops/Loops - Full/Cymatics - Hip-Hop Drum Loop 1 - 128 BPM.wav"

rm out/*
rm output.wav

drum_loop=$(set_length "$drum_loop" 8)
hiphop_loop=$(set_length "$hiphop_loop" 16)

once "$hiphop_loop"
once "$drum_loop"
once "$drum_loop" pad 8
#once "$trap808" pad 4.25
#beat "$perc" 0.5
#beat "$kick" 0.75 pitch -400
#beat "$snare" 1

sox -m out/* output.wav pad 0 16 trim 0 16

play output.wav repeat $repeat

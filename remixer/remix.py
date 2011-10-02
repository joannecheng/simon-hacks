import echonest.audio as audio
from echonest.selection import fall_on_the
import sys, random

export_audio_dir = "audio/"
audio_file = audio.LocalAudioFile(sys.argv[1])

beats = audio_file.analysis.beats

i = 0
for beat in beats:
    beat.encode(export_audio_dir+str(i)+"_piece.wav")
    i += 1

import echonest.audio as audio
from echonest.selection import fall_on_the
import sys, random

usage = """
    Usage: python remix.py audio_file_name
"""
export_audio_dir = "audio/"
try:
    audio_file = audio.LocalAudioFile(sys.argv[1])
except:
    print usage
    sys.exit(1)

beats = audio_file.analysis.beats

i = 0
for beat in beats:
    beat.encode(export_audio_dir+str(i)+"_piece.wav")
    i += 1

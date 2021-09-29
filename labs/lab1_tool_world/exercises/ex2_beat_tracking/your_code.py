import os
import numpy as np
import librosa
from librosa import beat

def compute_beats(y, sr):
    tempo, beats = librosa.beat.beat_track(y, sr, units='samples')
    return beats
def add_samples(y, sample, beats):
    y_out=y.copy()
    # your code here ...

    return y_out


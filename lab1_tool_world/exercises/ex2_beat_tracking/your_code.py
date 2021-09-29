import os
import numpy as np
import librosa
from librosa import beat

def compute_beats(y, sr):
    tempo, beats = librosa.beat.beat_track(y, sr, units='samples')
    return beats
def add_samples(y, sample, beats):
    """[summary]

    Args:
        y ([type]): [description]
        sample ([type]): [description]
        beats ([type]): [description]

    Returns:
        [type]: [description]
    """
    y_out=y.copy()
    N=sample.size
    for beat in beats:
        y_out[beat:beat+N] += sample

    return y_out


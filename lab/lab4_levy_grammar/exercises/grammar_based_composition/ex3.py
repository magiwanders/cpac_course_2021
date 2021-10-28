# %% Import libraries
import os
os.chdir(os.path.dirname(os.path.abspath(__file__)))
from classes import Composer, Grammar_Sequence

# %%
triplet_grammar={
    "S":["M", "SM"],
    "M": ["HH", "ththth"],    
    "H": ["h", "$h", "QQ", "tqtqtq"],
    "Q": ["q", "$q", "OO", "tototo"],
    "O": ["o", "$o"],
    # your code here
}


triplet_word_dur={"h":0.5, # half-measure
                  "q":0.25, # quarter-measure
                  "o":  1/8, # octave-measure
                  "th": 1/3,
                  "tq": 1/6,
                  "to": 1/12,
                  "$h": 1/2,
                  "$q": 1/4,
                  "$o": 1/8,
          # your code here for $h, $q, $o, th, tq, to
}


if __name__=="__main__":
    fn_out="triplet_composition.wav"

    NUM_M=8
    START_SEQUENCE="M"*NUM_M
    G=Grammar_Sequence(triplet_grammar)        
        
    seqs=G.create_sequence(START_SEQUENCE)
    print("\n".join(seqs), "\nFinal sequence: ", G.sequence)    
    C= Composer("sounds/cymb.wav", triplet_word_dur)
    C.create_sequence(G.sequence)
    C.write("out/"+fn_out)
    
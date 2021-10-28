# %% Import libraries
import os
os.chdir(os.path.dirname(os.path.abspath(__file__)))
from classes import Composer, Grammar_Sequence

# %%
octave_grammar={
    "S":["M", "SM"],
    "M": ["HH"],    
    "H": ["h", "QQ" ],
    "Q": ["q", "oo"],
    # your code here
}

octave_word_dur={"h":1/2, # half-measure
                 "q":1/4, # quarter-measure
                 "o":1/8, }
          # your code here: add "o"}


if __name__=="__main__":
    fn_out="octave_composition.wav"

    NUM_M=8
    START_SEQUENCE="M"*NUM_M
    G=Grammar_Sequence(octave_grammar)        
        
    seqs=G.create_sequence(START_SEQUENCE)
    print("\n".join(seqs), "\nFinal sequence: ", G.sequence)    
    C= Composer("sounds/cymb.wav", octave_word_dur, BPM=174)
    C.create_sequence(G.sequence)
    C.write("out/"+fn_out)
    
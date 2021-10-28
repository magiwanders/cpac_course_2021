# %% Import libraries
import os
os.chdir(os.path.dirname(os.path.abspath(__file__)))
from classes import Composer, Grammar_Sequence

# %%

clave_grammar={
    "S":["M", "SM"],
    "M": ["R", "F"],    
    "R": ["o$ff$oo$ooq"],
    "F": ["o$ff$o$ff$ooq"]
}


clave_word_dur={  "q": 1/4, 
                  "o":  1/8, # octave-measure
                  "$o": 1/8,
                  "f": 1/16,
                  "$f": 1/16,
}


if __name__=="__main__":
    fn_out="clave_composition.wav"

    NUM_M=8
    START_SEQUENCE="M"*NUM_M
    G=Grammar_Sequence(clave_grammar)        
        
    seqs=G.create_sequence(START_SEQUENCE)
    print("\n".join(seqs), "\nFinal sequence: ", G.sequence)    
    C= Composer("sounds/cymb.wav", clave_word_dur)
    C.create_sequence(G.sequence)
    C.write("out/"+fn_out)
    
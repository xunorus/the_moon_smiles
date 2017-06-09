//bass.ck
<<< "and in the boat that roars," >>>;
// sine to dac
SawOsc s =>NRev r => Pan2 p =>  dac;

// let's turn down gain, for this can be loud and annoying
.013 => float maxGain;
maxGain=> s.gain;
//parameter setup
1 =>r.mix;//small rev
//initialize  
0 =>int counter;
0.0 => float t;
Std.mtof( 41 ) =>s.freq;

while( true )
{
    // modulate
    t - .0025 => t;//mod rate
    Math.sin(t)  =>p.pan;
    8::ms => now;
     //beat goes from 0 to 5 (6 positions)
    counter %60 => int beat;
    counter++; //counter +1 => counter                                  


                
  100=> int x;
//FADE OUT 
    if (counter >500)
    {
        //0.9 => dac.gain;
        //500 - counter => float fadeout;
        //Std.fabs(fadeout) => float abs_fadeout;
        x--;
       // x=> dac.gain;                    
    //<<<x>>>;
    }
           if( counter ==601){
           	  // break ; 
    }                
}   
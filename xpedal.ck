//pedal
//now  +30::second => time TotalDur;

//sound chain 
SinOsc a =>dac.left;
SinOsc b =>dac.right; 

0.5/2 => a.gain=> b.gain;//adjust gain proportionally 


// (the Bb Aeolian mode)
[ 46, 48, 49, 51, 53, 54, 56, 58,46 ] @=> int notes[];
[.5,.625,.4,.625,.45,.7,.4,.8, .625]  @=> float durations[];
//loops ten times
for (0=> int looper; looper <3 ; looper++)//repite 
    { 
    for (0=> int i ; i < notes.cap(); i++)
        {
            if (i % 2) // if  is odd then use channel left
        { 
            Std.mtof(notes[i]+12) =>a.freq;// MIDI to freq    
        }
        else  // if even
        { 
            Std.mtof(notes[i]+12) =>b.freq;// MIDI to freq
        }
        durations[Math.random2( 0, 7 )]::second => now; //random durtions  
    }
}

<<< "like an enchanted song," >>>;    
 for (0=> int looper; looper <1 ; looper++)//repite 
    { 
    for (0=> int i ; i < notes.cap(); i++)
        {
            if (i % 2) // if  is odd then use channel left
        { 
            Std.mtof(notes[Math.random2( 0, 7 )]+19) =>a.freq;// MIDI to freq    
        }
        else  // if even
        { 
            Std.mtof(notes[i]+12) =>b.freq;// MIDI to freq
        }
        durations[Math.random2( 0, 7 )]::second => now; //random durtions  
    }
}

18=> int fadOut;//init variable
for (0=> int looper; looper <2 ; looper++)//repite 
    {                       
    for (0=> int i ; i < notes.cap(); i++)
        {
            if (i % 2) // if  is odd then use channel left
            { 
                Std.mtof(notes[i]+12) =>a.freq;// MIDI to freq    
            }
            else  // if even
            { 
                Std.mtof(notes[i]+12) =>b.freq;// MIDI to freq
            }
            durations[Math.random2( 0, 7 )]::second => now; //random durtions            
            fadOut--;
             fadOut/34.0=> float fl_fadOut;
             fl_fadOut/2 => a.gain=> b.gain;//adjust gain proportionally 

        }                       
    }
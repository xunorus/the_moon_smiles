/// this contrapunctual form is almost imposible to be perfomed by human performers without written access to it.
// el tema es un tejido entre dos voces con duraciones aleatorias dentro de un rango determinado.
//el tema se repite literalmente en forma de canon mientras una de  las voces 'improvisa', siempre
//dentro de la estructura temporal aleatoriamente determinada.
////////////////////////////////////////
//SEED
//////
// si la semilla es declarada
if (me.args()==1) 
{
    Std.atoi(me.arg(0))=> int seed;
    Math.srandom(seed);
    <<<me.arg(0)>>>;

    seed/365=> int year;
    seed%365 =>int days;
    <<<"Year", year,"Day number:",days>>>;
    <<<"Name", seed>>>;

}
//sino establece una semilla dentro del el rango especificado
else 
{
    Math.random2(0, 9460800 )=> int seed;//25920.365=9460800
    Math.srandom(seed);

    seed/365=> int year;
    seed%365 =>int days;
    <<<"Year", year,"Day number:",days>>>;
    <<<"Name FUTURA SONORA CRIATURAE", seed>>>;
<<<"run 'chuck PATH_TO_FILE/NAME_OF_FILE:",seed, "to play this again">>>;

}
////////////////////////////////////////

//pedal
//sound chain 
SinOsc a =>dac.left;
SinOsc b =>dac.right; 

0.5/2 => a.gain=> b.gain;//adjust gain proportionally 
 
// (the Bb Aeolian mode)
[ 46, 48, 49, 51, 53, 54, 56, 58,46 ] @=> int notes[];

[.5,.625,.4,.625,.45,.7,.4,.8, .625]  @=> float durations[];


//DUO BASE 3 VUELTAS duo base
for (0=> int looper; looper <3 ; looper++)//repite 
{ 
    for (0=> int i ; i < notes.cap(); i++)
    {
        if (i % 2) Std.mtof(notes[i]+12) =>a.freq;//  if  is odd then use  left channel
        else Std.mtof(notes[i]+12) =>b.freq;// // if even use right...
        durations[Math.random2( 0, 7 )]::second => now; //random durtions  
    }
}

//a IMPROVISA 3 vueltas
 for (0=> int looper; looper <3 ; looper++)//repite  Improvisando lado derecho
{ 
    for (0=> int i ; i < notes.cap(); i++)
    {
        if (i % 2) Std.mtof(notes[Math.random2( 0, 7 )]+19) =>a.freq;// if  is odd then use left channel 
        else Std.mtof(notes[i]+12) =>b.freq; // if even use right channel 
        durations[Math.random2( 0, 7 )]::second => now; //random durtions  
    }
}


//DUO BASE 2 VUELTAS duo base
for (0=> int looper; looper <2 ; looper++)//repite 
{ 
    for (0=> int i ; i < notes.cap(); i++)
    {
        if (i % 2) Std.mtof(notes[i]+12) =>a.freq;//  if  is odd then use  left channel
        else Std.mtof(notes[i]+12) =>b.freq;// // if even
        durations[Math.random2( 0, 7 )]::second => now; //random durtions  
    }
}


//b IMPROVISA 3 vueltas
 for (0=> int looper; looper <3 ; looper++)//repite  Improvisando lado derecho
{ 
    for (0=> int i ; i < notes.cap(); i++)
    {
        if (i % 2) Std.mtof(notes[i]+15) =>a.freq;//  if  is odd then use  left channel
        else Std.mtof(notes[Math.random2( 0, 7 )]+12) =>b.freq; // if even use right channel 
        durations[Math.random2( 0, 7 )]::second => now; //random durtions  
    }
}
    
  
//DUO BASE 1 VUELTAS duo base
for (0=> int looper; looper <1 ; looper++)//repite 
{ 
    for (0=> int i ; i < notes.cap(); i++)
    {
        if (i % 2) Std.mtof(notes[i]+12) =>a.freq;//  if  is odd then use  left channel
        else Std.mtof(notes[i]+12) =>b.freq;// // if even use right...
        durations[Math.random2( 0, 7 )]::second => now; //random durtions  
    }
}

//FADE OUT
18=> int fadOut;//init variable
for (0=> int looper; looper <2 ; looper++)//repite 
{                       
    for (0=> int i ; i < notes.cap(); i++)
    {
        if (i % 2) Std.mtof(notes[i]+12) =>a.freq;// MIDI to freq    
        else  Std.mtof(notes[i]+12) =>b.freq;// MIDI to freq
        durations[Math.random2( 0, 7 )]::second => now; //random durtions            
        fadOut--;
        fadOut/34.0=> float fl_fadOut;
        fl_fadOut/2 => a.gain=> b.gain;//adjust gain proportionally 
    }                       
}


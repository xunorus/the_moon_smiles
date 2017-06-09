//sparkles.ck
//sound chain
Impulse imp => ResonZ filt  =>Delay d=> Delay d2=> Pan2 p=>JCRev rev =>dac;
1800.0 => filt.freq;
1400=>filt.Q;
0.7=> imp.gain;
 
//seed 
Math.random() => int seed;
Math.srandom(seed);
//<<<"sparles Seed Nr.",seed>>>; //print seed number

//sound params
0.1 => rev.mix;
0.6::second =>d.max =>d.delay;
1::second =>d.max =>d.delay;


[41,43,48,50,51,53,60,63] @=> int scale[];


1=>int i;
while(true)//INTRO
{
    300.0 =>imp.next;//generate 1 per sample
    //Math.random2f(1200, 1500)=>filt.freq;
   Math.random2(0,scale.cap()-1)=>int note; //siempre recordar de restar 1

   Math.mtof( 36+scale[note])  =>filt.freq;
    

    Math.random2f(1,4)::second=>now;
    i++;
	Math.sin(now/1::second*2*pi) => p.pan;
}  

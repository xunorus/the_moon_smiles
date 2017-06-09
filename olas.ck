Noise n => Pan2 p =>JCRev rev  => dac;

//sound params
0.1 => rev.mix;
0=> p.gain;
0=> int i;
0=> int x;


Math.random2( 30, 50 ) => int fadeIn_rate;// random fade in time
Math.random2( 40, 100 ) => int fadeOut_rate;//random fade out time

// infinite loop

0=> int wave_counter;
while( true ){	
	if(i<50)
	{
		i++, x++;
		x/150.0=>float ggain;
    	ggain=>p.gain;
    	//<<<x,i,ggain>>>;    
		fadeIn_rate::ms =>now; 		
	}
	while(i==50 || i>50 && i <100 )
	{
		i++,x--;   
    	x/150.0=>float ggain;
    	ggain=>p.gain;
    	//<<<x,i,ggain>>>;    
		fadeOut_rate::ms =>now; 		
	}

	if( i==100 ){
		Math.random2f( .4, 3.2 )::second => now; // wait randomly
		0=>i;//start again
		wave_counter++;
		//<<<wave_counter>>>;
	}
	if(wave_counter==4) break;
}
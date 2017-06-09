//score.ck
<<<"Assignment_6">>>;
//store now to deduct lenght later       
now => time t1;
//paths to chuck files
me.dir()+ "/xpedal.ck" => string xpedalPath;
me.dir()+ "/canoned10.ck" => string canoned10;
me.dir()+ "/sparkles.ck"=> string sparklesPath;
me.dir()+ "/olas.ck"=> string olasPath;
me.dir()+ "/bass.ck"=> string bassPath;

//start waves
Machine.add(olasPath) => int olasID;
<<< "----------------------------------------------" >>>;
<<<"--------------Assignment_6----------------------">>>;
2::second =>now;//wait 4.8 seconds

// start xpedal
Machine.add(canoned10) => int canoned10ID;
<<< "----------------------------------------------" >>>;
<<< "--- ::The moon smiles through the ocean :: ---" >>>;
4.66::second =>now;//wait 4.8 seconds

//start sparkle
Machine.add(sparklesPath) => int sparklesID;
<<< "----------------------------------------------" >>>;
<<< "----------------------on the indomitable stars" >>>;

4.8::second =>now;//wait 4.8 seconds
//a boat horn
<<< "----------------------------------------------" >>>;
<<< "in your rigorous hardwork," >>>;
Machine.add(bassPath) => int bassID;

4.8::second =>now;//wait 4.8 second
Machine.remove(bassID);//remove drums

8::second =>now;//wait 4.8 seconds
Machine.remove(sparklesID);
<<< "----------------------------------------------" >>>;
<<< "goes away," >>>;

2.14::second =>now;//wait 4.8 seconds
<<< "----------------------------------------------" >>>;
<<< "like a wave." >>>;

3.6::second =>now;//wait 4.8 seconds
 now => time t2;
<<< "----------------------------------------------" >>>;
    <<<"TOTAL DURATION:",(t2-t1)/second,"seconds">>>;
//5::second=>now;
//Machine.remove(xpedalID);
//Machine.remove(olasID);

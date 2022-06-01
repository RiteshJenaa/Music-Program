//Libraries: uses Sketch / Import Library / Add Library / Minim
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
//
//Global Variables
Minim minim; //object to access all music player fuctions
AudioPlayer song1; //WAV, AIFF, AU, SND & MP3 
//

void setup()
{
  //fullScreen();
  minim = new Minim(this); //loads from data directory, loads from project folder
  song1 = minim.loadFile("MusicDownload/MusicProgram_MusicDownload_groove.mp3"); //albe to pass absulute path, file name & extension, and URL
}//End setup
//
void draw() {
  if ( song1.isLooping() ) println("There are", song1.loopCount()-1, "loops left.");
  if ( song1.isPlaying() && !song1.isLooping() ) println("Play Once");
  //
  println("Song Position", song1.position(), "Song Length", song1.length() );
}//End draw

//

void keyPressed()
{
  //Only press a number for this code below
  if ( key=='1' || key=='9' ) {//Looping
    if ( key == '1' ) println ("Looping 1 time");
    if ( key == '9' ) println ("Looping 9 times");
    String keystr = String.valueOf(key);
    println("Number of Repeats is", keystr);
    int num = int(keystr);
    song1.loop(num);
  }//End loop

  //Play-Paused button
  if ( key>='3' && key!='9') println("I do not loop that much! Try again.");
  //
  if ( key=='p' || key=='P' ) { 
    if ( song1.isPlaying() ) {
      song1.pause();
    } else {
      song1.play(500);
    }
  }//End Play-Paused button


  /* Previous Play Button & Loop Button
   int loopNum = 2; //Local Variables plays once and loops twice
   //song1.play(); //Parameter is milli-seconds from start of audio file to start of playing
   if ( key=='l' || key=='L' ) song1.loop(loopNum); //Parameter is number of repeats;
   */

  if ( key=='m' || key=='M' ) { //Mute
    if ( song1.isMuted() ) {
      song1.unmute();
    } else {
      song1.mute();
    }
  }//End Mute

  //STOP
  if ( key=='s' || key=='S' ) {
    if ( song1.isPlaying() ) {
      song1.pause();
      song1.rewind();
    } else {
      song1.rewind();
    }
  }//End STOP button
}//End keyPressed

//

void mousePressed() 
{
}//End mousePressed
//

//End Main Program
//

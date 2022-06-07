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
int numberOfSongs = 4;
int currentSong = numberOfSongs - numberOfSongs;
AudioPlayer[] song = new AudioPlayer[numberOfSongs] ; //WAV, AIFF, AU, SND & MP3 
AudioMetaData[] songMetaData = new AudioMetaData[numberOfSongs];
color purple = #E60AFF;
PFont titleFont;
//

void setup()
{
  fullScreen();
  minim = new Minim(this); //loads from data directory, loads from project folder
  song[currentSong] = minim.loadFile("MusicDownload/MusicProgram_MusicDownload_groove.mp3"); //albe to pass absulute path, file name & extension, and URL
  //song[1] = minim.loadFile("MusicDownload/MusicProgram_MusicDownload_groove.mp3");
  //song[2] = minim.loadFile("MusicDownload/MusicProgram_MusicDownload_groove.mp3");
  //
  for (int i=currentSong; i<song.length; i++) {
    songMetaData[i] = song[i].getMetaData();
  } //End Meta Data

  //songMetaData[0] = song[0].getMetaData();
  //songMetaData[1] = song[1].getMetaData();
  //songMetaData[2] = song[2].getMetaData();
  //
  titleFont = createFont( "Arial", 35 );
  //
  println("Start of Console");
  println("Click the console to finish starting this program");
  println("Title:", songMetaData[currentSong].title() );
}//End setup

//

void draw() {
  if ( song[currentSong].isLooping() ) println("There are", song[currentSong].loopCount()-1, "loops left.");
  if ( song[currentSong].isPlaying() && !song[currentSong].isLooping() ) println("Play Once");
  //
  //println("Song Position", song1.position(), "Song Length", song1.length() );
  //
  background (#000000);
  rect(displayWidth*1/4, displayHeight*0, displayWidth*1/2, displayHeight*1/10);
  fill(purple);
  textAlign (CENTER, CENTER); 
  textFont(titleFont, 35); 
  text(songMetaData[currentSong].title(), displayWidth*1/4, displayHeight*0, displayWidth*1/2, displayHeight*1/10);
  fill(255);
  //
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
    song[currentSong].loop(num);
  }//End loop


  //Play-Paused button
  if ( key=='l' || key=='L') song[currentSong].loop();
  if ( key>='3' && key!='9') println("I do not loop that much! Try again.");
  //
  if ( key=='p' || key=='P' ) { 
    if ( song[currentSong].isPlaying() ) {
      song[currentSong].pause();
    } else if ( song[0].position() >= song[0].length() - song[0].length()*1/5 ) { //Special situation
      song[currentSong].rewind();
      song[currentSong].play();
    } else {
      song[currentSong].play();
    }
  }//End Play-Paused button

  if ( key=='f' || key=='F' ) song[currentSong].skip(1000); //skip forward
  if ( key=='r' || key=='R' ) song[currentSong].skip(-1000); //skip backward

  /* Previous Play Button & Loop Button
   int loopNum = 2; //Local Variables plays once and loops twice
   //song1.play(); //Parameter is milli-seconds from start of audio file to start of playing
   if ( key=='l' || key=='L' ) song1.loop(loopNum); //Parameter is number of repeats;
   */

  if ( key=='m' || key=='M' ) { //Mute
    if ( song[currentSong].isMuted() ) {
      song[currentSong].unmute();
    } else {
      song[currentSong].mute();
    }
  }//End Mute

  //STOP
  if ( key=='s' || key=='S' ) {
    if ( song[currentSong].isPlaying() ) {
      song[currentSong].pause();
      song[currentSong].rewind();
    } else {
      song[currentSong].rewind();
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

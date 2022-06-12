
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
AudioPlayer[] song = new AudioPlayer[numberOfSongs]; //WAV, AIFF, AU, SND, & MP3
AudioMetaData[] songMetaData = new AudioMetaData[numberOfSongs]; //meta data
int currentSong = numberOfSongs - numberOfSongs;

color purple = #E60AFF;
PFont titleFont;
float gain = 20.0;
//

void setup()
{
  fullScreen();
  minim = new Minim(this); //loads from data directory, loads from project folder
  song[currentSong] = minim.loadFile("MusicDownload/Beat_Your_Competition.mp3"); //albe to pass absulute path, file name & extension, and URL
  song[currentSong+=1] = minim.loadFile("MusicDownload/Ghost_Walk.mp3");
  song[currentSong+=1] = minim.loadFile("MusicDownload/The_Simplest.mp3");
  song[currentSong+=1] = minim.loadFile("MusicDownload/MusicProgram_MusicDownload_groove.mp3");
  //
  currentSong-=currentSong; //currentSong = currentSong - currentSong
  for ( int i=currentSong; i<song.length; i++ ) {
    songMetaData[i] = song[i].getMetaData();
  }//End Meta Data

  //songMetaData[0] = song[0].getMetaData();
  //songMetaData[1] = song[1].getMetaData();
  //songMetaData[2] = song[2].getMetaData();
  //
  titleFont = createFont( "Arial", 35 );
  //
  println("Start of Console");
  println("Click the console to finish starting this program");
  println("Title:", songMetaData[currentSong].title() );
  println( "Author: ", songMetaData[currentSong].author() ); 
  println( "Album: ", songMetaData[currentSong].album() );
  println( "Genre: ", songMetaData[currentSong].genre() );
}//End setup

//

void draw() {
  //if ( song[currentSong].isLooping() ) println("There are", song[currentSong].loopCount()-1, "loops left.");
  //if ( song[currentSong].isPlaying() && !song[currentSong].isLooping() ) println("Play Once");
  //
  //println("Computer Number of Current Song:", currentSong);
  println("Song Position", song[currentSong].position(), "Song Length", song[currentSong].length() );
  //
  background (#000000);
  rect(displayWidth*1/4, displayHeight*0, displayWidth*1/2, displayHeight*1/10);
  fill(purple);
  textAlign (CENTER, CENTER); 
  textFont(titleFont, 35); 
  text(songMetaData[currentSong].title(), displayWidth*1/4, displayHeight*0, displayWidth*1/2, displayHeight*1/10);
  fill(255);
  //
  //
  rect(displayWidth*1/4, displayHeight*1/8, displayWidth*1/2, displayHeight*1/10);
  fill(purple);
  textAlign (CENTER, CENTER); 
  textFont(titleFont, 35); 
  text(songMetaData[currentSong].author(), displayWidth*1/4, displayHeight*1/8, displayWidth*1/2, displayHeight*1/10);
  fill(255);
  //
  rect(displayWidth*1/4, displayHeight*1/4, displayWidth*1/2, displayHeight*1/10);
  fill(purple);
  textAlign (CENTER, CENTER); 
  textFont(titleFont, 35); 
  text(songMetaData[currentSong].genre(), displayWidth*1/4, displayHeight*1/4, displayWidth*1/2, displayHeight*1/10);
  fill(255);
  //
  rect(displayWidth*1/4, displayHeight*3/8, displayWidth*1/2, displayHeight*1/10);
  fill(purple);
  textAlign (CENTER, CENTER); 
  textFont(titleFont, 35); 
  text(songMetaData[currentSong].album(), displayWidth*1/4, displayHeight*3/8, displayWidth*1/2, displayHeight*1/10);
  fill(255);
  //
  //Visualizer
  for (int i = 0; i < song[currentSong].bufferSize() - 1; i++)
  {
    float x1 = map( i, 0, song[currentSong].bufferSize(), 100, 500 );
    float x2 = map( i+1, 0, song[currentSong].bufferSize(), 100, 500 );
    line( x1, 50 + song[currentSong].left.get(i)*30, x2, 50 + song[currentSong].left.get(i+1)*30 );
    line( x2, 150 + song[currentSong].right.get(i)*30, x2, 150 + song[currentSong].right.get(i+1)*30 );
  }

  //Draw a line to show where in the song playback is currently located
  float posx = map(song[currentSong].position(), 0, song[currentSong].length(), 50, 500);
  stroke(0, 200, 0);
  line(posx, 0, posx, 190);
  //End visualizer
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
  if ( key>='4' && key!='9') println("I do not loop that much! Try again.");
  //
  if ( key=='p' || key=='P' ) { 
    if ( song[currentSong].isPlaying() ) {
      song[currentSong].pause();
    } else if ( song[currentSong].position() >= song[currentSong].length() - song[currentSong].length()*1/6 ) { //Special situation
      song[currentSong].rewind();
      song[currentSong].play();
    } else {
      song[currentSong].play();
    }
  }//End Play-Paused button

  if ( key=='f' || key=='F' ) song[currentSong].skip(1000); //skip forward
  if ( key=='r' || key=='R' ) song[currentSong].skip(-1000); //skip backward

  //

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

  //

  if ( key=='n' || key=='N' ) {//Next Button
    if ( song [currentSong].isPlaying() ) {
      song[currentSong].pause();
      song[currentSong].rewind();
      nextButtonArrayCatch();
      song[currentSong].play();
    } else {
      song[currentSong].rewind();
      nextButtonArrayCatch();
      song[currentSong].play();
    }
  }//End Next Button

  if (  key=='z' || key=='Z' ) {
    if ( song [currentSong].isPlaying() ) {
      song[currentSong].pause();
      song[currentSong].rewind();
      backButtonArrayCatch();
      song[currentSong].play();
    } else {
      song[currentSong].rewind();
      backButtonArrayCatch();
      song[currentSong].play();
    }
  } //End Back Button

  if (  key=='d' || key=='D' ) {
    println("Gain is", song[currentSong].getGain());
    gain = gain+song[currentSong].getGain();
    song[currentSong].setGain(gain);
  }
  //End Amplify Button


  if (  key=='a' || key=='A' ) AutoPlay(); //End AutoPlay Button 

  if (  key=='f' || key=='F' ) SongSkip(); //End Song Skip Button 
  //Note it sometimes works
}//End keyPressed

//

void mousePressed() 
{
}//End mousePressed
//

//End Main Program
//

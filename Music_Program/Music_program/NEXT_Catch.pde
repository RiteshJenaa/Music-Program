void nextButtonArrayCatch() {
  if ( currentSong >= song.length-1 ) {
    currentSong = numberOfSongs - numberOfSongs;
  } else {
    currentSong++;
  }//End of CATCH
}
//End nextButtonArrayCatch

void backButtonArrayCatch() {
  if ( currentSong == 0 ) {
    currentSong = numberOfSongs - 1;
  } else {
    currentSong--;
  }//End of CATCH
}
//End backButtonArrayCatch

void AutoPlay() {
  if ( song[currentSong].isPlaying() && song[currentSong].position() == song[currentSong].length() - song[currentSong].length()*1/6 ) {    
    song[currentSong].rewind();
    nextButtonArrayCatch();
    song[currentSong].play();
  } else {
    song[currentSong].pause();
    song[currentSong].rewind();
    nextButtonArrayCatch();
    song[currentSong].play();
  }
}
  //End AutoPlay

  void SongSkip() {
    if ( song[currentSong].isPlaying() && song[currentSong].position() == song[currentSong].length() - song[currentSong].length()*1/6 ) {
    } else {
      song[currentSong].pause();
      song[currentSong].rewind();
      nextButtonArrayCatch();
      song[currentSong].play();
      song[currentSong].pause();
      song[currentSong].rewind();
      nextButtonArrayCatch();
      song[currentSong].play();
    }
  }
  //End SongSkip

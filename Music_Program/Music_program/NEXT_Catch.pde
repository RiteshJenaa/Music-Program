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

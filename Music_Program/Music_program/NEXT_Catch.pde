void nextButtonArrayCatch() {
        if ( currentSong >= song.length-1 ) {
        currentSong -= currentSong;
      } else {
        currentSong++;
      }//End of CATCH
}
//End nextButtonArrayCatch

void backButtonArrayCatch() {
        if ( currentSong <= song.length-1 ) {
        currentSong -= currentSong;
      } else {
        currentSong--;
      }//End of CATCH
}
//End backButtonArrayCatch

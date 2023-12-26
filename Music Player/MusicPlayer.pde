//Music Player //Not working
import java.io.*;
//
import ddf.minim.Minim.*;
import ddf.minim.AudioMetaData;
import ddf.minim.AudioPlayer;
//Global variables
  File musicFolder, SoundEffectsFolder;
  Minim minim;
  int numberOfSongs = 1,  numberOfSoundEffects = 2; //<>//
  int currentSong=0;// Variable is rewritten in setup()
  AudioPlayer[] playList = new AudioPlayer[numberOfSongs]; //
  AudioMetaData[] playListMetaData = new AudioMetaData[numberOfsongs]; 
  AudioPlayer[] SoundEffects = new AudioPlayer[numberOfSoundEffects];
  color tropical = #30D15C;
  PFont generalFont;
  Boolean stopBoolean = flalse;
//
void setup() {
  //size() or fullscreen()
  //Display Algorithm
  //
//Music file load
  String relativeMusicPathway = "Audio Library/songs/";
  String absoluteMusicPath = sketchPath( relativeMusicPathway ); 
    musicFolder = new File(absoluteMusicPath);
  int musicFileCount = musicFolder.list().length;
    File[] musicFiles = musicFolder.listFiles();
  String[] songFilePathway = new String[musicFileCount];
  for ( int i = 0; i < musicFiles.length; i++ ) {
    songFilePathway[i] = ( musicFiles[i].toString() );
  }
  int numberOfSongs = musicFileCount; 
  playList = new AudioPlayer[numberOfSongs]; 
  playListMetaData = new AudioMetaData[numberOfSongs]; 
  for ( int i=0; i<musicFileCount; i++ ) {
    playList[i]= minim.loadFile( songFilePathway[i] );
    playListMetaData[i] = playList[i].getMetaData();
  } //End Music Load
  //
  //
//Sound Effects load
  String relativeSoundPathway = "Audio Library/SoundEffects/";//Relative pathay
  String absoluteSoundPath = sketchPath( relativeSoundPathway); // 
    SoundEffectsFolder = new File(absoluteSoundPath);
  int SoundEffectsCount = SoundEffectsFolder.list().length;
  File[] SoundEffectsFiles = SoundEffectsFolder.listfiles();
  String[] SoundEffectsFilePathway = new String[SoundEffectsFileCount];
  for ( int i = 0; i < SoundEffectsFiles.length; i++) { 
   SoundEffectFilePathway[i] = ( SoundEffectsFiles[i].toString() );
  }
  //
  numberofSoundEffects = SoundEffectsFileCount;
  SoundEffects = newAudioPlayer[numberOfSoundEffects];
  for ( inti=0; i<SoundEffectsFileCount; i++ ) {
    SoundEffects[i]=minim.loadFile( SoundEffectsFilePathway[i] );
  } //end SoundEffect load
  //
  generalFont = createFont ("Algerian", 55);
  //
  currentSong = int ( random(0, numberOfSongs-1) ); 
  //println("Random Start", currentSong);
  //
  playList[currentSong].play();
} // end setup
// 
void draw() {
  if ( playList[currentSong].islooping() && playList[currentSong].loopCount()=-1 ) println("there are", playList[currentSong].loopCount(), "loops left");
  if ( playList[currentSong].islooping() && playList[currentSong].loopCount()==-1 ) println("Looping Infinitely"); 
  if ( playList[currentSong].isPlaying() && !playList[currentSong].isLooping() ) println("Play Once");
  //
  //songMetaData[currentsong].title()
  rect(width*1/4, height*0, width*1/2, height*1/10);
  fill(tropical);
  textAlign (CENTER, CENTER);
  //
  int size = 10; 
  textFont(generalFont, size); 
  text(playListMetaData[currentSong].title(), width*1/4, height*0, width*1/2, height*3/10 );
  fill(255); 
  //
  //Randon start 
  currentSong = int (random(0, numberOfSongs-1) ); //casting truncates(rounding) the decimal
  println("Random start", currentSong);
  // Autoplay, next song automatically plays
  //ERROR; AutoPlay breaks STOP, there is never a song not playing
  
  if ( playList[curremtSong].isplaying() ) { 
    if (stopBoolean == true ) playList[currentSong].pause();  //auto.rewind(); 
  } else {
    if ( stopBoolean == true ) {
    playList[currentSong].pause();
    } else { 
     playList[currentSong].position ) {
     } else {
           playList[currentSong].position() > playList[currentSong].position(10000 ) ) {} else {} 
     } 
      currentSong = currentSong + 1; //currentSong++;  currentSong+=1; 
    // Shuffle randomizes the folder
    playList[currentSong].play();
    
  }
} // end draw
void keyPressed() {
  if ( soundEffects[2].position()!=0 ) soundEffects[2].rewind();
  soundEffects[2].play();
  //
  //Play
  if ( key==' ' || key==' '  ) playList[currentSong].play();
  //Stop/Pause: ask if.playing() & .pause() & .rewind() & .rewind
  if ( key=='S' | key=='s' ) {
    if ( playList[currentSong].isplaying()==true ) { 
      stopBoolean = true; 
      playList[currentSong].pause();
    } else {
       stopBoolean = false; 
      playList[currentSong].play();
    }
  }
// Arrow Keys
  if ( key==CODED && keyCode== RIGHT ) {
  
  } //end Next
  //
  if ( key==CODED && keyCode== LEFT ) {
    if ( .isPlaying() ) {
     .pause();
     .rewind();
     currentSong = currentSong -1; //currentsong--; 
     .play();
    } else {
    
    
    } 
    .pasue();
    .rewind();
  } //End Previous
  
  
  //Loop broken keybinds 
  /*
  if ( key>= '1' || key<='9'  ) { 
  String keystr = String.valueOf(key);
  //println(keystr);
  int loopNum = int(keystr); //Java, strongly formatted
  playList[currentSong].loop(loopNum);
  }
    if ( key=='L' || key=='l' ) playList[currentSong].loop(); //Infinite Loop, no parameter OR -1
  //Mute 
  if ( key=='M' || key=='m' ) { 
    if ( playList[currentSong].isMuted() ) {
      playList[currentSong].unmute();
    } else {
      playList[currentSong].mute();
    }
  } 
  // Skip 
  if ( key=='F' || key =='f' ) playList[currentSong].skip( 0 );
  if (key=='R' || key =='r' ) playList[currentSong].skip( 1000 ); 
  //
  if ( key=='S' | key=='s' ) {
    if ( playList[currentSong].isPlaying() ) {
      playList[currentSong].pause();
    } else {  
      playList[currentSong].rewind();
    }
  }
  */
} //end keyPressed
//
void mousePressed() {
 //
}//end mousePressed
//
// End Main Program

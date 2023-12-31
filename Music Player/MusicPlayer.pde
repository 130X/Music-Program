//Music Player //not done
import java.io.*;
//
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
//
//Global variables
  Minim minim;
  File musicFolder, SoundEffectsFolder;
  int numberOfSongs = 1,  numberOfSoundEffects = 2; //<>//
  int currentSong=0;// Variable is rewritten in setup()
  AudioPlayer[] playList = new AudioPlayer[numberOfSongs]; //
  AudioMetaData[] playListMetaData = new AudioMetaData[numberOfSongs]; 
  AudioPlayer[] SoundEffects = new AudioPlayer[numberOfSoundEffects];
  color tropical = #30D15C;
  PFont generalFont;
  Boolean stopBoolean = false, pauseBoolean=false, changeState=false;
//
void setup() {
  //size() or fullscreen()
  //Display Algorithm
  minim = new Minim(this);
  //
//Music file load
  String relativeMusicPathway = "Audio Library/Songs/"; 
  String absoluteMusicPath = sketchPath( relativeMusicPathway ); 
  musicFolder = new File(absoluteMusicPath);
  int musicFileCount = musicFolder.list().length;
  File[] musicFiles = musicFolder.listFiles();
  String[] songFilePathway = new String[musicFileCount];
  for ( int i = 0; i < musicFiles.length; i++ ) {
    songFilePathway[i] = ( musicFiles[i].toString() );
  }
  numberOfSongs = musicFileCount; 
  playList = new AudioPlayer[numberOfSongs]; 
  printArray(playList);
  playListMetaData = new AudioMetaData[numberOfSongs]; 
  for ( int i=0; i<musicFileCount; i++ ) {
    printArray(playList);
    playList[i]= minim.loadFile( songFilePathway[i] );
    playListMetaData[i] = playList[i].getMetaData();
  } //End Music Load
//Sound Effects load
  String relativeSoundPathway = "Audio Library/SoundEffects/";//Relative pathay
  String absoluteSoundPath = sketchPath( relativeSoundPathway); // 
  SoundEffectsFolder = new File(absoluteSoundPath);
  int SoundEffectsFileCount = SoundEffectsFolder.list().length;
  File[] SoundEffectsFiles = SoundEffectsFolder.listFiles();
  String[] SoundEffectsFilePathway = new String[SoundEffectsFileCount];
  for ( int i = 0; i < SoundEffectsFiles.length; i++) { 
   SoundEffectsFilePathway[i] = ( SoundEffectsFiles[i].toString() );
  }
  //
  numberOfSoundEffects = SoundEffectsFileCount;
  SoundEffects = new AudioPlayer[numberOfSoundEffects];
  for ( int i=0; i<SoundEffectsFileCount; i++ ) {
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
  //
  //if ( playList[currentSong].islooping() && playList[currentSong].loopCount()=-1 ) println("there are", playList[currentSong].loopCount(), "loops left");
  //if ( playList[currentSong].islooping() && playList[currentSong].loopCount()==-1 ) println("Looping Infinitely"); 
  //if ( playList[currentSong].isPlaying() && !playList[currentSong].isLooping() ) println("Play Once");
  //
  //songMetaData1[currentSong].title();
  rect(width*1/4, height*0, width*1/2, height*3/10);
  fill(tropical);
  textAlign (CENTER, CENTER);
  //
  int size = 10; 
  textFont(generalFont, size); 
  text(playListMetaData[currentSong].title(), width*1/4, height*0, width*1/2, height*3/10 );
  fill(255); 
  //
  // Autoplay, next song automatically plays
  if ( playList[currentSong].isPlaying() ) { 
    if ( stopBoolean == true || pauseBoolean==true ) {
      playList[currentSong].pause();  //auto.rewind(); 
    }
    if ( stopBoolean==true ) playList[currentSong].rewind();
  } else { 
    //
   if ( changeState==false ) { 
     playList[currentSong].rewind();
     if (currentSong==numberOfSongs-1) {
       currentSong=0;
     } else {
      currentSong = currentSong + 1;
     } 
    playList[currentSong].play();
    //
   }
   if ( stopBoolean==false && pauseBoolean==false && changeState==true ) {
      playList[currentSong].rewind();
      playList[currentSong].play();
      changeState=false;
      //
   }
   if ( pauseBoolean==false && stopBoolean==false  && changeState==true) {
      playList[currentSong].play();
      changeState=false;
      //
    }
  }
} // end draw
void keyPressed() {
  if ( SoundEffects[0].position() !=0 ) SoundEffects[0].rewind();
 SoundEffects[0].play();
  println ( "herek1", playList[currentSong].isPlaying(), pauseBoolean );
  //
  //Play
  if ( key=='P' || key=='p'  ) {
    changeState=true;
    if  ( pauseBoolean==false ) {
    println("herek2", pauseBoolean);
 } else {
   pauseBoolean=false;
   println("herek3", pauseBoolean);
 }
 if ( stopBoolean==true ) { 
   stopBoolean=false;
 }
 println( "herek4", playList[currentSong].isPlaying(), pauseBoolean, stopBoolean, changeState );
 }
 // Stop
  if ( key=='S' | key=='s' ) {
    changeState=true;
    if ( stopBoolean ==false ) {
      stopBoolean = true;
    } else { 
      stopBoolean = false;
      //
    }
  }
  //Next and Previous
  if ( key==CODED && keyCode==LEFT) { //Previous
    if ( playList[currentSong].isPlaying() ) {
     playList[currentSong].pause();
     playList[currentSong].rewind();
     if (currentSong==0) {
       currentSong=numberOfSongs-1;
     } else { 
       currentSong = currentSong - 1;
     }
    }
    println(currentSong);
    playList[currentSong].play();
  } //End Previous 
  //Next
  if ( key==CODED && keyCode==RIGHT ) { //Next
  } //END Next
  //
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

//Music Player //Multi-soundcodes
import java.io.*; //How to import java?
//
import ddf.minim.*; 
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
//
//Global variables
File songsFolder, SoundEffectsFolder;
Minim minim;
int numberOfSongs = 1,  numberOfSoundEffects = 2;  //<>//
AudioPlayer[] playlist = new AudioPlayer[ numberOfSongs ]; //
AudioPlayer[] playListMetaData = new AudioPlayer[ numberOfSoundEffects ]; 
AudioMetaData[] SoundEffects = new AudioMetaData[ numberOfSSondEffects];
PFont generalFont;
color tropical = #30D15C;
PFont generalFont;
//
void setup() {
  //size() or fullscreen()
  //Display Algorithm
  String relativeMusicPathway = "Audio Library/SoundEffects/";//Relative pathay
  String absolutSoundPath = sketchPath( relativeSoundPathway); // 
    SoundEffectFolder = new File(absoluteSoundPath);
  int SoundEffectCount = SoundEffectFoler.list().length;
  File[] soundEffectFiles = SoundEffectFolder.listfiles();
  String[] songFilePathway = new Striing[soundEffectFileCount];
  for ( int i = 0; i < SoundEffectFiles.length; i++) { 
    soundEffectFIlePathway[i] = ( soundEffectFiles[i].toString() );
  }
  //
  numberofSoundEffects = soundEffectsFileCount;
  soundEffects = newAudioPlayer[numberOfsoundEffects];
  for ( inti=0; i<SoundEffectsFileCount; i++ ); 
  } //end SoundEffect load
  //
  //print(path);
  song[0] = minim.loadFile( path );
  songMetaData[0] = song[0].getMetaData(); 
  generalFont = createFont ("Algerian", 55);
  playList[0] 
  //
} // end setup
// 
void draw() {
  if ( song[0].islooping() && song[0].loopCount()=-1 ) println("there are", song[0].loopCount(), "loops left");
  if ( song[0].islooping() && song[0].loopCount()==-1 ) println("Looping Infinitely"); 
  if ( song1.isPlaying() && !song1.isLooping() ) println("Play Once");
  //
  //Println();
  //songMetaData[0].title()
  rect(width*1/4, height*0, width*1/2, height*1/10);
  fill(tropical);
  textAlign (CENTER, CENTER);
  //
  int size = 10; 
  textFont(generalFont, size); 
  text(songMetaData[0].title(), width*1/4, height*0, width*1/2, height*3/10 );
  fill(255); 
} // end draw
//
void keyPressed() {
  SoundEffects[2].play
  /*if ( key==' ' || key==' '  ) song[0].play();
  //
  println(key);
  if ( key>= '1' || key<='9'  ) { 
  String keystr = String.valueOf(key);
  //println(keystr);
  int loopNum = int(keystr); //Java, strongly formatted
  song[0].loop(loopNum);
  }
    if ( key=='L' || key=='l' ) song1.loop(); //Infinite Loop, no parameter OR -1
  //
  if ( key=='M' || key=='m' ) { //Mute Button
    if ( song1.isMuted() ) {
      song1.unmute();
    } else {
      
      song1.mute();
    }
  } //End MUTE
  // skip forward 
  if ( key=='F' || key =='f' ) song1.skip( 0 );
  if (key=='R' || key =='r' ) song1.skip( 1000 ); 
  //
  if ( key=='S' | key=='s' ) {
    if ( song1.isPlaying() ) {
      song1.pause();
    } else {  
      song1.rewind();
    }
  }
  //Pause
  if ( key=='Y' | key=='y' ) {
    if ( song1.isplaying()==true ) { 
      song1.pause();
    } else { 
      song1play();
    }
  } */
} //end keyPressed
//
void mousePressed() {
 //
} //end mousePressed
//
// End Main Program

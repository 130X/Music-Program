import java.io.*; //Music Player //Multi-soundcodes //How to import java?
//
import ddf.minim.*; 
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
//
//Global variables
File musicFolder, SoundEffectsFolder;
Minim minim;
int numberOfSongs = 1,  numberOfSoundEffects = 2;  //<>//
AudioPlayer[] playlist = new AudioPlayer[numberOfSongs]; //
AudioMetaData[] playListMetaData = new AudioMetaData[numberOfsongs]; 
AudioPlayer[] SoundEffects = new AudioPlayer[numberOfSoundEffects];
color tropical = #30D15C;
PFont generalFont;
//
void setup() {
  //size() or fullscreen()
  //Display Algorithm
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
  int SoundEffectsCount = SoundEffectsFoler.list().length;
  File[] SoundEffectsFiles = SoundEffectsFolder.listfiles();
  String[] SoundEffectsFilePathway = new String[SoundEffectsFileCount];
  for ( int i = 0; i < SoundEffectsFiles.length; i++) { 
   SoundEffectFIlePathway[i] = ( SoundEffectsFiles[i].toString() );
  }
  //
  numberofSoundEffects = SoundEffectsFileCount;
  SoundEffects = newAudioPlayer[numberOfSoundEffects];
  for ( inti=0; i<SoundEffectsFileCount; i++ ) {
    SoundEffects[i]=minim.loadFile( SoundEffectsFilePathway[i] );
  } //end SoundEffect load
  //
  minim= new Minim(this);
  //
  generalFont = createFont ("Algerian", 55);
  playList[0].play();
} // end setup
// 
void draw() {
  if ( playList[0].islooping() && playList[0].loopCount()=-1 ) println("there are", playList[0].loopCount(), "loops left");
  if ( playList[0].islooping() && playList[0].loopCount()==-1 ) println("Looping Infinitely"); 
  if ( playList[0].isPlaying() && !playList[0].isLooping() ) println("Play Once");
  //
  //songMetaData[0].title()
  rect(width*1/4, height*0, width*1/2, height*1/10);
  fill(tropical);
  textAlign (CENTER, CENTER);
  //
  int size = 10; 
  textFont(generalFont, size); 
  text(playListMetaData[0].title(), width*1/4, height*0, width*1/2, height*3/10 );
  fill(255); 
} // end draw
//
void keyPressed() {
  SoundEffects[2].play();
  if ( SoundEffects[2].position() ) {
    SoundEffects[2].rewind();
  //
  } else {
  }
  //Play
  if ( key==' ' || key==' '  ) playList[0].play();
  //Stop/Pause
  if ( key=='v' | key=='v' ) {
    if ( playList[0].isplaying()==true ) { 
      playList[0].pause();
    } else { 
      playList[0]play();
    }
  }
  //Loop
  if ( key>= '1' || key<='9'  ) { 
  String keystr = String.valueOf(key);
  //println(keystr);
  int loopNum = int(keystr); //Java, strongly formatted
  playList[0].loop(loopNum);
  }
    if ( key=='L' || key=='l' ) playList[0].loop(); //Infinite Loop, no parameter OR -1
  //Mute 
  if ( key=='M' || key=='m' ) { 
    if ( playList[0].isMuted() ) {
      playList[0].unmute();
    } else {
      playList[0].mute();
    }
  } 
  // Skip 
  if ( key=='F' || key =='f' ) playList[0].skip( 0 );
  if (key=='R' || key =='r' ) playList[0].skip( 1000 ); 
  //
  if ( key=='S' | key=='s' ) {
    if ( playList[0].isPlaying() ) {
      playList[0].pause();
    } else {  
      playList[0].rewind();
    }
  }
} //end keyPressed
//
void mousePressed() {
 //
} //end mousePressed
//
// End Main Program

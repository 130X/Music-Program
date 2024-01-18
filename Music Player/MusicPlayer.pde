import java.io.*; //<>// //<>//
//Music Player //not done
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
int numberOfSongs = 2, numberOfSoundEffects = 2;
int currentSong = numberOfSongs - numberOfSongs + int ( random(numberOfSongs) );// Variable is rewritten in setup()
AudioPlayer[] playList = new AudioPlayer[numberOfSongs]; //
AudioMetaData[] playListMetaData = new AudioMetaData[numberOfSongs];
AudioPlayer[] SoundEffects = new AudioPlayer[numberOfSoundEffects];
color tropical = #30D15C, resetColour = #FFFFFF, grey = #cccccc;
PFont generalFont;
Boolean stopBoolean = false, pauseBoolean=false, changeState=false, playButtonBoolean = false, muteButtonBoolean = false;
//image
PImage play, pause, mute, unmute, forward, backward, next, previous, close;
//
void setup() {
  size(900, 700);
  //fullScreen();
  //Display Algorithm
  minim = new Minim(this);
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
  generalFont = createFont ("Algerian", 30);
  //
  //currentSong =  numberOfSongs - numberOfSongs + int ( random(numberOfSongs) );
  currentSong = int ( random(0, numberOfSongs-1) );
  //println("Random Start", currentSong);
  //
  playList[currentSong].play();
  //
  //Pathways for image
  String imagePathway = "images/";
  //
  play = loadImage(imagePathway + "play.png");
  pause = loadImage(imagePathway + "pause.png");
  mute = loadImage(imagePathway + "mute.png");
  unmute = loadImage(imagePathway + "unmute.png");
  forward = loadImage(imagePathway + "forward.png");
  backward = loadImage(imagePathway + "backward.png");
  next = loadImage(imagePathway + "next.png");
  previous = loadImage(imagePathway + "previous.png");
  close = loadImage(imagePathway + "close.png");
  //
} // end setup
//
void draw() {
  //Title
  // AudioMetaData[currentSong].title();
  generalFont = createFont ("Algerian", 30);
  rect  ( width*1/4, height*0, width*1/2, height*1/5 );
  fill  ( tropical);
  textAlign (CENTER, CENTER);
  //
  int size = 30;
  textFont  ( generalFont, size);
  text  ( playListMetaData[currentSong].title(), width*1/4, height*0, width*1/2, height*1/5 );
  fill  ( resetColour );
  //Auto-Play Removed
  //
  //
  //Image Positions
  //Play and Pause
  noStroke();
  fill(grey);
  rect( width*1/2, height*9/10, width*1/10, height*1/10);
  stroke(1);
  fill(resetColour);
  if (playButtonBoolean == false) {
    image (pause, width*1/2, height*9/10, width*1/10, height*1/10  );
  } else {
    image(play, width*1/2, height*9/10, width*1/10, height*1/10);
  }
  //
  // Skip forward and backward
  image(forward, width*3/5, height*9/10, width*1/10, height*1/10 );
  image(backward, width*2/5, height*9/10, width*1/10, height*1/10);
  //
  // Next and previous song
  image(next, width*4.5/5, height*9/10, width*1/10, height*1/10 );
  image(previous, width*0/5, height*9/10, width*1/10, height*1/10);
  //
  // mute and umute
  // noStroke();
  // fill(grey);
  rect( width*3.5/5, height*9/10, width*1/10, height*1/10);
  stroke(1);
  fill(resetColour);
  if (muteButtonBoolean = false) {
    image (mute, width*3.5/5, height*9/10, width*1/10, height*1/10);
  } else {
    image(unmute, width*3.5/5, height*9/10, width*1/10, height*1/10);
  }
  //
  image(close, width*4.5/5, height*0.1/10, width*1/10, height*1/10);
  //
  //
  if (playButtonBoolean ==true) {
    playList[currentSong].pause();
  } else {
    playList[currentSong].play();
  }
  //
  if (muteButtonBoolean == false) {
    playList[currentSong].mute();
  } else {
    playList[currentSong].unmute();
  }


  //
} // end draw
void keyPressed() {
  if ( SoundEffects[1].position() !=1 ) SoundEffects[0].rewind();
  //SoundEffects[1].play();
  //
  //Play
  if ( key=='P' || key=='p'  ) {
    //changeState = true;
    if ( pauseBoolean==false) {
      //pauseBoolean=true;
      //println("paused");
    } else {
      playButtonBoolean = false;
      pauseBoolean=false;

      println("played");
    }
  }
  //
  //Pause
  if ( key=='S'|| key=='s'  ) {
    //changeState = true;
    if ( pauseBoolean==false ) {
      pauseBoolean = true;
      playButtonBoolean = true;

      println("paused");
    } else {
      //pauseBoolean = false;
      //println("play");
      // Optionally, you can resume playing here if needed:
      // playList[currentSong].play();
    }
  }
  //Next and Previous
  //For Next You have to press the Right Key and  IF theres a song playing it will
  //pause it then rewind it then it would play next song;
  //if statement is to find out if its on the last song and if it is it will restart and play the first song of the playlist
  //THe opposite is true for the previous button
  if ( key==CODED && keyCode==LEFT) { //Previous
    if ( playList[currentSong].isPlaying() ) {
      playList[currentSong].pause();
      playList[currentSong].rewind();
      if (currentSong == 0) {
        //
        currentSong = numberOfSongs - 1 ;
        //
      } else {
        currentSong -= 1;
      }
    }
    println(currentSong);
    playList[currentSong].play();
  } //End Previous
  //Next
  if ( key==CODED && keyCode==RIGHT ) { //Next
    if ( playList[currentSong].isPlaying() ) {
      playList[currentSong].pause();
      playList[currentSong].rewind();
      if (currentSong == 2 ) {
        //
        currentSong = numberOfSongs - numberOfSongs ;
        //println()
      } else {
        currentSong = currentSong + 1;
      }
    }
    println(currentSong);
    playList[currentSong].play();
  } //END Next
  //Mute
  //A pretty easy button If the song is muted then it unmutes the sound
  //but if its unmuted and you press M/m then it mutes it
  if ( key=='M' || key=='m' ) {
    //changeState = true;
    if ( muteButtonBoolean == true ) {
      muteButtonBoolean = false;
      println("unmuted");
    } else {
      muteButtonBoolean = true;
      println("muted");
    }
  }
  //Skip Forward and Backward
  //if you press D or A  it skips 5000 miliseconds back or forward which is the same as 5 seconds
  //Forward
  if ( key=='D' || key =='d' ) {
    //changeState = true;
    playList[currentSong].skip( 5000 );
    println(" +5 Seconds");
  }
  // Backward
  if (key=='A' || key =='a' ) {
    //changeState = true;
    playList[currentSong].skip( -5000 );
    println(" -5 Seconds");
  }
  //
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
   */
} //end keyPressed
//
void mousePressed() {
  //Play & Pause Buttons
  if ( mouseX>width*1/2 && mouseX<width*1/2+width*1/10 && mouseY>height*9/10 &&mouseY<height*9/10+height*1/10) {
    if (playButtonBoolean == false) {
      playButtonBoolean = true;
    } else {
      playButtonBoolean=false;
    }
  }
  //mute
    if ( mouseX>width*3.5/5 && mouseX<width*3.5/5+width*1/10 && mouseY>height*9/10 && mouseY<height*9/10+height*1/10) {
    if (muteButtonBoolean == false)
      muteButtonBoolean = true;
    } else {
    muteButtonBoolean = false;
  }
  {
  }
  //Skip backward and forward
  //forward
  if (mouseX>width*3/5 && mouseX<width*3/5+width*1/10 && mouseY>height*9/10 && mouseY<height*9/10+height*1/10) {
    playList[currentSong].skip(+5000);
    println("+5");
  }
  //Backword
  if (mouseX>width*2/5 && mouseX<width*2/5+width*1/10 && mouseY>height*9/10 && mouseY<height*9/10+height*1/10) {
    playList[currentSong].skip(-5000);
    println("-5");
  }
  //mute and unmute
  //if ();
  //if
  //
}//end mousePressed
//
// End Main Program

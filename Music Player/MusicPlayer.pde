import java.io.*; //<>// //<>// //<>//
//Music Player //not done //aspect ratio and get buttons working
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
int numberOfSongs = 2, numberOfSoundEffects = 3;
int currentSong = numberOfSongs - numberOfSongs + int ( random(numberOfSongs) );
AudioPlayer[] playList = new AudioPlayer[numberOfSongs]; //
AudioMetaData[] playListMetaData = new AudioMetaData[numberOfSongs];
AudioPlayer[] SoundEffects = new AudioPlayer[numberOfSoundEffects];
color tropical = #30D15C, resetColour = #3d799d, grey = #cccccc, niceblue = #79B3F0, red = #E52020, BB = #33B2F0;
PFont generalFont;
Boolean stopBoolean = false, pauseBoolean=false, changeState=false, playButtonBoolean = false, muteBoolean = false;
//image
PImage play, pause, mute, unmute, forward, backward, next, previous, close, EvoCover, RoaCover, BoeCover, amongus;
color hoverovercolour=resetColour, hoverOverColour = BB;
//float EvoWidth, EvoHeight;
//
void setup() {
  background( niceblue );
  size(1200, 900);
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
  String relativeSoundPathway = "Audio Library/SoundEffects/"; 
  String absoluteSoundPath = sketchPath( relativeSoundPathway); 
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
  //
  currentSong = int ( random(0, numberOfSongs-1) );
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
  EvoCover = loadImage(imagePathway + "Evo.png");
  RoaCover = loadImage(imagePathway + "Roa.png");
  BoeCover = loadImage(imagePathway + "Boe.png");
  amongus = loadImage(imagePathway + "amongus.jpg");
  //
  //Not Aspect ratio
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
  //
  //
  //
  //HoverOvers
   if (mouseX>width*1/2 && mouseX<width*1/2+width*1/10 && mouseY>height*9/10 &&mouseY<height*9/10+height*1/10) { //Play and pause
    image(play, width*1/2, height*9/10, width*1/10, height*1/10);
    hoverOverColour = BB;
    fill( hoverOverColour );
    rect(  width*1/2, height*9/10, width*1/10, height*1/10 );  
    fill( resetColour );
    //
  } else if ( mouseX>width*3.5/5 && mouseX<width*3.5/5+width*1/10 && mouseY>height*9/10 && mouseY<height*9/10+height*1/10 ) { // mute and umute
    hoverOverColour = BB;
    //fill( hoverOverColour );
   rect(width*3.5/5, height*9/10, width*1/10, height*1/10 );
   //
  } else if ( mouseX>width*3.8/5 && mouseX<width*3.8/5+width*1/10 && mouseY>height*0.9/2 && mouseY<height*0.9/2+height*1/10 ) { //Next
    hoverOverColour = BB;
    fill( hoverOverColour );
   rect( width*3.8/5, height*0.9/2, width*1/10, height*1/10 );
   //
  } else if ( mouseX>width*0.7/5 && mouseX<width*0.7/5+width*1/10 && mouseY>height*0.9/2 && mouseY<height*0.9/2+height*1/10) { //Previous
    hoverOverColour = BB;
    fill( hoverOverColour );
   rect( width*0.7/5, height*0.9/2, width*1/10, height*1/10);
   //
    } else if (mouseX>width*3/5 && mouseX<width*3/5+width*1/10 && mouseY>height*9/10 && mouseY<height*9/10+height*1/10 ) { //Forward
    hoverOverColour = BB;
    fill( hoverOverColour );
   rect( width*3/5, height*9/10, width*1/10, height*1/10 );
   //
    } else if (mouseX>width*2/5 && mouseX<width*2/5+width*1/10 && mouseY>height*9/10 && mouseY<height*9/10+height*1/10 ) { //Backwards
    hoverOverColour = BB;
    fill( hoverOverColour );
   rect( width*2/5, height*9/10, width*1/10, height*1/10);
   //
  } else if ( mouseX>width*4.5/5 && mouseX<width*4.5/5+width*1/10 && mouseY>height*0.1/10 && mouseY<height*0.1/10+height*1/10) { //close
    hoverOverColour = red; //close
    fill( hoverOverColour );
   rect(width*4.5/5, height*0.1/10, width*1/10, height*1/10);
  } else { 
    hoverOverColour = resetColour;
    fill( hoverOverColour );
    rect( width*1/2, height*9/10, width*1/10, height*1/10 ); //play
    rect(  width*3.5/5, height*9/10, width*1/10, height*1/10 ); //mute
    rect( width*3.8/5, height*0.9/2, width*1/10, height*1/10  ); //next
    rect( width*0.7/5, height*0.9/2, width*1/10, height*1/10 ); //previous 
    rect(  width*3/5, height*9/10, width*1/10, height*1/10  ); //foward
    rect(  width*2/5, height*9/10, width*1/10, height*1/10 ); //backward
    rect(width*4.5/5, height*0.1/10, width*1/10, height*1/10);//close
    
  }
  //
  //
  //
  //
  //Image Positions
  // mute and umute
  fill(hoverOverColour);
  rect( width*3.5/5, height*9/10, width*1/10, height*1/10);
  fill(resetColour);
  if (muteBoolean == true) {
    image (mute, width*3.5/5, height*9/10, width*1/10, height*1/10);
  } else {
    image(unmute, width*3.5/5, height*9/10, width*1/10, height*1/10);
  } 
   //
  //Play and Pause
  fill(hoverOverColour);
  rect( width*1/2, height*9/10, width*1/10, height*1/10);
  fill(resetColour);
  if (playButtonBoolean == false) {
    image (pause, width*1/2, height*9/10, width*1/10, height*1/10  );
  } else {
    image(play, width*1/2, height*9/10, width*1/10, height*1/10);
  }
  //
  //
  // Skip forward and backward
  image(forward, width*3/5, height*9/10, width*1/10, height*1/10 );
  image(backward, width*2/5, height*9/10, width*1/10, height*1/10);
  //
  // Next and previous song
  image(next, width*3.8/5, height*0.9/2, width*1/10, height*1/10 );  
  image(previous, width*0.7/5, height*0.9/2, width*1/10, height*1/10);  
  //
  //
  //play
  if (playButtonBoolean == true) {
    playList[currentSong].pause();
    //playList[currentSong].pause();
  } else {
    playList[currentSong].play();
  }
  //Mute
  //amongus
  image(amongus, width*0.1/5, height*0.2/10, width*1/10, height*1/10);
  //Close
  image(close, width*4.5/5, height*0.1/10, width*1/10, height*1/10);
  //
  //Images for songs
  //image( EvoCover, width*1.26/5, height*2/9, width*1/2, height*1/2  );
  //image( RoaCover, width*1.26/5, height*2/9, width*1/2, height*1/2   );
  image( BoeCover, width*1.26/5, height*2/9, width*1/2, height*1/2   );
  //
} // end draw
void keyPressed() {
  if (  key=='Q' || key =='q' ) {
  if ( SoundEffects[0].position() !=1 ) SoundEffects[0].rewind();
  SoundEffects[0].play();
  }
  //
  //Play and pause
  if ( key==' '  ) {
    if (playButtonBoolean == true) {
      playButtonBoolean = false;
      //playList[currentSong].pause();
    } else {
      playButtonBoolean = true;
    }
  }
  //
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
  if ( key=='M' || key=='m' ) {
    if ( playList[currentSong].isMuted() ) {
      playList[currentSong].unmute();
      muteBoolean = false;
      println("unmuted");
    } else {
      playList[currentSong].mute();
      muteBoolean = true;
      println("muted");
    }
  }
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
  if ( mouseX>width*3.5/5 && mouseX<width*3.5/5+width*1/10 && mouseY>height*9/10 && mouseY<height*9/10+height*1/10 ) {
    if ( playList[currentSong].isMuted()) {
      playList[currentSong].unmute();
      muteBoolean = false;
      println("unmuted");
    } else {
      playList[currentSong].mute();
      muteBoolean = true;
      println("muted");
    }
  }
  //
  //Next and Previous
  //Next
  if (mouseX>width*3.8/5 && mouseX<width*3.8/5+width*1/10 && mouseY>height*0.9/2 && mouseY<height*0.9/2+height*1/10) {
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
  //Previous
  if (mouseX>width*0.7/5 && mouseX<width*0.7/5+width*1/10 && mouseY>height*0.9/2 && mouseY<height*0.9/2+height*1/10) {
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
  //
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
  //soundeffect
  if (mouseX>width*0.1/5 && mouseX<width*0.1/5+width*1/10 && mouseY>height*0.2/10 && mouseY<height*0.2/10+height*1/10) {
    if ( SoundEffects[0].position() !=1 ) SoundEffects[0].rewind();
  SoundEffects[0].play();
  }
  //close
  if (mouseX>width*4.5/5 && mouseX<width*4.5/5+width*1/10 && mouseY>height*0.1/10 && mouseY<height*0.1/10+height*1/10) exit();
  //
}//end mousePressed
//
//
// End Main Program

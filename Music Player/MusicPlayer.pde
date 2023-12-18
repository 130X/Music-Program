//Music Player //Multi-soundcode

import java.io*;
//
import ddf.minim.*; 
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
//

//Global variables
Minim  minim; //<>//
int numberOfSongs = 2; 
int numberOfSoundEffects = 3; 
AudioPlayer[] song = new AudioPlayer[ numberOfSongs ]; //
AudioPlayer[] soundEffect = new AudioPlayer[ numberOfSoundEffects ]; 
AudioMetaData[] songMetaData = new AudioMetaData[ numberOfStrings ];
PFont generalFont;
color tropical = #30D15C;
//
void setup() {
  //size() or fullscreen()
  //Display Algorithm
  minim = new Minim(this);
  String groove = "groove.mp3";
  String extension = ".mp3";
  String pathway = "FreeWare Music/MusicDownload/";
  String path = sketchPath( pathway + groove);
  //
  print(path);
  song[0] = minim.loadFile( path );
  songMetaData[0] = song[0].getMetaData(); 
  generalFont = createFont ("Algerian", 55); 
  //
  println("File Name", songMetaData[0].fileName() );
  //18 lines 
  println("Song Length (in milliseconds)", songMetaData[0].length() );
  println("Song Length (in seconds)", songMetaData[0].length()/1000 );
  println("Song Length (in minutes & seconds)", songMetaData1.length()/1000/60, "minutes", ( songMetaData1.length()/1000 - ( songMetaData1.length()/1000/60)*60 ), "seconds" );
  println("Song Title", songMetaData[0].title() ); 
  println("Author", songMetaData[0].author() );
  println("Composers", songMetaData[0].composer() );
  println("Orchestra", songMetaData[0].orchestra() ); 
  println("Album", songMetaData[0].album() );
  println("Disk", songMetaData[0].disc() );
  println("Publisher", songMetaData[0].publisher() );
  println("Date Released", songMetaData[0].date() );
  println("Copyright", songMetaData[0].copyright() );
  println("Comments", songMetaData[0].comment() );
  println("Lyrics", songMetaData[0].lyrics() ); //Optional:
  println("Track", songMetaData[0].track() );
  println("Genre", songMetaData[0].genre() );
  println("Endcoded", songMetaData[0].endcoded() );
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
  if ( key==' ' || key==' '  ) song[0].play();
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
  }
} //end keyPressed
//
void mousePressed() {
 //
} //end mousePressed
//
// End Main Program

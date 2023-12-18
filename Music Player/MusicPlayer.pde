//Library: use Sketch / Import Library / Minim
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
//
//Global variables
//you need to feel it

Minim  minim; 
int numberOfSongs = 2; // the number of files in   the Folder
int numberOfSoundEffects = 3; // the number of files in   the Folder
AudioPlayer[] song = new AudioPlayer[ numberOfSongs ]; //
AudioPlayer[] soundEffect = new AudioPlayer[ numberOfSoundEffects ]; //Sound effects
AudioMetaData[] songMetaData = new AudioMetaData[ numberOfStrings ]; //
PFont generalFont;
color tropical = #30D15C;
//
void setup() {
  //size() or fullscreen()
  //Display Algorithm //<>//
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
  println("Song Length (in minutes & seconds)", songMetaData[0].?()/1000/60, "minutes", songMetaData[0].length()/1000 - ( songMetaData[0].length()/1000  ( songMetaData[0].?()/1000/60)*60),  );// gets formula 
  println("Song Title", songMetaData[0].title() ); 
  println("Author", songMetaData[0].author() );
  println("Composers", songMetaData[0].composer() );
  println("Orchestra", songMetaData[0].orchestra() ); 
  println("Album", songMetaData[0].album() );
  println("Disk", songMetaData[0].disc() );
  println("Publisher", songMetaData[0].publisher) );
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
  if ( song[0].isPlaying() && !song!.loopCount()==1 ) println("Playing Once"); 
  //
  //Println();
  //songMetaData[0].title()
  rect(width*1/4, height*0, width*1/2, height*1/10);
  fill(purple);
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
  if() if ( key=='L' || key =='l' ) song[0].loop(); //Loop
  if() if ( key=='M' || key =='m' ) { //Mute
    if ( .isMute() ) { 
      song[0].unmute();
    } else { 
      //might rewind the song 
      .mute();
    }
  } //mute end 
  // skip forward 
  if ( key=='F' || key =='f' ) .skip();
  if () .skip(); 

} //end keyPressed
//
void mousePressed() {
 //
} //end mousePressed
//
// End Main Program

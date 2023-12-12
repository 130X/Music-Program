//Library: use Sketch / Import Libaray / minim 


//Global variables
Minim  minim;// 
audioPlayer song1; //
AudioMetaData SongMetaData1; //
PFont GeneralFont;
color purple = #2C08FF;
//
void setup() {
  //size() or fullscreen()
  //Display Algorithm //<>//
  minim = new Minim(this);
  String pathway = "../FreeWare Music/Music Download/";
String groove = "groove.mp3";
String extension = ".mp3";
String 
String
 song1 = minim.loadFile( pathway + groove );
//
print(path);
song1 = minim.loadfile( path );
 songMetaData1 = song1.getMetaData();
 //Title 
 generalFont = createFont ("chiller", 55); 
  //song1.loop(0);
  //
  //Meta Data Println Testing 18 lines 
  println("Song Length (in milliseconds)", songMetaData1.length() );
  println("Song Length (in seconds)", songMetaData1.length()/1000 );
  println("Song Length (in minutes & seconds)", songMetaData1.?()/1000/60, "minutes", songMetaData1.length()/1000 - ( songMetaData1.length()/1000  ( songMetaData1.?()/1000/60)*60),  );// gets formula 
  println("Song Title", songMetaData1.title() ); 
  println("Author", songMetaData1.author() );
  println("Composers", songMetaData1.composer() );
  println("Orchestra", songMetaData1.orchestra() ); 
  println("Album", songMetaData1.album() );
  println("Disk", songMetaData1.disc() );
  println("Publisher", songMetaData1.publisher) );
  println("Date Released", songMetaData1.date() );
  println("Copyright", songMetaData1.copyright() );
  println("Comments", songMetaData1.comment() );
  println("Lyrics", songMetaData1.lyrics() ); //Optional:
  println("Track", songMetaData1.track() );
  println("Genre", songMetaData1.genre() );
  println("Endcoded", songMetaData1.endcoded() );
// must use pure java 
 
  //
} // end setup
// 
void draw() {
  if ( song1.islooping() && song1.loopCount()=-1 ) println("there are", song1.loopCount(), "loops left");
  if ( song1.islooping() && song1.loopCount()==-1 ) println("Looping Infinitely"); 
  if ( song1.isPlaying() && !song!.loopCount()==1 ) println("Playing Once"); 
  //
 //Println();
 // songMetaData1.title()
 rect(width*1/4, height*0, wdith*1/2, height*1/10);
 fill(purple);
 textAlign (titileFOnt, 30);
 int size = 30; 
 textFont(generalFont, size); 
 textFont(titlefont, 30);
 text(songMetaData.title(), width*1/4, height*0, width*1/2, height*1/10 );
 fill(255);
} // end draw
//
void keyPressed() {
  if ( key==' ' || key==' '  ) song1.play();
  //
  println(key);
  if ( key>= '1' || key<='9'  ) { 
  String keystr = String.valueOf(key);
  //println(keystr);
  int loopNum = int(keystr); //Java, strongly formatted
  song1.loop(loopNum);
  }
  if() if ( key=='L' || key =='l' ) song1.loop(); //Loop
  if() if ( key=='M' || key =='m' ) { //Mute
    if ( .isMute() ) { 
      sogn1.unmute();
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

//Library: use Sketch / Import Libaray / minim 


//Global variables
Minim  minim;// 
audioPlayer song1; //
AudioMetaData SongMetaData1; //

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
  //song1.loop(0);
  //
  //Meta Data Println Testing 18 lines 
  println("?", songMetaData1.?() );
  println("file name", songMetaData1.fileName() );

 
  //
} // end setup
// 
void draw() {
  if ( song1.islooping() && song1.loopCount()=-1 ) println("there are", song1.loopCount(), "loops left");
  if ( song1.islooping() && song1.loopCount()==-1 ) println("Looping Infinitely"); 
  if ( song1.isPlaying() && !song!.loopCount()==1 ) println("Playing Once"); 
  //
 //Println();
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

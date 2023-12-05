//Library: use Sketch / Import Libaray / minim 
////

//Global variables
Minim minim; 
String pathway = "../FreeWare Music/Music Download/";
String groove = "songname.mp3";
String extension = ".mp3";
 song1 = minim.loadFile( pathway + groove ); 
//
void setup() {
  //size() or fullscreen()
  //Display Algorithm
  minim = new Minim(this);
  String
  String
  String
  String
  String
  //
} // end setup
// 
void draw() {
  if ( song1.islooping() && song1.loopCount()=-1 ) println("there are", song1.loopCount(), "loops left");
  if ( song1.islooping() && song1.loopCount()==-1 ) println("Looping Infinitely"); 
  if ( song1.isPlaying() && !song!.loopCount()==1 ) println("Playing Once"); 

} // end draw
//
void keyPressed() {
  if ( key==' ' || key==' '  ) song1.play();
  //
  println(key);
  if ( key== '1' || key=='9'  ) { 
  String keystr = String.valueOf(key);
  println(keystr);
  int loopNum = int(keystr);
  song1.loop(loopNum);
  }
  if() if ( key=='L' || key =='l' ) song1.loop();
} //end keyPressed
//
void mousePressed() {
 //
} //end mousePressed
//
// End Main Program

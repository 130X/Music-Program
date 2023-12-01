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
} // end setup
// 
void draw() {
  // 
} // end draw
//
void keyPressed() {
  song1.loop(1)
} //end keyPressed
//
void mousePressed() {
 //
} //end mousePressed
//
// End Main Program

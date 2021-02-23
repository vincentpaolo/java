import controlP5.*;
import ddf.minim.effects.*;
import ddf.minim.*;


Minim minim;
AudioPlayer player;

AudioSample kick;
AudioSample snare;
AudioSample hat;
AudioSample pad1;
AudioSample drumbreak;

ControlP5 cp5;

String dashboardMsg;

int myColor = color(0);
int sliderValue = 100;
int sliderTicks1 = 100;
int sliderTicks2 = 30;
Slider abc;

PImage bg;

int value = 0;

void setup(){
  // canvassize also bg (WJ-SP303.png) needs to be same size as canvas
  size (655, 899);
  bg = loadImage("WJ-SP303.png");
  smooth();
  dashboardMsg="";  //Init
  
  cp5 = new ControlP5(this);
      
      //sampler button 1/8 
      // EXT & hold
      
   cp5.addButton("1")
     .setPosition(75,647)
     .setSize(89,74)
     .updateSize();
     
   cp5.addButton("2")
     .setPosition(178,647)
     .setSize(89,74)
     .updateSize();
     
   cp5.addButton("3")
     .setPosition(281,647)
     .setSize(89,74)
     .updateSize();
     
   cp5.addButton("4")
     .setPosition(384,647)
     .setSize(89,74)
     .updateSize();
     
   cp5.addButton("5")
     .setPosition(75,741)
     .setSize(89,74)
     .updateSize();
     
   cp5.addButton("6")
     .setPosition(178,741)
     .setSize(89,74)
     .updateSize();
     
   cp5.addButton("7")
     .setPosition(281,741)
     .setSize(89,74)
     .updateSize();
     
   cp5.addButton("8")
     .setPosition(384,741)
     .setSize(89,74)
     .updateSize();
     
   cp5.addButton("HOLD")
     .setPosition(487,647)
     .setSize(89,74)
     .updateSize();
     
   cp5.addButton("EXT SOURCE")
     .setPosition(487,741)
     .setSize(89,74)
     .updateSize();
          
     //gui circle kob
     // Volume, CTRL 1,2,3 MFX
     
   cp5.addKnob("")
      .setPosition(92,115)
      .setSize(91,92)
      .setRange(0,100)
      .setValue(0)
      .setRadius(50)
      .setDragDirection(Knob.VERTICAL);  
      
  
   cp5.addKnob(".")
      .setPosition(218,115)
      .setSize(91,92)
      .setRange(0,255)
      .setValue(0)
      .setRadius(50)
      .setDragDirection(Knob.VERTICAL);
   
   cp5.addKnob("..")
      .setPosition(342,115)
      .setSize(91,92)
      .setRange(0,255)
      .setValue(0)
      .setRadius(50)
      .setDragDirection(Knob.VERTICAL);

   cp5.addKnob("...")
      .setPosition(466,115)
      .setSize(91,92)
      .setRange(0,255)
      .setValue(0)
      .setRadius(50)
      .setDragDirection(Knob.VERTICAL);      
      
    
     
    minim = new Minim(this);     
    kick = minim.loadSample( "kick.wav", // filename
                            512      // buffer size
                         );
    
    if ( kick == null ) kick.trigger();
    
    snare = minim.loadSample( "snare.wav", 512);
    if ( snare == null ) println("Didn't get snare!");
    
    hat = minim.loadSample( "hat.wav", 512);
    if ( hat == null ) println("Didn't get hat!");
    
     pad1 = minim.loadSample( "pad1.wav", 512);
    if ( pad1 == null ) println("Didn't get samplel!");
    
     drumbreak = minim.loadSample( "drumbreak.wav", 512);
    if ( drumbreak == null ) println("Didn't get sample1!");
    
    // loop function l & ; knob on keyboard
    //groove = minim.loadFile("filename.mp3", 2048);
    
}

void draw(){
  // background image SP303
  background(bg);

  text(dashboardMsg,width/2,height/2);
 
}


public void controlEvent(ControlEvent theEvent){
  println(theEvent.getController().getName());
  String buttonName = theEvent.getController().getName();
  
  //load the file depends on button
  {
  if (buttonName =="1") player = minim.loadFile("kick.wav");
  if (buttonName =="2") player = minim.loadFile("snare.wav");
  if (buttonName =="3") player = minim.loadFile("hat.wav");
  if (buttonName =="4") player = minim.loadFile("pad1.wav");
  if (buttonName =="5") player = minim.loadFile("drumbreak.wav");
  
  
  }
  //play
  player.play();
}


void keyPressed(){
  
  if ( key == 'k' ) kick.trigger();
  if ( key == 's' ) snare.trigger();
  if ( key == 'h' ) hat.trigger();
  if ( key == 'd' ) pad1.trigger();
  if ( key == 'e' ) drumbreak.trigger();
  
}    

void myPrint(String msg) {
  dashboardMsg += msg+'\n';
  println(msg);
}
  
void mousePressed(){
  myPrint("");  // Used myPrint() instead of println
}

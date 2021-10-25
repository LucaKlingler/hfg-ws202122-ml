import processing.sound.*;
import oscP5.*;
import netP5.*;

OscP5 oscP5;
SoundFile kick;
SoundFile snare;
SoundFile drum;
SoundFile heartbeat;
float i = 0;

void setup() {
  size(640, 360);
  background(255);


  oscP5 = new OscP5(this, 12000);



  // Load a soundfile from the /data folder of the sketch and play it back
  kick = new SoundFile(this, "kick.wav");
  snare = new SoundFile(this, "snare.wav");
  drum = new SoundFile(this, "drum.wav");
  heartbeat = new SoundFile(this, "heartbeat.wav");
  
  
  /*kick.play();
   delay(2000);
   snare.play();*/
}

void draw() {
}

void oscEvent(OscMessage msg) {
  String address = msg.addrPattern();

  if (address.equals("/wek/outputs")) {
    if (msg.checkTypetag("f")) {
      float firstValue = msg.get(0).floatValue();

      if (firstValue != i) {
        println(" values: "+firstValue);
        if (firstValue == 1) {
          println("trigger kick");
          kick.play();
          i = 0;
        }
        if (firstValue == 2) {
          println("trigger snare");
          snare.play();
          i = 0;
        }
         if (firstValue == 3) {
          println("trigger drum");
          drum.play();
          i = 0;
        }
         if (firstValue == 4) {
          println("trigger heartbeat");
          heartbeat.play();
          i = 0;
        }
      }
      i = firstValue;
    }
  }
}

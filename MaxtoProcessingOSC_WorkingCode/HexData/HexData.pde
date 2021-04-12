import netP5.*;
import oscP5.*;

PImage input;
color hexData;

OscP5 osc;
NetAddress max; 

void setup(){
  input = loadImage("colorfulPhoto.jpg");
  image(input, 0,0); 
  osc = new OscP5(this, 12000);
  max = new NetAddress("127.0.0.1", 5055);
}
void draw(){
  getHex();
  
}

void getHex()
{
  OscMessage maxMessage = new OscMessage("/test");
  for(int i = 0; i < input.width; i++)
  {
    for(int j = 0; j < input.height; j++)
    {
      hexData = input.get(i, j); 
      //println("Color data: " + hexData);
      maxMessage.add(hexData);
      osc.send(maxMessage, max);
    }
  }
}

import netP5.*;
import oscP5.*;

PImage input;
color hexData;
float red;
float green;
float blue;
float chord;
float send;

OscP5 osc;
NetAddress max; 

String redChordMessages[] = { "/EGB", "/CEG", "/DFA" };
String blueMelodyMessages[] = { "/C", "/D" };


void setup(){
  input = loadImage("colorfulPhoto.jpg");
  image(input, 0,0); 
  osc = new OscP5(this, 12000);
  max = new NetAddress("127.0.0.1", 5055);
}
void draw(){
  getHex(); 
}

String getChordMessage(float redValue)
{
  String msg = ""; 
  
  if(redValue > 192 && redValue < 223)
  {
    msg = redChordMessages[0]; 
  }
  else msg =  redChordMessages[1]; 
  
  return msg; 
}

String getMelodyMessage(float blueValue)
{
  String msg = ""; 
  
  if(blueValue > 192 && blueValue < 223)
  {
    msg = blueMelodyMessages[0]; 
  }
  else msg =  blueMelodyMessages[1]; 
  
  return msg; 
}

void getHex()
{
  for(int i = 0; i < input.width; i++)
  {
    for(int j = 0; j < input.height; j++)
    {
      String addr = "/chord"; 
      String addr2 = "/melody"; 

      hexData = input.get(i, j); 
      //println("Red color data: " + red);
      //green = green(hexData);
     // println("Green color data: " + green);
      //blue = red(hexData);
      //println("Blue color data: " + blue);
      //send = 20;
      //chord += red += green += blue;
      chord = chord/3;
      //red += red;
      delay(500);
      red = red(hexData);
      blue = blue(hexData); 
      addr += getChordMessage(red);
      addr2 += getMelodyMessage(blue);
      OscMessage maxMessage = new OscMessage(addr);
      maxMessage.add(red);
      osc.send(maxMessage, max);
      
      OscMessage maxMessage2 = new OscMessage(addr2);
      maxMessage.add(blue);
      osc.send(maxMessage2, max);

    }
    red = red/10;
     //println("Chord color data: " + chord);
     //println("Red color data: " + red);
  }
       //println(send);

//if (message_in.checkAddrPattern("/drawCircle") == true) {
    //String toSend = message_in.get(0).stringValue();
}

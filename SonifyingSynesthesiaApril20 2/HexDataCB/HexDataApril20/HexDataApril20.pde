import netP5.*;
import oscP5.*;

PImage input;
color hexData;
float red;
float green;
float blue;
float chord;
int sendChord;
//int sendMelody;
int sendBeat;
   int sendMelody = (int)random(100, 1000);


OscP5 osc;
NetAddress max; 

String redChordMessages[] = { "/CEG", "/DFA", "/FAHiC", "/DGB", "/ACE", "/BDE", "/EGB", "/CGHiC"};
String blueMelodyMessages[] = { "/C", "/D", "/E", "/F", "/G", "/A", "/B", "/HiC" };
String greenBeatMessages[] = {"/kick", "/snare", "/clap", "/cymbal", "/ahkey"};

void setup() {
  size(1000,1000);
  input = loadImage("colorfulPhoto2.jpg");
  image(input, 0, 0); 
  osc = new OscP5(this, 12000);
  max = new NetAddress("127.0.0.1", 5055);
}
void draw() {
  getHex();
}

//RED HEX - CHORD
String getChordMessage(float redValue)
{
  String msg = ""; 

  if (redValue > 0 && redValue < 31)
  {
    msg = redChordMessages[0];
  }
  else if (redValue >= 32 && redValue <= 63)
  {
    msg = redChordMessages[1];
  }
  else if (redValue >= 64 && redValue <= 95)
  {
    msg = redChordMessages[2];
  }
  else if (redValue >=96 && redValue <= 127)
  {
    msg = redChordMessages[3];
  }
  else if (redValue >= 128 && redValue <= 159)
  {
    msg = redChordMessages[4];
  }
  else if (redValue >= 160 && redValue <= 191)
  {
    msg = redChordMessages[5];
  }
  else if (redValue >= 192 && redValue <= 223)
  {
    msg = redChordMessages[6];
  }
  else if (redValue >= 224 && redValue <= 255)
  {
    msg = redChordMessages[7];
  } 
  else msg =  redChordMessages[0]; 

  return msg;
}//function end

//BLUE HEX - MELODY
String getMelodyMessage(float blueValue)
{
  String msg = ""; 
  if (blueValue >= 0 && blueValue <= 31)
  {
    msg = blueMelodyMessages[0];
  }
  else if (blueValue >= 32 && blueValue <= 63)
  {
    msg = blueMelodyMessages[1];
  }
  else if (blueValue >= 64 && blueValue <= 95)
  {
    msg = blueMelodyMessages[2];
  }
  else if (blueValue >=96 && blueValue <= 127)
  {
    msg = blueMelodyMessages[3];
  }
  else if (blueValue >= 128 && blueValue <= 159)
  {
    msg = blueMelodyMessages[4];
  }
  else if (blueValue >= 160 && blueValue <= 191)
  {
    msg = blueMelodyMessages[5];
  }
  else if (blueValue >= 192 && blueValue <= 223)
  {
    msg = blueMelodyMessages[6];
  }
  else if (blueValue >= 224 && blueValue <= 255)
  {
    msg = blueMelodyMessages[7];
  } 
  else msg =  blueMelodyMessages[0]; 

  return msg;
}//function end

String getBeatMessage(float greenValue)
{
    String msg = ""; 

   if (greenValue > 0 && greenValue < 51)
  {
    msg = greenBeatMessages[0];
  }
  else if (greenValue > 51 && greenValue < 102)
  {
    msg = greenBeatMessages[1];
  }
  else if (greenValue > 102 && greenValue < 153)
  {
    msg = greenBeatMessages[2];
  }
  else if (greenValue > 153 && greenValue < 204)
  {
    msg = greenBeatMessages[3];
  }
  else if (greenValue > 204 && greenValue < 255)
  {
    msg = greenBeatMessages[4];
  }
  else msg =  greenBeatMessages[0]; 
 
   return msg;
}

void getHex()
{
  for (int i = 0; i < input.width; i+=10)
  {
    for (int j = 0; j < input.height; j+=10)
    {
      String addr = "/chord"; 
      String addr2 = "/melody"; 
      String addr3 = "/beat"; 
      sendChord = 500;
      //sendMelody = (int)random(100, 1000);
      sendBeat = 500;

      hexData = input.get(i, j); 

      delay(sendMelody);
      red = red(hexData);
      blue = blue(hexData); 
      green = green(hexData);
      addr += getChordMessage(red);
      addr2 += getMelodyMessage(blue);
      addr3 += getBeatMessage(green);
      
      
      OscMessage maxMessage = new OscMessage(addr);
      maxMessage.add(red);
      //osc.send(maxMessage, max);
      //println(red); //debug
     // println(maxMessage); //debug

      //delay(sendMelody);
      OscMessage maxMessage2 = new OscMessage(addr2);
      maxMessage2.add(blue);
      //osc.send(maxMessage2, max);
      //println(blue); //debug
      //println(maxMessage2); //debug
      
      //delay(sendMelody);
      OscMessage maxMessage3 = new OscMessage(addr3);
      maxMessage3.add(green);
      osc.send(maxMessage3, max);
      //println(green); //debug
      //println(maxMessage3); //debug
    }//j
  }//i
}//getHex

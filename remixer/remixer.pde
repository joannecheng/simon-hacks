import processing.serial.*;
import ddf.minim.*;
import cc.arduino.*;

int NUMBER_BUTTONS = 4;
String AUDIO_DIR = "audio/";

Minim minim;
Arduino arduino;
AudioOutput out;

int ledPins[] =  {3, 5, 10, 13};   //LEDS are on pins 3, 5, 10, 13
int buttonPins[] =  {2, 6, 9, 12};  // BUTTONS are on pins 2,6,9 and 12.  
int button_state;    // This variable will be used to "store" the state of the button.

/// These next two definitions are setting up the buzzer pins. 
/// By sending these HIGH/LOW we can create a sound from the buzzer.
int buzzer_1 = 4;
int buzzer_2 = 7;
                    

void setup()   {
  println(Arduino.list());
  arduino = new Arduino(this, Arduino.list()[0], 9600); //Open Arduino port at the same speed that Arduino is using
  minim = new Minim(this);
  minim.debugOn();
  for (int i = 0; i <= 13; i++){
    arduino.pinMode(i, Arduino.INPUT);

  }  
}


void draw()                     
{
  
    for (int i = 0; i <= 13; i++){
     if (arduino.digitalRead(i) == Arduino.HIGH)
       println("beep! " + str(i));
  }
}



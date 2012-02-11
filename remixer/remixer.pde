import processing.serial.*;
import cc.arduino.*;

final int NUMBER_BUTTONS = 4;
Arduino arduino;
int ledPins[] =  {3, 5, 10, 13};   //LEDS are on pins 3, 5, 10, 13
int buttonPins[] =  {2, 6, 9, 12};  // BUTTONS are on pins 2,6,9 and 12.  
int button_state;    // This variable will be used to "store" the state of the button.

void setup()
{
  //println(Arduino.list());
  arduino = new Arduino(this, Arduino.list()[0], 57600);
  for (int i=0; i<NUMBER_BUTTONS; i++){
    arduino.pinMode(ledPins[i], Arduino.OUTPUT);
    arduino.digitalWrite(buttonPins[i], Arduino.HIGH);
    arduino.pinMode(buttonPins[i], Arduino.INPUT);      
  }  
}

void draw()
{
  int[] button_states = new int[NUMBER_BUTTONS];
  for (int i=0; i<NUMBER_BUTTONS; i++){
    button_states[i] = arduino.digitalRead(buttonPins[i]);
  }
  
  for (int i=0; i<NUMBER_BUTTONS; i++){
    if(button_states[i] == 0){
      arduino.digitalWrite(ledPins[i], Arduino.HIGH);   // set the LED on
    }
    if(button_states[i] == 1){
      arduino.digitalWrite(ledPins[i],Arduino.LOW); 
    }
  }
  
}


#define NUMBER_BUTTONS 4
int ledPins[] =  {3, 5, 10, 13};   //LEDS are on pins 3, 5, 10, 13
int buttonPins[] =  {2, 6, 9, 12};  // BUTTONS are on pins 2,6,9 and 12.  
int button_state;    // This variable will be used to "store" the state of the button.

/// These next two definitions are setting up the buzzer pins. 
/// By sending these HIGH/LOW we can create a sound from the buzzer.
int buzzer_1 = 4;
int buzzer_2 = 7;
                    

void setup()   {
  Serial.println("Hello World");
  for (int i=0; i<NUMBER_BUTTONS; i++){
    pinMode(ledPins[i], OUTPUT);
    digitalWrite(buttonPins[i], HIGH);
    pinMode(buttonPins[i], INPUT);      
  }  

  pinMode(buzzer_1, OUTPUT);
  pinMode(buzzer_2, OUTPUT);
  digitalWrite(buzzer_1, LOW); // buzzer_1 will toggle HIGH/LOW to create the sound - see buzz() function below.
  digitalWrite(buzzer_2, LOW); // buzzer_2 will toggle as well (to create more volume).
}


void loop()                     
{
  int button_states[NUMBER_BUTTONS];
  //init button_states
  for (int i=0; i<NUMBER_BUTTONS; i++){
    button_states[i] = digitalRead(buttonPins[i]);
    Serial.println("button state: " + button_states[i]);
  }
  
  for (int i=0; i<NUMBER_BUTTONS; i++){
    if(button_states[i] == 0){
      digitalWrite(ledPins[i], HIGH);   // set the LED on
      buzz();
    }
    if(button_states[i] == 1){
      digitalWrite(ledPins[i], LOW); 
    }
  }

}


//////////////////////////////////////////////////////////////////////////////////////
void buzz(){
  /// this function makes the buzzer pin move and crease a sound.
  /// By writing the pin HIGH/LOW in a pattern we can create a frequency.
  /// this FOR LOOP is used to repeat the pattern and let us hear the note for second.
  for(int i = 0; i < 100; i++){
  digitalWrite(buzzer_1, HIGH);
  digitalWrite(buzzer_2, LOW);
  delay(1);
  digitalWrite(buzzer_1, LOW);
  digitalWrite(buzzer_2, HIGH);
  delay(1);
  }
}


const int tcButton = 2;    // TC butonu D2
const int absButton = 3;   // ABS butonu D3
const int turboPot = A0;   // Turbo pot A0

bool tcState = false;
bool absState = false;
bool lastTCRead = HIGH;
bool lastABSRead = HIGH;
int lastTurbo = -1;

void setup() {
  pinMode(tcButton, INPUT_PULLUP);
  pinMode(absButton, INPUT_PULLUP);
  Serial.begin(9600); 
}

void loop() {
  bool tcRead = digitalRead(tcButton);
  bool absRead = digitalRead(absButton);

  // TC toggle
  if (tcRead == LOW && lastTCRead == HIGH) {
    tcState = !tcState;
    Serial.print("TC:");
    Serial.println(tcState ? 1 : 0);
  }
  lastTCRead = tcRead;

  // ABS toggle
  if (absRead == LOW && lastABSRead == HIGH) {
    absState = !absState;
    Serial.print("ABS:");
    Serial.println(absState ? 1 : 0);
  }
  lastABSRead = absRead;

  // Turbo potansiyometre
  int turboValue = analogRead(turboPot);
  turboValue = map(turboValue, 0, 1023, 0, 100);
  if (abs(turboValue - lastTurbo) >= 2) {
    lastTurbo = turboValue;
    Serial.print("TURBO:");
    Serial.println(turboValue);
  }

  delay(50);
}

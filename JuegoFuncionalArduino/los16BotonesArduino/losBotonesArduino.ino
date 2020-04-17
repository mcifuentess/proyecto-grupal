//sensores analogos

int sensorValue;
int sensorValue2;
int sensorValue3;
int sensorValue4;
int sensorValue5;
int sensorValue6;
int sensorValue7;
int sensorValue8;
int sensorValue9;
int sensorValue10;
int sensorValue11;
int sensorValue12;
int sensorValue13;
int sensorValue14;
int sensorValue15;
int sensorValue16;





int inputPin = 2;
int inputPin2 = 3;
int inputPin3 = 4;
int inputPin4 = 5;
int inputPin5 = 6;
int inputPin6 = 7;
int inputPin7 = 8;
int inputPin8 = 9;
int inputPin9 = 10;
int inputPin10 = 11;
int inputPin11 = 12;
int inputPin12 = 13;
int inputPin13 = 22;
int inputPin14 = 24;
int inputPin15 = 26;
int inputPin16 = 28;







void setup()
{
  Serial.begin(9600);
}

void loop()
{
  //al dividirlo entre 4 me bota datos de 0-255 y no de 0-1023 ke es lo normal
  sensorValue = digitalRead(inputPin);
  sensorValue2 = digitalRead(inputPin2);
  sensorValue3 = digitalRead(inputPin3);
  sensorValue4 = digitalRead(inputPin4);
  sensorValue5 = digitalRead(inputPin5);
  sensorValue6 = digitalRead(inputPin6);
  sensorValue7 = digitalRead(inputPin7);
  sensorValue8 = digitalRead(inputPin8);
  sensorValue9 = digitalRead(inputPin9);
   sensorValue10 = digitalRead(inputPin10);
   sensorValue11 = digitalRead(inputPin11);
   sensorValue12 = digitalRead(inputPin12);
     sensorValue13 = digitalRead(inputPin13);
   sensorValue14 = digitalRead(inputPin14);
   sensorValue15 = digitalRead(inputPin15);
   sensorValue16 = digitalRead(inputPin16);
  
  
  //sensorValue4 = digitalRead(inputPin4);

  //sensorValue = analogRead(inputPin)/4;
  //sensorValue2 = analogRead(inputPin2)/4;


  //imprimo el dato en consola DEC para poderlo ver yo, Byte para ke lo vea la makina, solo se imprime cuando no se este usando serial.write
  //Serial.println(sensorValue, DEC);
  //Serial.println(sensorValue2, DEC);

  //otra forma de enviar los datos a processing es no usando serial.write, sino serial.println, sin embargo en processing no se utiliza port.read(), sino port.readStringUntil('\n');
  Serial.print(sensorValue);
  Serial.print('T');
  Serial.print(sensorValue2);
  Serial.print('T');
  Serial.print(sensorValue3);
  Serial.print('T');
  Serial.print(sensorValue4);
  Serial.print('T');
  Serial.print(sensorValue5);
  Serial.print('T');
  Serial.print(sensorValue6);
  Serial.print('T');
  Serial.print(sensorValue7);
  Serial.print('T');
  Serial.print(sensorValue8);
  Serial.print('T');
  Serial.print(sensorValue9);
  Serial.print('T');
  Serial.print(sensorValue10);
  Serial.print('T');
  Serial.print(sensorValue11);
  Serial.print('T');
  Serial.print(sensorValue12);
  Serial.print('T');
  Serial.print(sensorValue13);
  Serial.print('T');
  Serial.print(sensorValue14);
  Serial.print('T');
  Serial.print(sensorValue15);
  Serial.print('T');
  Serial.print(sensorValue16);
  Serial.println();

  //cada 100 me envia el dato
  delay(100);
}

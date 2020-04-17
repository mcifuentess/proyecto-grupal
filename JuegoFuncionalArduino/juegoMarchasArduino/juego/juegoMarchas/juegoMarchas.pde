import processing.video.*;
Movie myMovie;

import processing.serial.*;
Serial port;

int retroceder;
//Avanzar es el boton 16
int boton1;
int boton2;
int boton3;
int boton4;
int boton5;
int boton6;
int boton7;
int boton8;
int boton9;
int boton10;
int boton11;
int boton12Avanzar;
int boton13pV;
int boton14pA;
int boton15pR;
int boton16pAm;
int estado=0;
boolean unaVez=false;
String sensores;

PImage uno;
PImage dos;
PImage tres;
PImage cuatro;
PImage cinco;
PImage seis;
PImage siete;
PImage ocho;
PImage nueve;
PImage diez;
PImage once;
PImage doce;
PImage trece;
PImage catorce;
PImage quince;
PImage dieciseis;
PImage diecisiete;
PImage dieciocho;
//Personas
PImage pVerde;
PImage pAzul;
PImage pAmarillo;
PImage pRojo;
//Posciciones personas

int posV=168;
int posA=244;
int posR=305;
int posAm=365;

float tiempoVid;



void setup()
{
  size(1920, 1080);
  uno = loadImage("uno.png");
  dos = loadImage("dos.jpg");
  tres = loadImage("tres.png");
  cuatro = loadImage ("cuatro.png");
  cinco = loadImage ("cinco.png");
  seis = loadImage ("seis.png");
  siete = loadImage ("siete.png");
  ocho = loadImage ("ocho.png");
  nueve = loadImage ("nueve.png");
  diez = loadImage ("diez.png");
  once = loadImage ("once.png");
  doce = loadImage ("doce.png");
  trece = loadImage ("trece.png");
  catorce = loadImage ("catorce.png");
  quince = loadImage ("quince.png");
  dieciseis = loadImage ("dieciseis.png");
  diecisiete = loadImage ("diecisiete.png");
  dieciocho = loadImage ("dieciocho.png");
  pVerde =loadImage("pVerde.png");
pAzul = loadImage("pAzul.png");
pRojo = loadImage ("pRojo.png");
pAmarillo = loadImage ("pAmarillo.png");



//port = new Serial(this, "/dev/cu.usbmodem14131", 9600); 
port = new Serial(this, Serial.list()[0], 9600);
  //------------VIDEO--------//
  myMovie = new Movie(this, "ProtestasVideo.mp4");
  myMovie.loop();
  myMovie.pause();



  tiempoVid=myMovie.duration();
  println(tiempoVid);
}

void draw()
{

  if (0 < port.available()) 
  {     
    //otra forma de enviar los datos a processing es no usando serial.write, sino serial.println, sin embargo en processing no se utiliza port.read(), sino port.readStringUntil('\n');
    sensores =  port.readStringUntil('\n');    

    if (sensores != null)
    {
      //println(sensores);
      //se crea un arreglo que divide los datos y los guarda dentro del arreglo, para dividir los datos se hace con split cuando le llegue el caracter 'T',
      String[] datosSensor = split(sensores, 'T');

      if (datosSensor.length == 16)
      {
            println(datosSensor[0]+ "  " + datosSensor[1]+ "  "
            + datosSensor[2]+" "+datosSensor[3] + " " + datosSensor[4]+ " " 
            + datosSensor[5] + " " +  datosSensor[6]+ " "+  datosSensor[7]+ " "
            +  datosSensor[8]+ " "+  datosSensor[9]+ " "+  datosSensor[10]+ " "
            +  datosSensor[11]+ " "+  datosSensor[12]+ " "+  datosSensor[13]+ 
            " "+  datosSensor[14]+ " "+  datosSensor[15]+ " ");
          
       boton1 = int(trim(datosSensor[0]));      
       boton2 = int(trim(datosSensor[1]));
       boton3 = int(trim(datosSensor[2]));
       boton4 =int(trim(datosSensor[3]));
       boton5 =int(trim(datosSensor[4]));
       boton6 = int(trim(datosSensor[5]));
       boton7 = int(trim(datosSensor[6]));
       boton8 = int(trim(datosSensor[7]));
       boton9 = int(trim(datosSensor[8]));
       boton10 = int(trim(datosSensor[9]));
       boton11 = int(trim(datosSensor[10]));
       boton12Avanzar = int(trim(datosSensor[11]));
       boton13pV = int(trim(datosSensor[12]));
       boton14pA = int(trim(datosSensor[13]));
       boton15pR = int(trim(datosSensor[14]));
       boton16pAm = int(trim(datosSensor[15]));

      }
    }
  }


//ESTADO 0-PANTALLA 1
  if (estado==0 )
  {
    inicio();

    if (unaVez == false)
    {
      if (boton12Avanzar==1)
      {
        estado = 1; 
        unaVez = true;
      }
    }
  }


//ESTADO 1-PANTALLA 2
  if (estado==1) 
  {
    jugadores();
    image(myMovie, 50, 161, 875, 455);
    myMovie.play();

    if (unaVez==true) 
    {
      if (boton12Avanzar == 0)
      {

        unaVez = false;
      }
    }
    println(myMovie.time());
    if (myMovie.time()>=12) {
      estado=2;
      myMovie.pause();
    }
  }



//ESTADO 2-PANTALLA 3
  if (estado==2 )
  {
    pantalla3();
    
    if (boton12Avanzar == 0)
      {

        unaVez = false;
      }

    if (unaVez == false)
    {
      if (boton12Avanzar==1)
      {
        
        estado = 3; 
        unaVez = true;
      }
    }
  }
  
  //ESTADO 3-PANTALLA 4
 if (estado==3 )
  {
    pantalla4();

if (boton12Avanzar == 0)
      {

        unaVez = false;
      }
      
    if (unaVez == false)
    {
      if (boton12Avanzar==1)
      {
        estado = 4; 
        unaVez = true;
      }
    }
  }
  //ESTADO 4-PANTALLA 5
  if (estado==4 )
  {
    pantalla5();
if (boton12Avanzar == 0)
      {

        unaVez = false;
      }
      
    if (unaVez == false)
    {
      if (boton12Avanzar==1)
      {
        estado = 5; 
        unaVez = true;
      }
    }
  }
  //ESTADO 5-PANTALLA 6
  
  if (estado==5 )
  {
    pantalla6();
    //Interaccion con tapete
    
      if(boton1==1){
    noFill();
  strokeWeight(25);
  stroke(#00FFE0);
  ellipse(897,372,106,106);
 
  }
   if(boton2==1){
    noFill();
  strokeWeight(25);
  stroke(#00FFE0);
 ellipse(1153,379,106,106);
 
  }
    if(boton4==1){
    noFill();
  strokeWeight(25);
  stroke(#00FFE0);
ellipse(1406,537,106,106);
  }
   if(boton9==1){
    noFill();
  strokeWeight(25);
  stroke(#00FFE0);
ellipse(1420,774,106,106);
 
  }
    if(boton7==1){
    noFill();
  strokeWeight(25);
  stroke(#00FFE0);
 ellipse(899,746,106,106);
 
  }
  // acaba interacción tapete
if (boton12Avanzar == 0)
      {

        unaVez = false;
      }
    if (unaVez == false)
    {
      if (boton1==1  && boton2==1 && boton4==1 && boton9==1 && boton7==1)
      {
        estado = 6; 
        unaVez = true;
      }
    }
  }
 //ESTADO 6-PANTALLA 7 
  if (estado==6 )
  {
    pantalla7();
 
 if (boton12Avanzar == 0)
    {
       unaVez = false;
    }  
if (unaVez == false)
    {
      if (boton12Avanzar==1)
      {
        estado =7; 
        unaVez = true;
      }
    }
  }
  //ESTADO 7-PANTALLA 8
  if (estado==7)
  {
    pantalla8();
    image(pVerde,posV,400); 
image(pAzul,posA,400); 
image(pRojo,posR,400); 
image(pAmarillo,posAm,400); 
 //CODIGO MARCHA
 if (boton13pV==1){

    posV= posV +10;
  image(pVerde,posV,400); 
  
 }
  
  
  if (boton14pA==1){
    
    posA= posA + 10;
  image(pVerde,posV,400); 
 
  }
   if (boton15pR==1){
  
    posR= posR + 10;
  image(pVerde,posV,400); 
 
  }
  
  
  
  }
   if (boton16pAm==1){
  
    posAm= posAm + 10;
  image(pVerde,posV,400); 

  }
  

  


//ACA FINALIZACODIGOMARCHA
 if (boton12Avanzar == 0)
    {
       unaVez = false;
    }  
if (unaVez == false)
    {
      if (posAm >= 1632 && posA >= 1632 && posR>= 1632 && posV>=1632)
      {
        estado =8; 
         posV=168;
         posA=244;
         posR=305;
         posAm=365;
        unaVez = true;
      }
    }
  //ESTADO 8-PANTALLA 9
   if (estado==8)
  {
    //CODIGO TAPETE
    pantalla9();
     if(boton1==1){
    noFill();
  strokeWeight(25);
  stroke(#00FFE0);
  ellipse(688,219,106,106);
 
  }
   if(boton8==1){
    noFill();
  strokeWeight(25);
  stroke(#00FFE0);
 ellipse(1027,507,106,106);
 
  }
    if(boton4==1){
    noFill();
  strokeWeight(25);
  stroke(#00FFE0);
ellipse(1424,309,106,106);
  }
   if(boton10==1){
    noFill();
  strokeWeight(25);
  stroke(#00FFE0);
ellipse(1441,739,106,106);
 
  }
    if(boton12Avanzar==1){
    noFill();
  strokeWeight(25);
  stroke(#00FFE0);
 ellipse(699,743,106,106);
 
  }
  //Aca termina codigo tapete
 
 if (boton12Avanzar == 0)
    {
       unaVez = false;
    }  
if (unaVez == false)
    {
      if (boton1==1  && boton8==1 && boton4==1 && boton10==1 && boton12Avanzar==1)
      {
        estado =9; 
        unaVez = true;
      }
    }
  }
 //ESTADO0 9-PANTALLA diez 
  if (estado==9)
  {
    pantalla10();
         
 
 if (boton12Avanzar == 0)
    {
       unaVez = false;
    }  
if (unaVez == false)
    {
      if (boton12Avanzar==1)
      {
        estado =10; 
        unaVez = true;
      }
    }
  }
  //ESTADO 10-PANTALLA 11
  if (estado==10)
  {
    pantalla11();
     image(pVerde,posV,400); 
image(pAzul,posA,400); 
image(pRojo,posR,400); 
image(pAmarillo,posAm,400); 
    if (boton13pV==1){

    posV= posV +10;
  image(pVerde,posV,400); 
  
 }
  
  
  if (boton14pA==1){
    
    posA= posA + 10;
  image(pVerde,posV,400); 
 
  }
   if (boton15pR==1){
  
    posR= posR + 10;
  image(pVerde,posV,400); 
 
  }
  
  
  
  }
   if (boton16pAm==1){
  
    posAm= posAm + 10;
  image(pVerde,posV,400); 

  }
  

  


//ACA FINALIZACODIGOMARCHA
 if (boton12Avanzar == 0)
    {
       unaVez = false;
    }  
if (unaVez == false)
    {
      if (posAm >= 1632 && posA >= 1632 && posR>= 1632 && posV>=1632)
      {
        estado =11; 
         posV=168;
         posA=244;
         posR=305;
         posAm=365;
        unaVez = true;
      }
  }
  
  
  //ESTADO 11-PANTALLA 12
  if (estado==11)
  {
    pantalla12();
 //CODIGO TAPETE
 if(boton1==1){
    noFill();
  strokeWeight(18);
  stroke(#00FFE0);
  ellipse(615,513,75,75);
 
  }
   if(boton5==1){
    noFill();
  strokeWeight(18);
  stroke(#00FFE0);
 ellipse(872,610,75,75);
 
  }
    if(boton4==1){
    noFill();
 strokeWeight(18);
  stroke(#00FFE0);
ellipse(999,607,75,75);
  }
   if(boton9==1){
    noFill();
  strokeWeight(18);
  stroke(#00FFE0);
ellipse(999,704,75,75);
 
  }
    if(boton8==1){
    noFill();
 strokeWeight(18);
  stroke(#00FFE0);
 ellipse(868,710,75,75);
 
  }
     if(boton12Avanzar==1){
    noFill();
 strokeWeight(18);
  stroke(#00FFE0);
 ellipse(614,791,75,75);
 
  }
     if(boton7==1){
    noFill();
 strokeWeight(18);
  stroke(#00FFE0);
 ellipse(614,702,75,75);
 
  }
     if(boton6==1){
    noFill();
 strokeWeight(18);
  stroke(#00FFE0);
 ellipse(615,607,75,75);
 
  }
  //Aca termina codigo tapete
 
 if (boton12Avanzar == 0)
    {
       unaVez = false;
    }  
if (unaVez == false)
    {
      if (boton1==1  && boton5==1
      && boton4==1 && boton9==1 
      && boton9==8 && boton12Avanzar==1
      && boton7==1&& boton6==1)
      {
        estado =13; 
        unaVez = true;
      }
    }
  }
  
  //ESTADO 12-PANTALLA 13
   
  if (estado==12)
  {
    pantalla13();
 if (boton12Avanzar == 0)
    {
       unaVez = false;
    }  
if (unaVez == false)
    {
      if (boton12Avanzar==1)
      {
        estado =13; 
        unaVez = true;
      }
    }
 
  }
  
  //ESTADO 13-PANTALLA 14
  
  if (estado==13)
  {
    pantalla14();
   image(pVerde,posV,400); 
image(pAzul,posA,400); 
image(pRojo,posR,400); 
image(pAmarillo,posAm,400); 
 
 //CODIGO MARCHA
 if (boton13pV==1){

    posV= posV +10;
  image(pVerde,posV,400); 
  
 }
  
  
  if (boton14pA==1){
    
    posA= posA + 10;
  image(pVerde,posV,400); 
 
  }
   if (boton15pR==1){
  
    posR= posR + 10;
  image(pVerde,posV,400); 
 
  }
  
  
  
  }
   if (boton16pAm==1){
  
    posAm= posAm + 10;
  image(pVerde,posV,400); 

  }
  

  


//ACA FINALIZACODIGOMARCHA
 if (boton12Avanzar == 0)
    {
       unaVez = false;
    }  
if (unaVez == false)
    {
      if (posAm >= 1632 && posA >= 1632 && posR>= 1632 && posV>=1632)
      {
        estado =13; 
         posV=168;
         posA=244;
         posR=305;
         posAm=365;
        unaVez = true;
      }
  }
 //ESTADO 14-PANTALLA 15
  if (estado==14)
  {
    pantalla15();
    
if (boton12Avanzar == 0)
    {
       unaVez = false;
    }  
if (unaVez == false)
    {
      if (boton12Avanzar==1)
      {
        estado =15; 
        unaVez = true;
      }
    }
  }
  //ESTADO 15-PANTALLA 16 
  if (estado==15)
  {
    pantalla16();
 
 if (boton12Avanzar == 0)
    {
       unaVez = false;
    }  
if (unaVez == false)
    {
      if (boton12Avanzar==1)
      {
        estado =16; 
        unaVez = true;
      }
    }
  }
   //ESTADO 16-PANTALLA 17
  if (estado==16)
  {
    pantalla17();
 
 if (boton12Avanzar == 0)
    {
       unaVez = false;
    }  
if (unaVez == false)
    {
      if (boton12Avanzar==1)
      {
        estado = 17; 
        unaVez = true;
      }
    }
  }
  
 //ESTADO 17-PANTALLA 0  
   if (estado==17)
  {
estado=0;
  }
 //Pantalla de perder 
  //ESTADO 18-PANTALLA INICIO (PANTALLA DE PERDER)
  if (estado==18)
  {
   pantalla18();;
   if (boton12Avanzar == 0)
    {
       unaVez = false;
    }  
if (unaVez == false)
    {
      if (boton12Avanzar==1)
      {
        estado = 0; 
        unaVez = true;
      }
  }
}
}

void inicio() {
  background(uno);
}

void jugadores() {
  background(dos);
}

void pantalla3() {
  background(tres);
}
void movieEvent(Movie m) {
  m.read();
}

void pantalla4() {
  background(cuatro);
}

void pantalla5() {
  background(cinco);
}

void pantalla6() {
  background(seis);
}

void pantalla7() {
  background(siete);
}

void pantalla8() {
  background(ocho);
}

void pantalla9() {
  background(nueve);
}

void pantalla10() {
  background(diez);
}

void pantalla11() {
  background(once);
}

void pantalla12() {
  background(doce);
}

void pantalla13() {
  background(trece);
}

void pantalla14() {
  background(catorce);
}

void pantalla15() {
  background(quince);
}

void pantalla16() {
  background(dieciseis);
}

void pantalla17() {
  background(diecisiete);
}

void pantalla18() {
  background(dieciocho);
}

//TP2
//Agustina Nahir Navarro
//Comision 1
//DNI 42833125
PImage imagen1, imagen2, imagen3;
int pantalla, tiempo, suma, diametro, py;
boolean ultimaPantalla;
color colorDelBoton;
PFont fuente;

void setup() {
  size(640, 480);
  py = height;
  fuente = loadFont("arial.vlw");
   textFont(fuente, 30);
  imagen1 = loadImage ("imagen1.png");
  imagen2 = loadImage ("imagen2.png");
  imagen3 = loadImage ("imagen3.png");
  textSize(40);
  tiempo = frameCount;
  pantalla = 0;
  suma = 1; // este hace que se mueva la pantalla
  diametro = 50;
  ultimaPantalla = false;//va mas rapido
  colorDelBoton = color(255 , 24 , 17);  
}

void draw() {
  println(tiempo);
  println(pantalla);
  println(suma);
  println(ultimaPantalla);
  println(frameCount);
  
  if (pantalla == 0) {
 image (imagen1, 0, 0, width, height);
    fill (255);
    textSize(30);
    textAlign(CENTER);
    text("Relatos salvajes es una pelicula argentina\n de suspenso y comedia oscura", 100, py, 440, 300);
    
    if (py>-5);
  {
    py --;
    
  }
  } else if (pantalla == 1) {
    image ( imagen2, 0, 0, width, height);
    textSize(30);
    textAlign(CENTER);
    fill ( 240,15,15);
    text("Director y guionista: Damian Szifron", 100, py, 440, 300);
   if (py>= 0 && py == height);{
    py --;
  }
  } else if (pantalla == 2) {
   image(imagen3, 0, 0, width, height);
   textSize(30);
   textAlign(CENTER);
   fill (0);
    text("Reparto:\n Ricardo Darin \n Erica Rivas\n Leonardo Sbaraglia\n Rita Cortese \n Oscar Martinez", 100, py, 440, 300);
     if (py>-5);
  {
    py ++;
  }
      fill(colorDelBoton);
      circle(583, 162, diametro);
      textSize(18);
      fill(0);
      text("REINICIAR", 560, 162);    
    if (pantalla == 3) {
    image(imagen3, 0, 0, width, height); 
     if (py>-5);
    }
  } 

  // tiempo += suma;
  if (ultimaPantalla == false) {
    frameCount /= suma;
  if (frameCount >= 250&& pantalla != 3) {
    frameCount = 0;
    if (pantalla != 2) {
      pantalla++;
    } else if (pantalla == 2) {
      ultimaPantalla = true;
    } 
   }
  }
}
  
void mouseClicked() {
  push ();
  pantalla++;
  if (ultimaPantalla == true) {
    if (dist( 583 , 162 , mouseX, mouseY) < diametro/2) {
      pantalla = 0;
      py = height;
      frameCount = 0;
      suma = 1;
      ultimaPantalla = false;
      pop ();
    }
  }
}
  //CONDICION PARA BOTÓN CIRCULAR
void mouseMoved() {
  if (ultimaPantalla == true) {
    if (dist(583 , 162 , mouseX, mouseY) < diametro/2) {
     
      colorDelBoton = color(225, 25, 19);
    }   else {
       push ();  
      colorDelBoton = color(25, 25, 19);
        textSize ( 18);
        fill ( 225 , 0 ,0 );
         text("REINICIAR", 560, 162); 
         pop ();
         
    }   
  }
}

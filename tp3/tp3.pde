//comision 1 tp3
//Agustina Nahir Navarro 
//Legajo: 119099/1
//https://youtu.be/gZZ-hnhxuGE
PImage imagen;
boolean zoomEnProgreso = false;
float factorEscala = 1.0;
float velocidadZoom = 0.005; // reducir la velocidad del zoom para hacerlo mas lento
boolean zoomAdentro = true; // indica si esta haciendo zoom in
float escalaMaxima = 2.5; // escala maxima para el efecto de tunel
float escalaMinima = 1.0; // escala mínima para el efecto de tunel

void setup() {
  size(800, 400); // establece el tamaño de la ventana
  imagen = loadImage("imagen.jpeg"); // carga la imagen
}

void draw() {
  background(255); // color de fondo 
  image(imagen, 0, 0, 400, 400); // dibuja la imagen en la mitad izquierda
  // dibuja el cuadrado de fondo
  dibujarcuadrado(400, 0, 400, 400);

  // dibuja el efecto de tunel en movimiento
  dibujarefectotunel(400, 0, 400, 400);
}

void dibujarcuadrado(float x, float y, float ancho, float alto) {
  pushMatrix();
  translate(x + ancho / 2, y + alto / 2); // mueve el origen al centro de la mitad derecha
  int pasos = 50; // numero de pasos para hacer el marco mas detallado
  for (int i = 0; i < pasos; i++) { //bucle de repeticiones
    float tamaño = map(i, 0, pasos, ancho, 0); // calcula el tamaño de cada rectangulo
    float alpha = map(i, 0, pasos, 255, 0); // calcula la transparencia de cada rectangulo
    if (i % 2 == 0) {
      fill(0, alpha); // alterna entre negro
    } else {
      fill(255, alpha); // y blanco
    }

    rectMode(CENTER);
    rect(0, 0, tamaño, tamaño); // dibuja el rectangulo
  }

  popMatrix();
}

void dibujarefectotunel(float x, float y, float ancho, float alto) {
  pushMatrix();
  translate(x + ancho / 2, y + alto / 2); // mueve el origen al centro de la mitad derecha
  scale(factorEscala); // aplica la escala de zoom

  int pasos = 50; // numero de pasos para hacer el tunel mas detallado
  for (int i = 0; i < pasos; i++) {
    float tamaño = map(i, 0, pasos, ancho, 0) * 0.9; // calcula el tamaño de cada rectangulo
    float alpha = map(i, 0, pasos, 255, 0); // calcula la transparencia de cada rectangulo
    if (i % 2 == 0) {
      if (mouseX > 400 && mouseX < 800 && mouseY > 0 && mouseY < 400) {
        fill(255, 0, 0, alpha); // cambia a rojo si el mouse esta en la mitad derecha
      } else {
        fill(0, alpha); // negro si el mouse no esta en la mitad derecha
      }
    } else {
      fill(255, alpha); // blanco para los otros rectangulos
    }

    rectMode(CENTER);
    if (tamaño * factorEscala <= ancho) { // asegura que los rectangulos no excedan los limites
      rect(0, 0, tamaño, tamaño); // dibuja el rectangulo
    }
  }

  popMatrix();
  
  if (zoomEnProgreso) { // si el zoom esta en progreso
    if (zoomAdentro) { // si estamos haciendo zoom in
      factorEscala += velocidadZoom; // incrementa el factor de escala
      if (factorEscala >= escalaMaxima) { // limite de zoom in
        zoomAdentro = false; // cambia a zoom out
      }
    } else { // si estamos haciendo zoom out
      factorEscala -= velocidadZoom; // decrementa el factor de escala
      if (factorEscala <= escalaMinima) { // limite de zoom out
        zoomAdentro = true; // cambia a zoom in
      }
    }
  }
}

void mousePressed() {
  if (!zoomEnProgreso) { // si el zoom no esta en progreso
    zoomEnProgreso = true; // inicia el zoom
    loop(); // inicia el bucle draw
  }
}

void keyPressed() {
  if (key == ' ') { // si se presiona la barra espaciadora
    resetearVariables(); // resetea las variables
    redraw();
    noLoop(); // detiene el bucle draw
  }
}

void resetearVariables() {
  factorEscala = 1.0; // reinicia el factor de escala
  zoomAdentro = true; // reinicia el estado de zoom
  zoomEnProgreso = false; // detiene el zoom
}

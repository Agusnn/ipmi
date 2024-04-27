PImage pollito;
void setup () {
size (800, 400);
pollito= loadImage ("pollito.jpg");
}
void draw (){ 
  background (125, 141, 106);
  image(pollito, 0, 0, 400, 400);
  fill(245, 242,131 ); // COLOR CABEZA
  ellipse(630, 120, 150, 130); // CABEZA
  ellipse(560, 250, 290, 150); // CUERPO
  fill(242, 211, 220);
  triangle(760, 160, 670, 145, 675, 120);//pico 
  triangle(760, 180, 670, 145, 670, 170);//pico
  fill(249, 246, 202);
  triangle(760, 360, 670, 330, 730, 370);//patas
  triangle(670, 330, 670, 360, 730, 370);
  fill(0, 0, 0);
  ellipse(640, 110, 30,15);//ojo
  line(400, 220, 800, 220);
  fill( 252,187,55);
  quad(660, 300,665, 300, 620, 310, 675, 335);
  }

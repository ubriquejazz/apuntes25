void setup() {
  size(500, 250);   // Set canvas 
  background(255);  // Set background color (white)
  noStroke();       // No outline for the circle
}

void draw() {
  noFill(); // no relleno blanco
  
  drawHouse(); // offset = 50
  drawTriangle(); // offset = 100
  drawQuad(); // offset = 230
  drawEllipses(); // offset = 350
}

void drawHouse() {
  // caja
  line(50, 50, 90, 50);
  line(50, 50, 50, 80);
  line(90, 50, 90, 80);
  line(50, 80, 90, 80);
  
  // triangulo
  line(50, 50, 70, 40);
  line(90, 50, 70, 40);
  
  // diagonales
  line(50, 50, 90, 80);
  line(50, 80, 90, 50);
}

void drawTriangle() {
  triangle(100, 80, 140, 30, 210, 80);
}

void drawQuad() {
  quad(230, 60, 250, 80, 250, 40, 270, 60);
}

void drawEllipses() {
  ellipse(350, 60, 80, 40);
  ellipse(350, 60, 40, 80);
}
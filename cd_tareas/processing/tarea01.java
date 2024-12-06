void setup() {
  size(400, 400);   // Set canvas size
  background(255);  // Set background color (white)
  noStroke();       // No outline for the circle
}

void draw_circle() {
  fill(100, 150, 255); // Set fill color (blueish)
  ellipse(width/2, height/2, 200, 200); // Draw circle at the center with a diameter of 200
}

void draw_square() {
  fill(255, 100, 150); // Set fill color (reddish)
  
  rectMode(CENTER); // Set the rectangle to be drawn from the center
  rect(width/2, height/2, 150, 150); // Draw square at the center with a side length of 150
}

void draw() {
  fill(100, 255, 150); // Set fill color (greenish)
  triangle(200, 100, 150, 300, 250, 300); // Draw a triangle
}
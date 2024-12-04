void setup() {
  size(400, 400);   // Set canvas size
  background(255);  // Set background color (white)
  noStroke();       // No outline for the circle
}

void draw() {
  draw_redish();
  draw_green();
}

void draw_redish() {
  fill(255, 100, 150); // Set fill color (reddish) 
  triangle(200, 300, 100, 100, 300, 100); // Draw upside-down triangle
}
  
void draw_green() {
  fill(100, 255, 150); // Set fill color (greenish)
  triangle(200, 100, 100, 300, 300, 300); // Draw a triangle
}
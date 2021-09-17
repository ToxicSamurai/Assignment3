//ToxicSamurai
//Licensed under Creative Commons CC-BY-NC-SA

PVector fillColor, fillSpeed;

void setup() {
  size(750, 750);
  fillColor = new PVector(20, 140, 255);
  fillSpeed = new PVector(2, 4, 3);
  noStroke();
}

void draw() {
  loadPixels();
  for (int i = 0; i < pixels.length; i++) {
    int x = i % width;
    int y = i / width;

    pixels[i] = color(x/3, 60, y/3);
  }

  updatePixels();

  colorChange();
  fill(fillColor.x, fillColor.y, fillColor.z);
  bezier(width/2-50, height/2-50, width/2, height/2, mouseX, mouseY, width/2+50, height/2+50);
}

void colorChange() {
  if ((fillColor.x<=0)||(fillColor.x>=255)) {
    fillSpeed.x *= -1;
  }
  if ((fillColor.y<=0)||(fillColor.y>=255)) {
    fillSpeed.y *= -1;
  }
  if ((fillColor.z<=0)||(fillColor.z>=255)) {
    fillSpeed.z *= -1;
  }
  
  fillColor.x += fillSpeed.x;
  fillColor.y += fillSpeed.y;
  fillColor.z += fillSpeed.z;
}

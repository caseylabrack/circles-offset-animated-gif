int totalFrames = 360/5;

int gridSize = 50;
int smallCircleExtent = 46;  
Circ[] circs;
float speed = 5;

class Circ {
  float angle, direction, speed;
  Circ () {
    angle = random(0,359);
    direction = random(0,1) > .5 ? 1 : -1;
    speed = 5;
  }
  void update () {
    angle += direction * speed;
  }
}

void setup () {
  size(400,400);
  smooth(8);
  circs = new Circ[width/gridSize * height/gridSize];
  for(int j = 0; j < circs.length; j++) circs[j] = new Circ();
  colorMode(HSB, 360, 100, 100);
}

void draw () {
  
  background(360);
  
  int count = 0;
  translate(gridSize/2, gridSize/2);
  for(int i = 0; i < width; i+=gridSize) {
    for(int j = 0; j < height; j+=gridSize) {
      noStroke();
      fill(0, 0, 0);
      circle(i, j, gridSize);
      fill(0, 0, 100);
      circs[count].update();
      float xPos = i + cos(radians(circs[count].angle)) * (gridSize/2 - smallCircleExtent/2);
      float yPos = j + sin(radians(circs[count].angle)) * (gridSize/2 - smallCircleExtent/2);
      circle(xPos, yPos, smallCircleExtent);
      count++;
    }
  }
  saveFrame("output/circles-######.png");
  if(frameCount==totalFrames) exit();
}

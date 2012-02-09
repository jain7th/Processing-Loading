int aStepSize = 40;
int cColdDiv = 5;
int maxLines = 80;

int d = 0;
float cAlph = 100;

int numLines = 0;

float angle;
int k = 0;

void setup() {
  size(800, 200);
  frameRate(10);

  smooth();
  strokeCap(ROUND);
}

void draw() {
  int minSize = floor((min(height, width))*0.35);
  float radius1 = -minSize;
  float radius2 = minSize;

  strokeWeight(minSize*0.3);

  background(30);

  int failureRate = round(random(1, 5));

  if (k == failureRate) {
    numLines = (int)(maxLines * 0.4);
    k = 0;
  }
  else if (numLines == maxLines) {
    k++;
    numLines = floor(maxLines * random(0.1, 0.5));
  }
  else {
    numLines++;
  }

  float angle=TWO_PI/(float)numLines;

  translate(width*0.5, height*0.5);
  //  scale(1.0, -1.0);


  for (int i=0;i<numLines;i++) {
    stroke(250, 250, 250, cAlph);

    line(radius1*sin(angle*i), radius1*cos(angle*i), radius2*sin(angle*i), radius2*cos(angle*i));

    if (d == 0) {
      if (cAlph <= 20) {
        cAlph = 10;
        d = 1;
      }
      else {
        cAlph -= aStepSize + cColdDiv;
      }
    }
    else {
      if (cAlph >= 240) {
        cAlph = 240 -(aStepSize * 1.4);
        d = 0;
      }
      else {
        cAlph += cColdDiv + (aStepSize * 1.2);
      }
    }
  }
}


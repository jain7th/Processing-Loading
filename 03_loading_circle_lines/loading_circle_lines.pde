int lStrokeWeight = 40;
int aStepSize = 40;
int cColdDiv = 5;

float radius1 = 100;
float radius2 = 180;
int numPoints=10;

int d = 0;
float cAlph = 100;


void setup() {  
  size((int)radius2*3, (int)radius2*3);
  background(30);
  frameRate(10);

  smooth();
  strokeWeight(lStrokeWeight);
  strokeCap(ROUND);
}

void draw() {
  background(30);

  float angle=TWO_PI/(float)numPoints;

  translate(radius2*1.5, radius2*1.5);
  scale(1.0, -1.0);


  for (int i=0;i<numPoints;i++) {
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


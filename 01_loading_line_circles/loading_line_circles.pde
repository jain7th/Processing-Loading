int cDis = 40;
int cSiz = 20;
int cNum = 10;
int aStepSize = 40;
int cColdDiv = 5;

int d = 0;
float cAlph = 100;
int cXPos;

void setup() {
  frameRate(20);
  
  int x = cSiz + cDis;
 
  int sizeX = 80 + (x * cNum);
  
  size(sizeX, 200);
  background(20);
  
  smooth();
  noStroke();
}

void draw() {
   background(30);
   
   for(int i = 0; i < cNum; i++) {
     fill(250, 250, 250, cAlph);
     
     if(i == 0) {
       cXPos = 40 + cSiz; 
     }
     else {
       cXPos += cSiz + cDis;
     } 
     
     ellipse(cXPos, 100, cSiz, cSiz);
     
     if (d == 0) {
       if(cAlph <= 20) {
         cAlph = 10;
         d = 1;
       }
       else {
         cAlph -= aStepSize + cColdDiv;
       }
     }
     else {
       if(cAlph >= 240) {
       cAlph = 240 - (aStepSize * 1.4);
       d = 0;
       }
       else {
         cAlph += cColdDiv + (aStepSize * 1.2);
       }
     }       
   }
}

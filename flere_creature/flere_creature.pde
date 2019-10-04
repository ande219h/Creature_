//arrays
float[] xVal;
float[] yVal;
float[] sizeVal;
float[] scale;
float[] dir;
//array længde/antal væsener
int n=40;

void setup() {
  size(500, 500);
  frameRate(30);
  //listerne tildeles længden n
  xVal=new float[n];
  yVal=new float[n];
  sizeVal=new float[n];
  scale=new float[n];
  dir=new float[n];
  //for loop der assigner indekset med en tilfældig værdi
  for (int i=0; i<n; i++) {
    xVal[i]=random(0, 500);
    yVal[i]=random(0, 500);
    sizeVal[i]=random(0.5, 3);
    scale[i]=random(0.99, 1.015);
    dir[i]=random(-1.5, 1.5);
  }
}
//funktion for figuren, med variablerne x,y,size
void figur(float x, float y, float size) {
  fill (255);
  circle(x+size*40, y+size*25, size+size*50);
  circle(x+size*40, y+size*(40+3*50/4), size+size*80);
  rectMode(CENTER);
  rect(x+size*40, y+size*(3*50/4), size+size*15, size+size*15);
  circle(x+size*30, y+size*(50/3), size+size*10);
  circle(x+size*50, y+(size*50/3), size+size*10);
}

void draw() {
  background(0);
  //for loop der tegner alle figurer og opdaterer deres størrelse
  for (int j=0; j<n; j++) {
    figur(xVal[j], yVal[j], sizeVal[j]);
    sizeVal[j]*=scale[j];
    xVal[j]+=dir[j];
    yVal[j]+=dir[j];
    //når figuren bliver større end 3 skal den blive mindre
    if (sizeVal[j]>3) {
      scale[j]=random(0.99, 0.999);
    }
    //når figuren bliver mindre end 0.5 skal den blive større
    if (sizeVal[j]<0.5) {
      scale[j]=random(1.001, 1.015);
    }
  }
  //når der trykkes på mussen ændres figurernes position og skærmen ryddes
  if (mousePressed) {
    clear();
    for (int i=0; i<n; i++) {
      xVal[i]=random(0, 500);
      yVal[i]=random(0, 500);
      sizeVal[i]=random(0.5, 3);
      scale[i]=random(0.99, 1.015);
      dir[i]=random(-1.5, 1.5);
    }
  }
}

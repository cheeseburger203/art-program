float cursorColorR = 0;
float cursorColorG = 0;
float cursorColorB = 0;

float dots = 0;

float redX = 50;
float redY = 100;

float greenY = 200;

float blueY = 300;

float blackY = 600;

float purpleY = 500;

float orangeY = 400;

float eraserX = 1200;
float eraserY = 50;

float cursorSizeX = 10;
float cursorSizeY = 10;

float size1X = 1200;
float size1Y = 120;
float size2Y = 200;
float size3Y = 300;
float size4Y = 400;
float size5Y = 500;

float mode1X = 1250;
float mode1Y = 600;
float mode2Y = 650;

float brightness1X = 1250;
float brightness1Y = 150;
float brightness2X = 1225;

boolean isNear = false;

String cursorMode = "pencil";

void setup(){
  size(1300, 700);
  background(255);
}

void draw(){
  fill(255, 0, 0);
  stroke(0);
  ellipse(redX, redY, 50, 50);
  fill(0, 255, 0);
  ellipse(redX, greenY, 50, 50);
  fill(0, 0, 255);
  ellipse(redX, blueY, 50, 50);
  fill(0);
  ellipse(redX, blackY, 50, 50);
  fill(200, 0, 200);
  ellipse(redX, purpleY, 50, 50);
  fill(255, 100, 10);
  ellipse(redX, orangeY, 50, 50);
  fill(255);
  stroke(0);
  ellipse(eraserX, eraserY, 50, 50);
  fill(0);
  ellipse(size1X, size1Y, 5, 5);
  ellipse(size1X, size2Y, 10, 10);
  ellipse(size1X, size3Y, 20, 20);
  ellipse(size1X, size4Y, 30, 30);
  ellipse(size1X, size5Y, 50, 50);
  fill(40);
  ellipse(mode1X, mode1Y, 25, 25);
  fill(0);
  ellipse(mode1X, mode2Y, 25, 25);
  ellipse(brightness1X, brightness1Y, 15, 15);
  fill(255);
  ellipse(brightness2X, brightness1Y, 15, 15);
  fill(cursorColorR, cursorColorG, cursorColorB);
  ellipse(100, 50, 35, 35);
   if(dist(mouseX, mouseY, brightness1X, brightness1Y) <= 15 || (dist(mouseX, mouseY, brightness2X, brightness1Y) <= 15)){
    isNear = true;
  } else if(dist(mouseX, mouseY, brightness1X, brightness1Y) > 15 || (dist(mouseX, mouseY, brightness2X, brightness1Y) > 15)){
    isNear = false;
  }
}

void mouseDragged(){
  fill(cursorColorR, cursorColorG, cursorColorB);
  noStroke();
  if(cursorMode == "spray paint"){
    while(dots <= cursorSizeX/2){
      ellipse(random(mouseX, mouseX+cursorSizeX), random(mouseY, mouseY+cursorSizeY), 1, 1);
      dots += 1;
    }
    if(dots >= cursorSizeX/2){
      dots = 0;
    }
  } else if(cursorMode == "pencil"){
    ellipse(mouseX, mouseY, cursorSizeX, cursorSizeY);
  }
}

void mouseClicked(){
  if(dist(mouseX, mouseY, redX, redY) <= 50){
    cursorColorR = 255;
    cursorColorG = 0;
    cursorColorB = 0;
  }
   if(dist(mouseX, mouseY, redX, greenY) <= 50){
    cursorColorR = 0;
    cursorColorG = 255;
    cursorColorB = 0;
  }
   if(dist(mouseX, mouseY, redX, blueY) <= 50){
    cursorColorR = 0;
    cursorColorG = 0;
    cursorColorB = 255;
  }
   if(dist(mouseX, mouseY, redX, blackY) <= 50){
    cursorColorR = 0;
    cursorColorG = 0;
    cursorColorB = 0;
  }
  if(dist(mouseX, mouseY, redX, purpleY) <= 50){
    cursorColorR = 200;
    cursorColorG = 0;
    cursorColorB = 200;
  }
  if(dist(mouseX, mouseY, redX, orangeY) <= 50){
    cursorColorR = 255;
    cursorColorG = 100;
    cursorColorB = 10;
  }
  if(dist(mouseX, mouseY, eraserX, eraserY) <= 50){
    cursorColorR = 255;
    cursorColorG = 255;
    cursorColorB = 255;
  }
  if(dist(mouseX, mouseY, size1X, size1Y) <= 5){
    cursorSizeX = 5;
    cursorSizeY = 5;
  }
  if(dist(mouseX, mouseY, size1X, size2Y) <= 10){
    cursorSizeX = 10;
    cursorSizeY = 10;
  }
  if(dist(mouseX, mouseY, size1X, size3Y) <= 20){
    cursorSizeX = 20;
    cursorSizeY = 20;
  }
  if(dist(mouseX, mouseY, size1X, size4Y) <= 30){
    cursorSizeX = 30;
    cursorSizeY = 30;
  }
  if(dist(mouseX, mouseY, size1X, size5Y) <= 50){
    cursorSizeX = 50;
    cursorSizeY = 50;
  }
  if(dist(mouseX, mouseY, brightness1X, brightness1Y) <= 15){
    cursorColorR -= 10;
    cursorColorG -= 10;
    cursorColorB -= 10;
  }
   if(dist(mouseX, mouseY, brightness2X, brightness1Y) <= 15){
    cursorColorR += 10;
    cursorColorG += 10;
    cursorColorB += 10;
  }
  if(dist(mouseX, mouseY, mode1X, mode1Y) <= 25){
    cursorMode = "spray paint";
  }
  if(dist(mouseX, mouseY, mode1X, mode2Y) <= 25){
    cursorMode = "pencil";
  }
  fill(cursorColorR, cursorColorG, cursorColorB);
  noStroke();
  if(cursorMode == "pencil" && isNear == false){
    ellipse(mouseX, mouseY, cursorSizeX, cursorSizeY);
  }
}

void keyPressed(){
  if(key == 'c' || key == 'C'){
    background(255);
  }
  if(key == 's' || key == 'S'){
    saveFrame("drawing-####.png");
  }
  if(key == 'p' || key == 'P'){
    cursorMode = "pencil";
  }
  if(key == 'l' || key == 'L'){
    cursorMode = "spray paint";
  }
}

int Shape1 = 50;
int Shape2 = 50;
int Shape3 = 50;

void setup()
{
  size(800,400);
}
void draw()
{
  background(255,255,255);
  stroke(0);
  strokeWeight(3);
  fill(255,255,0);
  ellipse(Shape1,100,50,50);
    Shape1=Shape1+3;
  fill(0,255,255);
  ellipse(Shape2,200,50,50);
    Shape2=Shape2+2;
  fill(255,0,255);
  ellipse(Shape3,300,50,50);
    Shape3=Shape3+1;
}

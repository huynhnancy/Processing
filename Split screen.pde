void setup()
{
  size(500,500);
  noStroke();
}

void draw()
{
  background(0,255,0);
  line(0,mouseY,500,mouseY);
  fill(0,0,255);
  rect(0,0,500,mouseY);
}

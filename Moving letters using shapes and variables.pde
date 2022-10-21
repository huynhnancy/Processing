int n=50;
int x=50;
int h=50;

void setup()
{
  size(500,500);
}

void draw()
{
  background(0,255,150);
  ///draw N
  fill(200,100,255);
  rect(n,50,20,100);
  quad(n+20,50,n,50,n+80,150,n+100,150);
  rect(n+80,50,20,100);
  n=n+3;
  ///draw X
  fill(120,100,255);
  quad(x,200,x+20,200,x+80,300,x+100,300);
  quad(x+80,200,x+100,200,x,300,x+20,300);
  x=x+2;
  ///draw H
  fill(200,100,50);
  rect(h,390,80,20);
  rect(h,350,20,100);
  rect(h+80,350,20,100);
  h=h+1;
}

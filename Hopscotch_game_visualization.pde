int size=100;
int arr[]=new int[size];
PVector arrpos[]=new PVector[size];
int start=1;
int move=0;

void setup()
{
  size(500,580);
  textSize(15);
  for(int i=0;i<arr.length;i++)
    arr[i]=(int)random(1,10);
    
  for(int x=0;x<10;x++)
  for(int y=0;y<10;y++)
    arrpos[y*10+x]=new PVector(x,y);
}

void draw()
{
  background(255);
  play(arr,start,arrpos);
  textSize(30);
  fill(0);
  text("Move: "+move,200,550);
  noLoop();
}

void play(int a[],int b,PVector c[])
{
  for(int i=0;i<a.length;i++)
  {
    //draw array
    noFill();
    rect(c[i].x*50,c[i].y*50,50,50);
    fill(0);
    text(a[i],c[i].x*50+5,c[i].y*50+15);
    
    if(i==b)
    {
      //change color of first and last points
      if(move==0)
        fill(255,255,0);
      if(b+a[b]>=a.length)
        fill(255,255,0);
        
      //draw ellipse at each step
      ellipse(c[i].x*50+25,c[i].y*50+30,12,12);
      
      //make a move
      b=b+a[b];
      move=move+1;
      
      //draw a line from each position to its successor position
      if(b<a.length)
      line(c[i].x*50+25,c[i].y*50+30,c[b].x*50+25,c[b].y*50+30);
    }
  }
}

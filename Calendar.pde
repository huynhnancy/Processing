int a=13;
String w[]={"S","M","T","W","T","F","S"};

void setup()
{
  size(500,500);
}

void draw()
{
  background(0);
  for(int i=0;i<w.length;i++)  //title
  {
    textSize(25);
    fill(255,255,0);
    text(w[i],i*50+100,50);
  }
  textSize(50);
  text("NOVEMBER",20,480);
  calendar(a);
}

void calendar(int x)
{
  textSize(25);
  fill(255);
  while(x>=7)  //if number 7+, minus 7 days until it <7
    x=x-7;
  
  while(x<0)  //if number <0, plus 7 days until it >=0
    x=x+7;
    
  if(x>=0 && x<7)  //days past Sunday must be >=0 and <7
  {
    int nov[]=new int[30+x];
    for(int n=0;n<nov.length;n++)  //initial for November calendar
    {
      nov[n]=n+1;
    }
    
    for(int i=0;i<7;i++)          //7 days a week
    for(int j=0;j<6;j++){         //at most 6 weeks a month
      if(j==0 &&(i+x)<7)
        text(nov[(j*7+i)],(i+x)*50+100,j*50+100);  //first row (week)
      if((j*7+i)<nov.length && j>0)
        text(nov[(j*7+(i-x))],i*50+100,j*50+100);  //remaining rows (weeks)
      
      noFill();
      stroke(255);
      rect(i*50+85,j*50+65,50,50);  //draw grid
    }//end for loop
  }//end if 
}

Ant []a;
PImage img;
String url="https://i.pinimg.com/originals/ac/84/b3/ac84b31c7ada69e7b797789db0278bd0.png";

void setup()
{
  size(500,500);
  noStroke();
  img=loadImage(url,"png");
  loadPixels();
  
  a=new Ant[100];
  for(int i=0;i<a.length;i++)
    a[i]=new Ant(new PVector((int)random(width),(int)random(height)));
}

void draw()
{
  for(int i=0;i<a.length;i++){
    a[i].drawme();
    a[i].direction();
    a[i].change();
  }
}

class Ant
{
  PVector pos;
  float speed;
  int rand;
  int counter;
  int interval;
  
  Ant(PVector p)
  {
    pos=p;
    speed=1;
    counter=0;
    interval=0;
  }
  
  void drawme()
  {
    fill(img.pixels[(int)pos.y*width+(int)pos.x]);  //change color depends on the pixel it lands on
    ellipse(pos.x,pos.y,10,10);
  }
  
  void direction()
  {
    if(counter==0){
      rand=(int)random(4);            //random direction
      interval=(int)random(10,60);    //random certain frames to go straight
    }
    if(rand==0 && pos.x<width-1)         //move left
      pos.x+=speed;
    else if(rand==1 && pos.x>0)          //move right
      pos.x-=speed;
    else if(rand==2 && pos.y<height-1)   //move down
      pos.y+=speed;
    else if(rand==3 && pos.y>0)          //move up
      pos.y-=speed;
    counter++;
    
   if(counter>interval)  //go straight for certain frames, then change direction
     counter=0;
  }
  
  void change()  //change direction when reach edges of the screen, so they do not leave the screen
  {
    if(pos.x>=width-1||pos.x<=0)
       rand=(int)random(4);   
    if(pos.y>=height-1||pos.y<=0)
       rand=(int)random(4);   
  }
}

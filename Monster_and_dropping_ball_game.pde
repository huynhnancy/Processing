//You need to control the monster by key to not hit the snow ball dropping
//Click the mouse to start game or to restart game
//You only have 3 times (Hearts) to restart
//Score will reset but total score will continue to add up
//The total score will be reported after you run out of hearts

float faceX=100;
float faceY=800;
float facesize=120;
int board=150;       //width of board score
int numsball=20;
int totalscore=0;
int score=0;
int count=0;
int heart=3;
boolean end=false;

Eye[]e=new Eye[3];
Mouth[]m=new Mouth[1];
Ball[]b=new Ball[numsball];

void setup()
{
  size(1200,900);
  textSize(30);
  
  for(int i=0;i<e.length;i++)
    e[i]=new Eye(faceX-facesize/4+i*32,faceY-facesize/4,30);
    
  m[0]=new Mouth(faceX-facesize/4,faceY+facesize/8,facesize/2,facesize/4);
  
  for(int i=0;i<b.length;i++)
    b[i]=new Ball(random(width-board-facesize/2),0);
}

void draw()
{
  smooth();
  background(0);
  stroke(0);
  
  if(heart==0)                  //report total scores when run out of hearts
    text("Total Score: "+totalscore,width/2, height/2);
    
  if(end==false && heart>0){    //start game and still have heart to play
    
  //Draw Face
  fill(255,255,0);
  ellipse(faceX,faceY,facesize,facesize);
  
  //Draw Nose
  fill(0,0,255);
  circle(faceX,faceY,facesize/10);
  
  //Draw Eye
  for(int i=0;i<e.length;i++)
    e[i].drawme();
    
  //Draw Mouth
  m[0].drawme();
  
  //Draw snow balls
  for(int i=0;i<b.length;i++){
    b[i].drawme();
    b[i].reappear();
    b[i].move();
  }
  
  //Start game
  play();
  score();
  
  //End game
  for(int i=0;i<b.length;i++){
    if(dist(b[i].pos.x,b[i].pos.y,faceX,faceY)<=75){    //if touch the ball, end game
      end=true;
      endgame();
    }}}
  
  if(end==true) //Stop drawing when game ends
    noLoop();
  else loop();  //When mouse clicked, restart the game
}

void play()
{
  //Control the monster move left or right by key, not moving out of screen
  if(keyPressed==true & key==CODED){
    if(keyCode==LEFT && faceX>=(facesize/2+10)){
      faceX-=10;
      for (int i = 0; i < e.length; i++)
        e[i].pos.x -= 10;
      m[0].posx-=10;
    }
    if(keyCode==RIGHT && faceX<=(width-facesize/2-160))
    {
      faceX+=10;
      for (int i = 0; i < e.length; i++)
        e[i].pos.x += 10;
      m[0].posx+=10;
    }}}

void score()
{
  translate(width-board,0);
  stroke(255);
  line(0,0,0,height);
  textAlign(CENTER);
  text("Hearts",board/2,50);
  
  //Draw heart
  float x=board/2;
  float y=100;
  float s=20;
  for(int i=0;i<heart;i++){
    fill(255,0,0);
    noStroke();
    rect(x-s/2, y-s/2+(i*3*s), s, s);
    circle(x, y-s/2+(i*3*s), s);
    circle(x-s/2, y+(i*3*s), s);
  }
  
  //Calculate score
  fill(255);
  text("SCORE",board/2,800);
  if(mousePressed==true)
    count=1;
  score+=count;
  text(score,board/2,850);
}

void endgame()                    //End game
{
    fill(0,255,0);
    stroke(0,255,0);
    text("Win",board/2,730);
    noFill();
    circle(board/2,815,125);
}

void mouseClicked()              //Restart the game
{
  if(end==true){
    
    //Reset animation to beginning position
    faceX=100;                  
    faceY=800;
    totalscore+=score;
    score=0;

    for(int i=0;i<e.length;i++)
      e[i].pos.x=faceX-facesize/4+i*32;
      
    m[0].posx=faceX-facesize/4;
    
    for(int i=0;i<b.length;i++){
      b[i].pos.x=random(width-board-facesize/2);
      b[i].pos.y=0;
    }
    
    heart--;
    end=false;
    redraw();
  }
}

class Eye
{
  PVector pos;
  float size;
  int count=0;
  
  Eye(float x, float y, float s)
  {
    pos=new PVector(x,y);
    size=s;
  }
  
  void drawme()
  {
    fill(255);
    circle(pos.x,pos.y,size);
    fill(0);
    
    //Eyes watch the mouse pointer
    float r=size/4;
    float d=dist(pos.x,pos.y,mouseX,mouseY);
    if(r > d)
      r = d;
    float theta=atan2(mouseY-pos.y,mouseX-pos.x);
    float offx=r*cos(theta);
    float offy=r*sin(theta);
    circle(pos.x+offx,pos.y+offy,size/2);
    count++;
    
    //Eyes blink every 60 frames
    if(count>=50){
        fill(200,180,0);
        circle(pos.x,pos.y,size);
        if(count>=70)
          count=0;}
  }
}

class Mouth
{
  float posx;
  float posy;
  float w;
  float h;
  int wt=10;
  int ht=8;
  
  Mouth(float x,float y, float wi, float he)
  {
    posx=x;
    posy=y;
    w=wi;
    h=he;
  }
  
  void drawme()
  {
    noStroke();
    if(keyPressed==false){
      fill(0);              //Draw mouth
      rect(posx,posy,w,h);
      fill(255,0,0);        //Draw lips
      rect(posx,posy+5,w,h-10);
      
      //Draw teeth
      for(int i=0;i<w/wt;i++){
         fill(255);
         triangle(posx+(i*wt), posy+5,posx+wt+(i*wt), posy+5,posx+wt/2+(i*wt), posy+5+ht);
         triangle(posx+(i*wt), posy+h-5,posx+wt+(i*wt), posy+h-5,posx+wt/2+(i*wt), posy+h-5-ht);
      }   
    }
    
    //Mouth close when moving
    else if(keyPressed==true){
      fill(0);
      rect(posx,posy+10,w,h-20);
    }
  }
}

class Ball
{
  PVector pos;
  int speed=0;
  int board=150;
  float size=30;
  
  Ball(float x, float y)
  {
    pos=new PVector(x,y);
  }
  
  void drawme()
  {
    fill(255);
    ellipse(pos.x,pos.y,size,size);
    pos.y+=speed;
  }
  
  void move()
  {
    if(mousePressed==true)
      speed=(int)random(2,7);
  }
  
  void reappear()
  {
    if(pos.y>=height){
      pos.x=random(width-board-size/2);
      pos.y=0;
    }
  }
}

int nov[]=new int[30];
String w[]={"S","M","T","W","T","F","S"};
PVector click[];
int max[]=new int[30];
int num[]=new int[30];
int booked=0;

void setup()
{
  size(500,500);
  textAlign(CENTER);
  for(int n=0;n<nov.length;n++){
      nov[n]=n+1;
      max[n]=3;
      num[n]=0;
  }
  click=new PVector[90];
}

void draw()
{
  background(0);
  calendar();
  appointment();
}

void calendar()
{
  textSize(50);
  text("NOVEMBER",250,height-20);
  textSize(25);
  for(int i=0;i<w.length;i++){        //title
    text(w[i],i*70+35,50);
  }
  for(int i=0;i<7;i++)          
  for(int j=0;j<5;j++){
    int a=j*7+i;
    if(a<nov.length)
      text(nov[a],i*70+55,j*70+90);   //day 
      noFill();
      stroke(255);
      rect(i*70+5,j*70+65,70,70);     //grid
  }//end for loop
}

void appointment()
{
  for(int c=0;c<booked;c++)          // draw ellipse as appointment booked
  ellipse(click[c].x,click[c].y,10,10);
}

void mousePressed()
{
  for(int i=0;i<7;i++)          
  for(int j=0;j<5;j++){
    int a=j*7+i;
    if(mouseX<(i*70+75) && mouseX>(i*70+5) && mouseY>(j*70+65) && mouseY<(j*70+135) && a<nov.length){      //check if mouse click inside the square
    if(num[a]<max[a]){                                                                                     //check if the square have space or not
      click[booked]=new PVector(i*70+15+num[a]*15,j*70+120);                                               //if yes, booked appointment
      booked++; 
      num[a]++; 
    }
    }  
  }
}

void keyPressed()
{
  if(key=='c'){                     //clear all appointments
    booked=0;
    for(int n=0;n<nov.length;n++){
      num[n]=0;
    }
  }
}

int arr[][]=new int[8][8];
int score[]={0,0,0,0,1,1,1,1,2,2,2,2,3,3,3,3,4,4,4,4,5,5,5,5,6,6,6,6,7,7,7,7,8,8,8,8,9,9,9,9,10,10,10,10,11,11,11,11,12,12,12,12,13,13,13,13,14,14,14,14,15,15,15,15};         
IntList scoreIndex= new IntList();
int a=-1;
int playScore1=0;
int playScore2=0;
Dart[]d=new Dart[12];

void setup()
{
  size(400,500);
  question3();                //create scores randomly
  question4();                //assign scores to box
  noLoop();
}

void draw()
{
  background(0);  
  for(int i=0;i<d.length;i++)   //throw 12 darts
  {
    d[i]=new Dart();
  }
  board();
  for(int i=0;i<d.length;i++)
  {
    d[i].player1();
    d[i].player2();      
  }
 result();               
}

void question3()
{
  for(int i=0;i<score.length;i++){
   scoreIndex.append(i);
  }
  scoreIndex.shuffle();
}

void question4()
{
  for(int i=0;i<8;i++)
    for(int j=0;j<8;j++){
      a=a+1;
      arr[i][j]=score[scoreIndex.get(a)];
}}

void board()          //draw dartboard
{
  textSize(15);
  for(int i=0;i<8;i++)
    for(int j=0;j<8;j++)
    {
      fill(255);
      rect(i*50,j*50,50,50);
      fill(0);
      text(arr[i][j],i*50+25,j*50+15);
    }}

void mouseClicked()    //question 5 reset when mouseClicked
{
  playScore1=0;
  playScore2=0;
  redraw();
}

class Dart{
  
  float x1 =random(width);
  float y1 =random(height-100);
  float x2 =random(width);
  float y2 =random(height-100);
  
  void player1()              //First player
  {
    if(playScore1<100)        //stop drawing when exceed 100 scores
    { 
      fill(255,255,0);
      ellipse(x1,y1,20,20);   //throw dart randomly

    for(int i=0;i<8;i++)      //calculate score
    for(int j=0;j<8;j++){
      if(x1<(i*50+50) && y1<(j*50+50) && x1>(i*50) && y1>(j*50)){
        playScore1=playScore1+arr[i][j];
      }}}}
      
  void player2()              //Second player
  {
    if(playScore2<100)        //stop drawing when exceed 100 scores
    {
      fill(0,255,0);
      ellipse(x2,y2,20,20);   //throw dart randomly

      for(int i=0;i<8;i++)    //calculate score
      for(int j=0;j<8;j++){
        if(x2<(i*50+50) && y2<(j*50+50) && x2>(i*50) && y2>(j*50)){
          playScore2=playScore2+arr[i][j];
      }}}}}

void result()                //show result of 2 players
{
  textSize(25);
  fill(255,255,0);
  text("Player 1",10,430);    //Name first player
  fill(0,255,0);
  text("Player 2",300,430);   //Name second player
  fill(255);
  text(playScore1,10,460);    //Score first player
  text(playScore2,300,460);   //Score second player
  
  //who score exceed 100 will lose, if score<100 who get better score will win
  if((playScore1>playScore2 && playScore1<100)||(playScore2>=100 && playScore1<100)){ 
    text("Win",10,490);}
  else if ((playScore1<playScore2 && playScore2<100)||(playScore1>=100 && playScore2<100))
    text("Win",300,490);
  else if ((playScore1>=100 && playScore2>=100)||(playScore1==playScore2))
    text("No winner",150,490);
}


int diceX, diceY, rollTime, sum;
float diceLength;

void setup()
{
  size(500, 500);
  background(230);
  
  diceX = (int)(Math.random() * 20 + 1);
  diceY = (int)(Math.random() * 20 + 1);
  if(diceX > diceY)
  {
    diceLength = (width * 0.9 / diceX);
  }
  else
  {
    diceLength = (height * 0.9 / diceY);
  }
  frameRate(20);
  rollTime = 10;
}
void draw()
{
  sum = 0;
  if(rollTime == 10)
  {
    fill(230);
    rect(0, 0, width, height);
  }
  if(rollTime > 0)
    loop();
  if(rollTime == 0)
     noLoop();
  else
    rollTime--;
    
  for (int nx = 0; nx < diceX; nx++)
  {
    for (int ny = 0; ny < diceY; ny++)
    {
      int x, y;
      float buffer;
      if(diceX > diceY)
        buffer = width * 0.1 / (diceX + 1);
      else 
        buffer = height * 0.1 / (diceY + 1);
      x = (int)(buffer + (nx * (diceLength + buffer)) );
      y = (int)(buffer + (ny * (diceLength + buffer)) );
      
      if(diceX > diceY)
      {
        y += (int)((height - (diceLength * diceY + buffer * (diceY + 1)))/2);
      }
      else
      {
        x += (int)((width - (diceLength * diceX + buffer * (diceX + 1)))/2);
      }
      
      Die d = new Die(x, y);
      d.roll();
      d.show();
      sum += d.num;
    }
  }
  //document.getElementById("output").innerHTML = sum;
  System.out.println(sum);
}
void mousePressed()
{
  rollTime = 10;
  
  diceX = (int)(Math.random() * 20 + 1);
  diceY = (int)(Math.random() * 20 + 1);
  if(diceX > diceY)
  {
    diceLength = (width * 0.9 / diceX);
  }
  else
  {
    diceLength = (height * 0.9 / diceY);
  }
  
  redraw();
}

class Die //models one single dice cube
{
  //variable declarations here
  int num, myX, myY;
  float dotDia = diceLength / 5;

  Die(int x, int y) //constructor
  {
    myX = x;
    myY = y;
  }
  void roll()
  {
    num = (int)(Math.random() * 6) + 1;
  }
  void show()
  {
    //your code here
    stroke(0);
    fill(255);
    rect(myX, myY, diceLength, diceLength, 5);
    
    fill(0);
    if(num == 1)
    {
      ellipse(myX + diceLength / 2, myY + diceLength / 2, dotDia, dotDia);
    }
    else if(num == 2)
    {
      ellipse(myX + diceLength / 4, myY + diceLength / 4 * 3, dotDia, dotDia);
      ellipse(myX + diceLength / 4 * 3, myY + diceLength / 4, dotDia, dotDia);
    }
    else if (num == 3)
    {
      for(int i = 1; i <= 3; i++)
      {
        ellipse(myX + diceLength / 4 * i, myY + diceLength / 4 * (4 - i), dotDia, dotDia);
      }
    }
    else if(num == 4)
    {
      for(int x = 0; x < 2; x++)
      {
        for(int y = 0; y < 2 ; y ++)
          ellipse(myX + diceLength / 4 + (x*2* diceLength/4), myY + diceLength / 4 + (y*2* diceLength/4), dotDia, dotDia);
      }
    }
    else if (num == 5)
    {
      for(int x = 0; x < 2; x++)
      {
        for(int y = 0; y < 2 ; y ++)
          ellipse(myX + diceLength / 4 + (x*2* diceLength/4), myY + diceLength / 4 + (y*2* diceLength/4), dotDia, dotDia);
      }
      ellipse(myX + diceLength / 2, myY + diceLength / 2, dotDia, dotDia);
    }
    else
    {
      for(int x = 0; x < 2; x++)
      {
        for(int y = 0; y < 3 ; y ++)
          ellipse(myX + diceLength / 4 + (x*2* diceLength/4), myY + diceLength / 4 + (y* diceLength/4), dotDia, dotDia);
      }
    }
  }
}

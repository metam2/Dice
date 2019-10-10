int DICE_X = 20;
int DICE_Y = 10;
int diceLength;

void setup()
{
  size(500, 500);
  if(DICE_X > DICE_Y)
  {
    diceLength = (int)(width * 0.9 / DICE_X);
  }
  else
  {
    diceLength = (int)(height * 0.9 / DICE_Y);
  }
  frameRate(20);
	noLoop();
}

int rollTime = 0;
void draw()
{
	if(rollTime > 0)
    loop();
  if(rollTime == 0)
  {
     noLoop();
     
  }
  else
    rollTime--;
    
  int sum = 0;
  for (int nx = 0; nx < DICE_X; nx++)
  {
    for (int ny = 0; ny < DICE_Y; ny++)
    {
      int x, y;
      if(DICE_X > DICE_Y)
      {
      x = (int)((width * 0.1 / (DICE_X + 1) + (nx * (diceLength + width * 0.1 / (DICE_X + 1) )) ));
      y = (int)((height - diceLength * DICE_Y) / (DICE_X + 1) + (ny * (diceLength + (height - diceLength * DICE_Y) / (DICE_Y + 1)) ) );
      }
      else
      {
      y = (int)((height * 0.1 / (DICE_Y + 1) + (ny * (diceLength + height * 0.1 / (DICE_Y + 1) )) ));
      }
      System.out.println(width * 0.1 / (DICE_X + 1));
      System.out.println(height * 0.1 / (DICE_Y + 1));
      /*
      if(DICE_X > DICE_Y)
      {
        y += (int)((height - (diceLength * DICE_Y + height * 0.1))/2);
      }
      else
      {
        x += (int)((width - (diceLength * DICE_X + width * 0.1))/2);
      }
      */
      x = 1;
      Die d = new Die(x, y);
      d.roll();
      d.show();
      sum += d.num;
    }
  }
}
void mousePressed()
{
  rollTime = 10;
	redraw();
}
class Die //models one single dice cube
{
	//variable declarations here
  int num, myX, myY;
  int dotDia = diceLength / 5;
	
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

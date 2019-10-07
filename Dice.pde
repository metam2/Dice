int DICE_X;
int DICE_Y;
int diceWidth, diceHeight;

void setup()
{
  size(500, 500);
  if(DICE_X > DICE_Y)
  {
    diceWidth = (int)((width - width*0.1) / DICE_X);
    diceHeight = diceWidth;
  }
  else
  {
    diceHeight = (int)((height - height*0.1) / DICE_Y);
    diceWidth = diceHeight;
  }
	noLoop();
}
void draw()
{
	//your code here
}
void mousePressed()
{
	redraw();
}
class Die //models one single dice cube
{
	//variable declarations here
  int num, myX, myY;
	
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
	}
}

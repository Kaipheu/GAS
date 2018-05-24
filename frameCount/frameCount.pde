int F =frameCount;
void draw()
{
  println((frameCount-F)/frameRate);
  if ((frameCount-F)/frameRate >=3)
  {
    F =frameCount;
  }
}

//int((frameCount-F)/(frameRate*10))
//F=frameCount;

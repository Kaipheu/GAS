Missile Missile = new Missile(100, 100);

class Missile
{
  int[][] M = new int[2][4];
  PImage Missile0;
  PImage Missile1;

  Missile(float xposMissile, float yposMissile)
  { 
    yposMissile = 0;
    xposMissile = 0;

    Missile0 = loadImage("Missile0.PNG");
    Missile1 = loadImage("Missile1.PNG");

    //missile coup/coup
    //missile rafale 3 tirs
    //laser
    
    M[0][0]=60;                 //précision  
    M[0][1]=1;                  //dégats par missile
    M[0][2]=7;                  //recharge (en s)
    M[0][3]=2;                  //niveau d'énergie requis
    M[0][4]=40;                 //prix
    M[1][0]=50;
    M[1][1]=1;
    M[1][2]=11;
    M[1][3]=3;
    M[1][4]=60;
    M[2][0]=70;
    M[2][1]=2;
    M[2][2]=10;
    M[2][3]=3;
    M[2][4]=70;

    //for (inti=0; i<=3; i++)
    //{
    //  M[i][0]=M[i][0]+10;        //amélioration des missiles //à faire si tps
    //  M[i][1]=M[i][1]+1;
    //  M[i][2]=M[i][2]-1;
    //}
  }
}
class Missile
{
  int[][] M = new int[2][4];

  Missile(float xposMissile, float yposMissile)
  { 
    yposMissile = 0;
    xposMissile = 0;
    
    //missile coup/coup
    //missile rafale 3 tirs

    M[0][0]=60;                 //précision  
    M[0][1]=1;                  //dégats par missile
    M[0][2]=7;                  //recharge (en s)
    M[0][4]=40;                 //prix
    M[1][0]=50;
    M[1][1]=1;
    M[1][2]=11;
    M[1][3]=60;
  }
}

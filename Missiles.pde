class Missile
{
  public int[][] M = new int[2][3];
  Missile(float xposMiss, float yposMiss) { 
    yposMiss = 0;
    xposMiss = 0;

    //missile coup/coup
    //missile rafale 3 tirs

    M[0][0]=10;                 //variable pour montrer quel missile est équipé 
    M[0][1]=1;                  //dégats par missile
    M[0][2]=7;                  //recharge (en s)
    M[1][0]=20;
    M[1][1]=1;
    M[1][2]=9;
  }
}
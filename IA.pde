class IA
{
  Ennemie VIA;             //initialisation des variables 
  int MEquiper = 0;
  int MR = 0, Vise=0;
  int[] P = new int[8];
  int NE=1, N=0;
  boolean Tir = false, Visible = true;
  boolean MRTer = false;
  PImage Image = loadImage("Texture/PNG/IA.png"); 

  IA(float XposIA, float YposIA)  //constructeur de l'IA
  { 
    VIA =new Ennemie(width - 100, height/10, 104); // l larg et taille salle
    XposIA = width -100;
    YposIA = height - 100;

    N = int(random(2));   //variable N déterminant le type d'Ennemi rencontré
    if (NE == 10) {
      N=3;
    }

    P[0] = 1;
    P[1] = 0;        //priorité par salles (viser IA)
    P[2] = 2;
    P[3] = 1;
    P[4] = 0;
    P[5] = 2;
    P[6] = 2;
    P[7] = 0;
  }
  void draw()
  {
    VIA.draw();     //dessiner la classe Ennemi
    if (Visible == true)      //si l'IA est visible alors dessiner :
    {
      switch(N)
      {
      case 0: 
        fill(#E31919);
        text("Vaisseau de reconnaisance", VIA.Pos.x-200, VIA.Pos.y+500);  //type d'IA
        VIA.DefPv(15);                                                    //son nombre de PV
        MEquiper = Miss.M[0][0];                                          //son type de Missile
        MR = Miss.M[0][2];                                                //la recharge de son Missile
        MR = 0;
        for (int i=0; i<=7; i++) {
          VIA.Salle[i].PV = 1;                                            //le nombre de PV de ses salles
        }
        break;
      case 1:                                                             //pareil
        fill(#E31919);
        text("Vaisseau de combat", VIA.Pos.x-200, VIA.Pos.y+500);
        VIA.DefPv(25);
        MEquiper = Miss.M[0][0];
        MR = Miss.M[0][2];
        for (int i=0; i<=7; i++) {
          VIA.Salle[i].PV = 1;
        }
      case 2:                                                             //pareil
        fill(#E31919);
        text(" Vaisseau inconnu", VIA.Pos.x-200, VIA.Pos.y+500);
        VIA.DefPv(20+int(random(5)));
        MEquiper = Miss.M[int(random(1))][0];
        for (int i=0; i<=1; i++) { 
          for (int j=0; j<=1; j++) {
            if (MEquiper == Miss.M[j][0]) {
              MR = Miss.M[j][2];
            }
          }
        }
        for (int i=0; i<=7; i++) {
          VIA.Salle[i].PV = 2;
        }
      case 3:                                                             //pareil 
        fill(#E31919);
        text(" Vaisseau de commandement", VIA.Pos.x-200, VIA.Pos.y+500);
        VIA.DefPv(15);
        MEquiper = Miss.M[1][0];
        MR = Miss.M[1][2];
        for (int i=0; i<=7; i++) {
          VIA.Salle[i].PV = 3;
        }
        break;
      default:                                                             //pareil
        fill(#E31919);
        text("Vaisseau de reconnaisance", VIA.Pos.x-200, VIA.Pos.y+500);
        VIA.DefPv(15);
        MEquiper = Miss.M[0][0];
        MR = Miss.M[0][2];
        for (int i=0; i<=7; i++) {
          VIA.Salle[i].PV = 1;
        }
        break;
      }
    }
  }
}

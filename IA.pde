class IA
{
  Enemie VIA;
  int Boucliermax;
  Salle[] Salle = new Salle[8]; // Tableau des Salles de l'IA
  int[] MEquiper = new int[2];
  int[] MR = new int[2];
  int[] P = new int[8];
  int NE=1, N=0;
  boolean[] Tir= new boolean [2];
  boolean[] MRTer = new boolean[2];
  PImage Image = loadImage("Texture/PNG/IA.png"); 

  IA(float XposIA, float YposIA)
  { 
    VIA =new Enemie(width - 100, height/10, 104); // l larg et taille salle
    XposIA = width -100;
    YposIA = height - 100;
    MRTer[0]=false;
    MRTer[1]=false;

    N = int(random(2));
    if (NE == 10) {
      N=3;
    }
    
    switch(N)
    {
    case 0: 
      fill(#E31919);
      text("Vaisseau de reconnaisance", XposIA, YposIA);
      VIA.PV=15;
      Boucliermax = VIA.Bouclier.N = 1;
      MEquiper[0] = Miss.M[0][0];
      MEquiper[1] = 0;
      MR[0] = Miss.M[0][2];
      MR[0] = 0;
      for (int i=0; i<=7; i++) {
        VIA.Salle[i].PV = 1;
      }
      break;
    case 1: 
      fill(#E31919);
      text("Vaisseau de combat", XposIA, YposIA);
      VIA.PV=25;
      Boucliermax = VIA.Bouclier.N = 2;
      MEquiper[0] = Miss.M[0][0];
      MEquiper[1] = Miss.M[0][0];
      MR[0] = Miss.M[0][2];
      MR[0] = 0;
      for (int i=0; i<=7; i++) {
        VIA.Salle[i].PV = 1;
      }
    case 2:
      fill(#E31919);
      text(" Vaisseau inconnu", XposIA, YposIA);
      VIA.PV=20+int(random(5));
      Boucliermax= VIA.Bouclier.N = 2;
      MEquiper[0] = Miss.M[int(random(1))][0];
      MEquiper[1] = Miss.M[int(random(1))][0];
      for (int i=0; i<=1; i++) { 
        for (int j=0; j<=1; j++) {
          if (MEquiper[i] == Miss.M[j][0]) {
            MR[i]= Miss.M[j][2];
          }
        }
      }
      for (int i=0; i<=7; i++) {
        VIA.Salle[i].PV = 2;
      }
    case 3 : 
      fill(#E31919);
      text(" Vaisseau de commandement", XposIA, YposIA);
      MR[0] = Miss.M[0][2];
      MR[0] = 0;
      VIA.PV=15;
      Boucliermax = VIA.Bouclier.N = 3;
      MEquiper[0] = Miss.M[0][0];
      MEquiper[1] = Miss.M[1][0];
      MR[0] = Miss.M[0][2];
      MR[0] = Miss.M[1][2];
      for (int i=0; i<=7; i++) {
        VIA.Salle[i].PV = 3;
      }
      break;
    default :
      fill(#E31919);
      text("Vaisseau de reconnaisance", XposIA, YposIA);
      VIA.PV=15;
      Boucliermax = VIA.Bouclier.N = 1;
      MEquiper[0] = Miss.M[0][0];
      MEquiper[1] = 0;
      MR[0] = Miss.M[0][2];
      MR[0] = 0;
      for (int i=0; i<=7; i++) {
        VIA.Salle[i].PV = 1;
      }
      break;
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
    VIA.draw();
  }

  void action()
  {
    int Tirer0 = int((frameCount-F[7])/( frameRate));
    int Tirer1 = int((frameCount-F[8])/( frameRate));
    if (Tirer0==Miss.M[0][2]) {
      Tir[0]=true;
      F[7]=0;
    }
    if (Tirer1==Miss.M[1][2]) {
      Tir[1]=true;
      F[8]=0;
    }

    for (int i =-1; i<8; i++) {     //salle de préférence à viser
      if ((V.Salle[i+1].PV >= V.Salle[i].PV) && (P[i+1] >= P[i])) {
        P[i] = P[i+1];
        VIA.ArrivMissile();
      }
    }
  }
}

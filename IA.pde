class IA
{
  Enemie VIA;
  int Boucliermax;
  int MEquiper = 0;
  int MR = 0;
  int[] P = new int[8];
  int NE=1, N=0;
  boolean Tir = false;
  boolean MRTer = false;
  PImage Image = loadImage("Texture/PNG/IA.png"); 

  IA(float XposIA, float YposIA)
  { 
    VIA =new Enemie(width - 100, height/10, 104); // l larg et taille salle
    XposIA = width -100;
    YposIA = height - 100;

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
      MEquiper = Miss.M[0][0];
      MR = Miss.M[0][2];
      MR = 0;
      for (int i=0; i<=7; i++) {
        VIA.Salle[i].PV = 1;
      }
      break;
    case 1: 
      fill(#E31919);
      text("Vaisseau de combat", XposIA, YposIA);
      VIA.PV=25;
      Boucliermax = VIA.Bouclier.N = 2;
      MEquiper = Miss.M[0][0];
      MR = Miss.M[0][2];
      for (int i=0; i<=7; i++) {
        VIA.Salle[i].PV = 1;
      }
    case 2:
      fill(#E31919);
      text(" Vaisseau inconnu", XposIA, YposIA);
      VIA.PV=20+int(random(5));
      Boucliermax= VIA.Bouclier.N = 2;
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
    case 3 : 
      fill(#E31919);
      text(" Vaisseau de commandement", XposIA, YposIA);
      VIA.PV=15;
      Boucliermax = VIA.Bouclier.N = 3;
      MEquiper = Miss.M[1][0];
      MR = Miss.M[1][2];
      for (int i=0; i<=7; i++) {
        VIA.Salle[i].PV = 3;
      }
      break;
    default :
      fill(#E31919);
      text("Vaisseau de reconnaisance", XposIA, YposIA);
      VIA.PV=15;
      Boucliermax = VIA.Bouclier.N = 1;
      MEquiper = Miss.M[0][0];
      MR = Miss.M[0][2];
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
    int Tirer0 = int((F[7] - frameCount)/( frameRate));
    if (Tirer0==Miss.M[0][2]) {
      Tir=true;
      F[7]=0;
    }

    for (int i =-1; i<8; i++) {     //salle de préférence à viser
      if ((V.Salle[i+1].PV <= V.Salle[i].PVMax) && (P[i+1] >= P[i])) {
        P[i] = P[i+1];
        
      }
    }
  }
}
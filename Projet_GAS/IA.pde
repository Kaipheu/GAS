int MR1=0, MR2=0;
int NumEnnemi =0;

IA IA = new IA (100, 100);

class IA
{
  int YposIa = height -100, XposiIa = width - 100;
  int PV, Boucliermax, NbMissile, MEequiper[0], MEequiper[1];
  Salle[] Salle = new Salle[8]; // Tableau des Salles de l'IA
  int[]MEequiper = new int[2];
  boolean EnVie = true;
  int NumEnnemi=0, NbBouclier, N;

  IA(int XposIA, int YposIA)
  { 
    YposIA = 100;
    XposIA = 100;

    while (NumEnnemi<10)
    {
      int N = int(random(2));
    }
    if (NumEnnemi = 6 || NumEnnemi = 10)
    {
      N=3;
    }
    switch(N) {
    case '0': 
      PV=15;
      Boucliermax=1;
      NbMissile=13;
      MEequiper[0] = Missile.M[0][0];
      MEequiper[1] = Missile.M[2][0];
      Salle = new Salle[7];
      for (int i =0; i<Salle.lenght; i++) {
        Salle[i] = new Salle(height -100, width -100, 100);
      }
      break;
    case '1': 
      PV=25;
      Boucliermax=2;
      NbMissile=20;
      MEequiper[0] = Missile.M[1][0];
      MEequiper[1] = Missile.M[2][0];
      Salle = new Salle[7];
      for (int i =0; i<Salle.lenght; i++) {
        Salle[i] = new Salle(height -100, width -100, 100);
      }
    case '2': 
      PV=20+int(random(5));
      NbMissile=15 +int(random(5));
      Boucliermax=2;
      MEequiper[0] = Missile.M[0][0];
      MEequiper[1] = Missile.M[2][0];
      Salle = new Salle[7];
      for (int i =0; i<Salle.lenght; i++) {
        Salle[i] = new Salle(height -100, width -100, 100);
      }
    case '3': 
      PV=15;
      Boucliermax=3;
      NbMissile=13;
      MEequiper[0] = Missile.M[1][0];
      MEequiper[1] = Missile.M[1][0];
      Salle = new Salle[7];
      for (int i =0; i<Salle.lenght; i++) {
        Salle[i] = new Salle(height -100, width -100, 100);
      }
      break;
    }
  }
  
  
  void action()
  {
    boolean Tire1=false, Tire2=false;
    int Tirer1=s, Tirer2=s;

    int NbBouclier = Boucliermax;
    int RBouclier = s;
    while (NbBouclier <= Boucliermax)
    {
      if (RBouclier == 6)
      {
        RBouclier=s;
      }
      NbBouclier++;
    }

    while (Tirer1==Missile.M[0][2])
    {
      Tire1=true;
      Tirer1=s;
    }
    while (Tirer2==Missile.M[1][2])
    {
      Tire2=true;
      Tirer1=s;
    }
    if( Salle.PV <= 2)
    {
      //homme va à la salle
    }
    if (
  }
}

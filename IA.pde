<<<<<<< Updated upstream
IA IA = new IA (100, 100);

class IA
{
  float YposIa = height -100, XposiIa = width - 100;
  Barr Bouclier;
  Barr Pv;
  int PV, Boucliermax, NbBouclier;
  Salle[] Salle = new Salle[8]; // Tableau des Salles de l'IA
  int[] MEquiper = new int[2];
  int[] MR = new int[2];
  int[] P = new int[8];
  int NumEnnemi=0, N;
  boolean Tire1=false, Tire2=false;
  boolean[] MRTer = new boolean[2];

  IA(float XposIA, float YposIA)
  { 
    YposIA = 100;
    XposIA = 100;
    PImage Image = loadImage("Texture/PNG/IA.png");  
    Pv = new Barr(x, y-(5*L)-5, PV, L, l, "Point de vie");
    Bouclier = new Barr(x, y-3*L, 3, L, l, "Bouclier");
    MR[0]=0;
    MR[1]=0;   
    MRTer[0] =false;
    MRTer[1]= false;

    if (NumEnnemi<10)
    {
      int N = int(random(2));
    }
    if ((NumEnnemi = 6) || (NumEnnemi = 10))
    {
      N=3;
    }
    switch(N) {
    case '0': 
      PV=15;
      Boucliermax = NbBouclier = 1;
      MEquiper[0] = Missile.M[0][0];
      MEquiper[1] = Missile.M[2][0];
      Salle = new Salle[7];
      for (int i =0; i<Salle.lenght; i++) {
        Salle[i] = new Salle(height -100, width -100, 100);
      }
      break;
    case '1': 
      PV=25;
      Boucliermax=2;
      MEquiper[0] = Missile.M[1][0];
      MEquiper[1] = Missile.M[2][0];
      Salle = new Salle[7];
      for (int i =0; i<Salle.lenght; i++) {
        Salle[i] = new Salle(height -100, width -100, 100);
      }
    case '2': 
      PV=20+int(random(5));
      Boucliermax=2;
      MEquiper[0] = Missile.M[0][0];
      MEquiper[1] = Missile.M[2][0];
      Salle = new Salle[7];
      for (int i =0; i<Salle.lenght; i++) {
        Salle[i] = new Salle(height -100, width -100, 100);
      }
    case '3': 
      PV=15;
      Boucliermax=3;
      MEquiper[0] = Missile.M[1][0];
      MEquiper[1] = Missile.M[1][0];
      Salle = new Salle[7];
      for (int i =0; i<Salle.lenght; i++) {
        Salle[i] = new Salle(height -100, width -100, 100);
      }
      break;
    }

    P[0] = 1;
    P[1] = 0;        //priorité par salles (viser IA)
    P[2] = 3;
    P[3] = 1;
    P[4] = 0;
    P[5] = 3;
    P[6] = 3;
    P[7] = 2;
  }
    void draw() {
      image(Image, Pos.x, Pos.y);
      for (Salle S : Salle) {
        S.draw();
      }
      Pv.draw();
    }

    void action()
    {
      int q = second() - s;
      int Tirer1=s, Tirer2=s;
      if (Tirer1==Missile.M[0][2])
      {
        Tire1=true;
        Tirer1=q;
      }
      if (Tirer2==Missile.M[1][2])
      {
        Tire2=true;
        Tirer1=q;
      }

      for (int i=-1; i<8; i++)  //salle de préférence à viser
      {
        if ((V.Salle[i+1].PV >= V.Salle[i].PV) && (P[i+1] >= P[i]))
        {
          P[i] = P[i+1];
          int Viser = V.Salle[i];
        }
      }

      if (Salle[2].PV <= Salle[2].PVmax || Salle[5].PV <= Salle[5].PVmax || Salle[6].PV <= Salle[6].PVmax)  //salle qui nécessite des réparations
      {
        //Homme va en direction de la salle
      } else {
        //Homme retourne à la case initiale
      }
    }
  }
=======
IA IA = new IA (100, 100);

class IA
{
  float YposIa = height -100, XposiIa = width - 100;
  Barr Bouclier;
  Barr Pv;
  int PV, Boucliermax, NbBouclier;
  Salle[] Salle = new Salle[8]; // Tableau des Salles de l'IA
  int[] MEquiper = new int[2];
  int[] MR = new int[2];
  int[] P = new int[8];
  int NumEnnemi=0, N;
  boolean Tire1=false, Tire2=false;

  IA(float XposIA, float YposIA)
  { 
    YposIA = 100;
    XposIA = 100;
    MEquiper[0];
    MEquiper[1];
    MR[0]=0;
    MR[1]=0;
    PImage Image = loadImage("Texture/PNG/IA.png");  
    Pv = new Barr(x, y-(5*L)-5, PV, L, l, "Point de vie");
    Bouclier = new Barr(x, y-3*L, 3, L, l, "Bouclier");

    if (NumEnnemi<10)
    {
      int N = int(random(2));
    }
    if ((NumEnnemi = 6) || (NumEnnemi = 10))
    {
      N=3;
    }
    switch(N) {
    case '0': 
      PV=15;
      Boucliermax = NbBouclier = 1;
      MEquiper[0] = Missile.M[0][0];
      MEquiper[1] = Missile.M[2][0];
      Salle = new Salle[7];
      for (int i =0; i<Salle.lenght; i++) {
        Salle[i] = new Salle(height -100, width -100, 100);
      }
      break;
    case '1': 
      PV=25;
      Boucliermax=2;
      MEquiper[0] = Missile.M[1][0];
      MEquiper[1] = Missile.M[2][0];
      Salle = new Salle[7];
      for (int i =0; i<Salle.lenght; i++) {
        Salle[i] = new Salle(height -100, width -100, 100);
      }
    case '2': 
      PV=20+int(random(5));
      Boucliermax=2;
      MEquiper[0] = Missile.M[0][0];
      MEquiper[1] = Missile.M[2][0];
      Salle = new Salle[7];
      for (int i =0; i<Salle.lenght; i++) {
        Salle[i] = new Salle(height -100, width -100, 100);
      }
    case '3': 
      PV=15;
      Boucliermax=3;
      MEquiper[0] = Missile.M[1][0];
      MEquiper[1] = Missile.M[1][0];
      Salle = new Salle[7];
      for (int i =0; i<Salle.lenght; i++) {
        Salle[i] = new Salle(height -100, width -100, 100);
      }
      break;
    }

    P[0] = 1;
    P[1] = 0;        //priorité par salles (viser IA)
    P[2] = 3;
    P[3] = 1;
    P[4] = 0;
    P[5] = 3;
    P[6] = 3;
    P[7] = 2;
  }
    void draw() {
      image(Image, Pos.x, Pos.y);
      for (Salle S : Salle) {
        S.draw();
      }
      Pv.draw();
    }

    void action()
    {
      int q = second() - s;
      int Tirer1=s, Tirer2=s;
      if (Tirer1==Missile.M[0][2])
      {
        Tire1=true;
        Tirer1=q;
      }
      if (Tirer2==Missile.M[1][2])
      {
        Tire2=true;
        Tirer1=q;
      }

      for (int i =-1; i<8)  //salle de préférence à viser
      {
        if ((V.Salle[i+1].PV >= V.Salle[i].PV) && (P[i+1] >= P[i]))
        {
          P[i] = P[i+1];
          int Viser = V.Salle[i];
        }
      }

      if (Salle[2].PV <= Salle[2].PVmax || Salle[5].PV <= Salle[5].PVmax || Salle[6].PV <= Salle[6].PVmax)  //salle qui nécessite des réparations
      {
        //Homme va en direction de la salle
      } else {
        //Homme retourne à la case initiale
      }
    }
  }
>>>>>>> Stashed changes

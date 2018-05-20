class IA
{
  Vaisseau VIA;
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
  PImage Image = loadImage("Texture/PNG/IA.png");  

  IA(float XposIA, float YposIA)
  { 
    XposIA = width -100;
    YposIA = height - 100;
    MRTer[0]=false;
    MRTer[1]=false;
    VIA =new Vaisseau(width - 600, height/4, 104, -1); // l larg et taille salle
    Pv = new Barr(150, 150-(5*150)-5, PV, 150, 150, "Point de vie");
    Bouclier = new Barr(150, 150-3*150, 3, 150, 150, "Bouclier");

    if (NumEnnemi<10)
    {
      int N = int(random(2));
    }
    if ((NumEnnemi == 6) || (NumEnnemi == 10))
    {
      N=3;
    }
    if ((NumEnnemi == 6) || (NumEnnemi == 10))
    {
      N=3;
    }
    switch(N) {
    case '0': 
      PV=15;
      Boucliermax = NbBouclier = 1;
      MEquiper[0] = Missile.M[0][0];
      MEquiper[1] = 0;
      MR[0] = Missile.M[0][2];
      MR[0] = 0;
      break;
    case '1': 
      PV=25;
      Boucliermax=2;
      MEquiper[0] = Missile.M[0][0];
      MEquiper[1] = Missile.M[0][0];
      MR[0] = Missile.M[0][2];
      MR[0] = 0;
    case '2': 
      PV=15;
      Boucliermax=3;
      MEquiper[0] = Missile.M[0][0];
      MEquiper[1] = Missile.M[1][0];
      MR[0] = Missile.M[0][2];
      MR[0] = Missile.M[1][2];
    case '3': 
      PV=20+int(random(5));
      Boucliermax=2;
      MEquiper[0] = Missile.M[int(random(1))][0];
      MEquiper[1] = Missile.M[int(random(1))][0];
      for (int i=0; i<=1; i++) { 
        for (int j=0; j<=1; j++) {
          if (MEquiper[i] == Missile.M[j][0])
          {
            MR[i]= Missile.M[j][2];
          }
        }
      }
      MR[0] = Missile.M[0][2];
      MR[0] = 0;
      break;
    default :
      PV=25;
      Boucliermax=2;
      MEquiper[0] = Missile.M[0][0];
      MEquiper[1] = Missile.M[0][0];
      MR[0] = Missile.M[0][2];
      MR[0] = 0;
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
  void draw() {
    fill(120, 255);
    rect(width/2, height/2, 0, 0);
    noStroke();
    VIA.draw();
  }
  
  PVector AvPos(int ID) {
    return Salle[ID].Pos;
  }
  int AvPVSalle(int ID) {
    return Salle[ID].PV;
  }
  int ArrivMissile() {
    for (Salle S : Salle) {
      if (S.AuDessu()) {
        return S.Type;
      }
    }
    return 9;
  }

  void action()
  {
    int q = frameCount;
    int Tirer1 = q, Tirer2=q;
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

    for (int i =-1; i<8; i++)  //salle de préférence à viser
    {
      if ((V.Salle[i+1].PV >= V.Salle[i].PV) && (P[i+1] >= P[i]))
      {
        P[i] = P[i+1];
        ArrivMissile(); //cahnger
      }
    }

    //if (Salle[2].PV <= Salle[2].PVmax || Salle[5].PV <= Salle[5].PVmax || Salle[6].PV <= Salle[6].PVmax)  //salle qui nécessite des réparations
    //{
    //  //Homme va en direction de la salle
    //} else if (Salle[0].PV <= Salle[0].PVmax || Salle[3].PV <= Salle[3].PVmax){
    //  //Homme va en direction de la salle
    //}else if (Salle[1].PV <= Salle[1].PVmax || Salle[4].PV <= Salle[4].PVmax || Salle[7].PV <= Salle[7].PVmax){
    //  //Homme va en direction de la salle
    //}
  }
}

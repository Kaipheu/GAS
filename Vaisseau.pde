class Vaisseau {

  Salle[] Salle = new Salle[8]; // Tableau des Salles du vaiseaux
  Barr Pv;    // Point de vie du Vaiseaux
  Barr Oxy;   // Niveau d'oxygène du Vaiseaux
  Barr Bouclier;// Niveau du Bouclier
  Barr Carbu;// Carburant restant
  Barr[] Equi= new Barr[3];// Point de l'équipage 
  Barr Missile;

  PImage Image;
  PVector Pos; // Position du vaiseau
  int PV/*,Ox=10,Bc = 3, Car = 10, PvE=3*/;
  boolean Visible = true, Recharge = false;
  long TempoBouclier;
  boolean[] MRTer = new boolean[2];
  int[] MR = new int[2];               //a
  int[] MEquiper = new int[2];  //arme équiper
  int Boucliermax=1;             //de flo
  int O;
  short PosS = 0;
  Vaisseau(int x, int y, int T, int Ori) {
    Image = loadImage("Texture/PNG/Vaisseau500.png");
    int L=T/10, l=T/5;
    Pos = new PVector(x, y);
    //if (O<0)Pos.sub(100,0);
    PlacementSalle(T);
    for (Salle S : Salle) {
      PV += S.PV;
      S.Texture = true;
    }
    O= Ori;
    Pv = new Barr(x, y-(5*L)-5, PV, L, l, "Point de vie");
    Bouclier = new Barr(x, y-3*L, 3, L, l, "Bouclier");
    Oxy = new Barr(x, y+Image.width+l*0.5, 10, L, l, "O2");
    Missile = new Barr(x*3, y-3*l, 10, L, l, "Missiles");
    Carbu = new Barr(x+150, y+(l*0.5+Image.width), 10, L, l, "Caburant");

    Equi[0] = new Barr(x, y+Image.width+l*2, 3, L, l, "Pierre");
    Equi[1] = new Barr(x+(l*3)^2, y+l*2+Image.width, 3, L, l, "Jacques");
    Equi[2] = new Barr(x+(l*6), y+l*2+Image.width, 3, L, l, "Michel");

    
    //Image.resize(T*5,T*6);
  }


  void draw() {
    image(Image, Pos.x, Pos.y);
    for (Salle S : Salle) {
      S.draw();
    }
    Pv.draw();
    Oxy.draw();
    Bouclier.draw();
    Carbu.draw();
    Equi[0].draw();
    Equi[1].draw();
    Equi[2].draw();
    Missile.draw();
    if ( Recharge) {
      Recharge();
    }
  }

  void Recharge() {
    if (frameCount+(frameRate)*10 - TempoBouclier<=0) {
      Bouclier.N = 2;
      Recharge = false;
    }
  }
  void mousePressed() {
    for (Salle S : Salle) {
      S.mousePressed();
    }
  }


  void mouseMoved() {
  }

  boolean Air (int ID) {
    return Salle[ID].AuDessu();
  }
  void Dommage(int ID, int Pts) {
    Salle[ID].Dommage(Pts);

    PV-=Pts;
    if (ID==0) {
      Recharge = true;
      TempoBouclier = frameCount;
    }
  }
  PVector AvPos(int ID) {
    return Salle[ID].Pos;
  }
  int AvPVSalle(int ID){
      return Salle[ID].PV;
  }

  void PlacementSalle(int T) {
    short[][] PosS = new short[8][2];
    
    Salle[0] =new Salle(Pos.x+PosS[0][0]+364 , Pos.y+PosS[0][1]+209, T); 
    Salle[0].DefType(0);
    Salle[0].DefNom("Bouclier");
    Salle[0].Texture = true;
    Salle[1] =new Salle(Pos.x+PosS[1][0]+32, Pos.y+PosS[1][1]+27, T);
    Salle[1].DefType(1);
    Salle[1].DefNom("Réacteur");

    Salle[2] =new Salle(Pos.x+PosS[2][0]+32 , Pos.y+PosS[2][1]+141, T);
    Salle[2].DefType(2);
    Salle[2].DefNom("Pilotage");

    Salle[3] =new Salle(Pos.x+PosS[3][0]+32 , Pos.y+PosS[3][1]+256, T);
    Salle[3].DefType(3);
    Salle[3].DefNom("Surveillance");

    Salle[4] =new Salle(Pos.x+PosS[4][0]+32 , Pos.y+PosS[4][1]+370, T );
    Salle[4].DefType(4);
    Salle[4].DefNom("Oxygene");

    Salle[5] =new Salle(Pos.x+PosS[5][0]+198 , Pos.y+PosS[4][1]+95, T);
    Salle[5].DefType(5);
    Salle[5].DefNom("Soin");

    Salle[6] =new Salle(Pos.x+PosS[6][0]+198 , Pos.y+PosS[5][1]+209, T);
    Salle[6].DefType(6);
    Salle[6].DefNom("Reserve ");

    Salle[7] =new Salle(Pos.x+PosS[7][0]+198 , Pos.y+PosS[6][1]+323, T);
    Salle[7].DefType(7);
    Salle[7].DefNom("Arme");
  }
}

class Enemie {
  Salle[] Salle = new Salle[8]; // Tableau des Salles du vaiseaux
  Barr Pv;    // Point de vie du Vaiseaux
  Barr Bouclier;// Niveau du Bouclier

  PImage Image;
  PVector Pos; // Position du vaiseau
  int PV;

  Enemie(int x, int y, int T) {
    Pos = new PVector(x,y);  
    short[][] PosS = new short[8][2];
    Image = loadImage("Texture/PNG/IA.png");
    int L=T/10, l=T/5;

    PosS[0][0] =-364 ;
    PosS[0][1] = 209 ;
    PosS[1][0] = -32 ;
    PosS[1][1] = 27 ;
    PosS[2][0] = - 32;
    PosS[2][1] =  141;
    PosS[3][0] =  -32;
    PosS[3][1] =  256;
    PosS[4][0] = - 32;
    PosS[4][1] = 370;
    PosS[5][0] = - 198;
    PosS[5][1] = 95;
    PosS[6][0] =- 198;
    PosS[6][1] = 209;
    PosS[7][0] =- 198;
    PosS[7][1] = 232;

    Pv = new Barr(x, y-(5*L)-5, PV, L, l, "Point de vie");
    Bouclier = new Barr(x, y-3*L, 3, L, l, "Bouclier");
    PlacementSalle(T, PosS);

    for (Salle S : Salle) {
      PV += S.PV;
      S.Texture = true;
    }
  }


  void draw() {
    image(Image, Pos.x, Pos.y);
    for (Salle S : Salle) {
      S.draw();
    }
    Pv.draw();
    Bouclier.draw();
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

  void PlacementSalle(int T, short[][] PosS) {

    Salle[0] =new Salle(Pos.x+PosS[2][0], Pos.y+PosS[2][1], T); 
    Salle[0].DefType(0);
    Salle[0].DefNom("Bouclier");
    Salle[0].Texture = true;
    
    Salle[1] =new Salle(Pos.x+PosS[1][0], Pos.y+PosS[1][1], T);
    Salle[1].DefType(1);
    Salle[1].DefNom("Réacteur");

    Salle[2] =new Salle(Pos.x+PosS[0][0], Pos.y+PosS[0][1], T);
    Salle[2].DefType(2);
    Salle[2].DefNom("Pilotage");

    Salle[3] =new Salle(Pos.x+PosS[3][0], Pos.y+PosS[3][1], T);
    Salle[3].DefType(3);
    Salle[3].DefNom("Surveillance");

    Salle[4] =new Salle(Pos.x+PosS[4][0], Pos.y+PosS[4][1], T );
    Salle[4].DefType(4);
    Salle[4].DefNom("Oxygene");

    Salle[5] =new Salle(Pos.x+PosS[5][0], Pos.y+PosS[4][1], T);
    Salle[5].DefType(5);
    Salle[5].DefNom("Soin");

    Salle[6] =new Salle(Pos.x+PosS[6][0], Pos.y+PosS[5][1], T);
    Salle[6].DefType(6);
    Salle[6].DefNom("Reserve ");

    Salle[7] =new Salle(Pos.x+PosS[7][0], Pos.y+PosS[6][1], T);
    Salle[7].DefType(7);
    Salle[7].DefNom("Arme");
  }
}

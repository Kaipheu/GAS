class Ennemie{
  Salle[] Salle = new Salle[8]; // Tableau des Salles du vaiseaux
  Barr Pv;    // Point de vie du Vaiseaux
  Homme Michel;
  Barr Bouclier;
  Barr Equi;
  
  PImage Image;
  PVector Pos; // Position du vaiseau
  int PV;

  Ennemie(int x, int y, int T) {
    Pos = new PVector(x, y);  
    
    int L=T/10, l=T/5;
    PV=5;
    short[][] PosS = new short[8][2];
    Image = loadImage("Texture/PNG/IA_500x500.png");
    Pv = new Barr(Pos.x-150, Pos.y-l, PV, L, l, "Point de vie");  //création des Barres
    Bouclier = new Barr(150, 150-3*150, 3, 10, 10, "Bouclier");
    Michel = new Homme(Pos.x+32, Pos.y+27, T);
    Equi = new Barr(x, y + Image.width + l*2, 3, L, l, "");// Création d'une instance de Barr pour les point de vie de Michel
 
    PosS[0][0] = -469 ;        //définition des positions de l'IA
    PosS[0][1] = 186 ;
    PosS[1][0] = -137 ;
    PosS[1][1] = 27 ;
    PosS[2][0] = - 137;
    PosS[2][1] =  141;
    PosS[3][0] =  -137;
    PosS[3][1] =  253;
    PosS[4][0] = - 137;
    PosS[4][1] = 367;
    PosS[5][0] = - 303;
    PosS[5][1] = 72;
    PosS[6][0] =- 303;
    PosS[6][1] = 187;
    PosS[7][0] =- 303;
    PosS[7][1] = 299;
    Pv.C_Txt = color(#72A8C9);
    PlacementSalle(T, PosS);
    for (Salle S : Salle) {
      PV += S.PV;                       //définition des PV des Salles
      S.Texture = true;                 //et de leurs textures
    }
  }

  void draw()
  {
    image(Image, Pos.x-Image.width, Pos.y);  //dessiner l'image de l'IA
    for (Salle S : Salle) { 
      S.draw();                              //et de ses salles
    } 
    Pv.N = PV; 
    Pv.draw();                               //dessiner la barre de ses PV
    println(Pv.Long);
  }

  void mousePressed()
  {
    for (Salle S : Salle) {                  //le Joueur presse le bouton Salle
      S.mousePressed();
    }
  }

  boolean Air (int ID) {
    return Salle[ID].AuDessu();              //Air de la Salle
  }

  PVector AvPos(int ID) {
    try{
    return Salle[ID].Pos;                       //afficher la position de la Salle du Vaisseau
    }catch(ArrayIndexOutOfBoundsException e){   //afficher pb si salle inexistante
    println("Salle inexistante");
    return new PVector(0,0);
    }  
}
  int AvPVSalle(int ID) {           //donne l'ID de la Salle
    return Salle[ID].PV;
  }
  int DefPv(int PV){         //définition de la barre Pv
    Float X = Pv.Pos.x;
    Float Y = Pv.Pos.y;
    int li = Pv.Larg;
    int L = Pv.Long;
    Pv = null;
    this.PV = PV;
    Pv = new Barr(X, Y, PV, L, li, "Point de vie");
    return PV;
  }
  
  int ArrivMissile() {          //où arrive le Missile
    for (Salle S : Salle) { 
      if (S.AuDessu()) { 
        return S.Type;          //nous donne le type de la salle soit son ID
      }
    } 
    return 9;
  } 

  void PlacementSalle(int T, short[][] PosS) {  
 
    Salle[0] =new Salle(Pos.x+PosS[2][0], Pos.y+PosS[2][1], T);   //position des Salles 
    Salle[0].DefType(0);                                          //de leur identifiant
    Salle[0].DefNom("Bouclier");                                  //de leur nom
    Salle[0].Texture = true;                                      //de leur texture

    Salle[1] =new Salle(Pos.x+PosS[1][0], Pos.y+PosS[1][1], T);  //pareil
    Salle[1].DefType(1);
    Salle[1].DefNom("Réacteur");

    Salle[2] =new Salle(Pos.x+PosS[0][0], Pos.y+PosS[0][1], T);  //pareil
    Salle[2].DefType(2);
    Salle[2].DefNom("Pilotage");

    Salle[3] =new Salle(Pos.x+PosS[3][0], Pos.y+PosS[3][1], T);  //pareil
    Salle[3].DefType(3);
    Salle[3].DefNom("Surveillance");

    Salle[4] =new Salle(Pos.x+PosS[4][0], Pos.y+PosS[4][1], T );  //pareil
    Salle[4].DefType(4);
    Salle[4].DefNom("Oxygene");

    Salle[5] =new Salle(Pos.x+PosS[5][0], Pos.y+PosS[5][1], T);  //pareil
    Salle[5].DefType(5);
    Salle[5].DefNom("Soin");

    Salle[6] =new Salle(Pos.x+PosS[6][0], Pos.y+PosS[6][1], T);  //pareil
    Salle[6].DefType(6);
    Salle[6].DefNom("Reserve ");

    Salle[7] =new Salle(Pos.x+PosS[7][0], Pos.y+PosS[7][1], T);  //pareil
    Salle[7].DefType(7);
    Salle[7].DefNom("Arme");
  }
}

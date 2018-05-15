class Vaisseau {

  Salle[] Salle = new Salle[8]; // Tableau des Salles du vaiseaux
  Barr PV;    // Point de vie du Vaiseaux
  Barr Oxy;   // Niveau d'oxygène du Vaiseaux
  Barr Bouclier;// Niveau du Bouclier
  Barr Carbu;// Carburant restant
  Barr[] Equi= new Barr[3];// Point de l'équipage 

  PImage Image;
  PVector Pos; // Position du vaiseau
  int Pv/*,Ox=10,Bc = 3, Car = 10, PvE=3*/;
  boolean Visible = true;


  Vaisseau(int x, int y, int T) {
    thread("Load");
    int L=T/10, l=T/5;
    Pos = new PVector(x, y);
    //if (O<0)Pos.sub(100,0);
    PlacementSalle(T);
    for (Salle S : Salle) {
      Pv += S.PV;
      S.Texture = true;
    }
    Image = loadImage("Texture/PNG/Vaisseau500.png");  
    PV = new Barr(x, y-(5*L)-5, Pv, L, l, "Point de vie");
    Bouclier = new Barr(x, y-3*L, 3, L, l, "Bouclier");
    Oxy = new Barr(x, y+Image.width+l*0.5, 10, L, l, "O2");
    Carbu = new Barr(x+150, y+(l*0.5+Image.width), 10, L, l, "Caburant");

    Equi[0] = new Barr(x, y+Image.width+l*2, 3, L, l, "Pierre");
    Equi[1] = new Barr(x+(l*3)^2, y+l*2+Image.width, 3, L, l, "Jacques");
    Equi[2] = new Barr(x+(l*6), y+l*2+Image.width, 3, L, l, "Michel");
   
      Image = loadImage("Texture/PNG/Vaisseau500.png");
      //Image.resize(T*5,T*6);
  }
 

  void draw() {
    image(Image, Pos.x, Pos.y);
    for (Salle S : Salle) {
      S.draw();
    }
    PV.draw();
    Oxy.draw();
    Bouclier.draw();
    Carbu.draw();
    Equi[0].draw();
    Equi[1].draw();
    Equi[2].draw();
  }


  void mousePressed() {
    //println(Salle[0].PV);
    for (Salle S : Salle) {
      S.mousePressed();
    }
  }


  void mouseMoved() {
  }

  boolean Air (int ID) {
    return Salle[ID].AuDessu();
  }
  void Dommage(int ID, int P) {
    Salle[ID].Dommage(P);
    Pv-=P;
  }
  PVector AvPos(int ID){
    return Salle[ID].Pos;
  }
  void PlacementSalle(int T) {
    Salle[0] =new Salle(Pos.x+364, Pos.y+209, T); 
    Salle[0].DefType(0);
    Salle[0].DefNom("Bouclier");
    Salle[0].Texture = true;
    Salle[1] =new Salle(Pos.x+32, Pos.y+27, T);
    Salle[1].DefType(1);
    Salle[1].DefNom("Réacteur");

    Salle[2] =new Salle(Pos.x+32, Pos.y+141, T);
    Salle[2].DefType(2);
    Salle[2].DefNom("Pilotage");

    Salle[3] =new Salle(Pos.x+32, Pos.y+256, T);
    Salle[3].DefType(3);
    Salle[3].DefNom("Surveillance");

    Salle[4] =new Salle(Pos.x+32, Pos.y+370, T );
    Salle[4].DefType(4);
    Salle[4].DefNom("Oxygene");

    Salle[5] =new Salle(Pos.x+198, Pos.y+95, T);
    Salle[5].DefType(5);
    Salle[5].DefNom("Soin");

    Salle[6] =new Salle(Pos.x+198, Pos.y+209, T);
    Salle[6].DefType(6);
    Salle[6].DefNom("Reserve ");

    Salle[7] =new Salle(Pos.x+198, Pos.y+323, T);
    Salle[7].DefType(7);
    Salle[7].DefNom("Arme");
  }
}

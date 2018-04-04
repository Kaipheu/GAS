class Vaisseau {

  Salle[] Salle = new Salle[8];
  Barr Barr;
  Barr Oxy;
  Barr Bouclier;
  Barr Carbu;
  Barr[] Equi= new Barr[3];// Barre 
  
  PImage[] Image = new PImage[2];
  PVector Pos;
  int Pv,Ox=10,Bc = 3, Car = 10, PvE=3;
  boolean Visible = true;
  
  
  Vaisseau(int x, int y, int T,int O) {
    Pos = new PVector(x, y);
    if (O<0)Pos.sub(100,0);
    PlacementSalle(T,O);
    for (Salle S : Salle) {
      Pv += S.PV;
    }
    Barr = new Barr(x, y-50, Pv,O, true);
    Barr.Nom = "Point de vie";
    Oxy = new Barr(x,y+4*(T+T/10),10,1,true);
    Oxy.Nom = "O2";
    
    Bouclier = new Barr(x, y-25,3,O,true);
    Bouclier.Nom ="Bouclier";
    
    Carbu = new Barr(x+Oxy.Log*Ox+Oxy.Log, y+4*(T+T/10),Car,O,true);
    Carbu.Nom = "Caburant";
    
    Equi[0] = new Barr(x+,y+4*(T+T/10),PvE,O,true);
    Equi[1] = new Barr(x+int(Equi[0].Pos.x),y+4*(T+T/10),PvE,O,true);
    Equi[2] = new Barr(x+3*int(Carbu.Pos.x)+Carbu.Log*Car+Carbu.Log,y+4*(T+T/10),PvE,O,true);
  }
  
  
  void draw() {
    for (Salle S : Salle) {
      S.draw();
    }
    Barr.draw(Pv);
    Oxy.draw(Ox);
    Bouclier.draw(Bc);
    Carbu.draw(Car);
    Equi[0].draw(PvE);
    Equi[1].draw(PvE);
    Equi[2].draw(PvE);
  }
  
  
  void mousePressed() {
    println(Salle[0].PV);
    for (Salle S : Salle) {
      S.mousePressed();
    }
  }
  
  
  void mouseMoved() {
  }
  
boolean Air (int ID){
  return Salle[ID].Audessu();
}
  void Dommage(int ID, int P) {
    Salle[ID].Dommage(P);
    Pv = 0;
    for (Salle S : Salle) {
      Pv += S.PV;
    }
  }
  
  void PlacementSalle(int T,int O){
        Salle[0] =new Salle(Pos.x, Pos.y, T); 
    Salle[0].DefType(0);
    Salle[0].DefNom("Bouclier");

    Salle[1] =new Salle(Pos.x, Pos.y+(T+T/10), T);
    Salle[1].DefType(1);
    Salle[1].DefNom("Réacteur");

    Salle[2] =new Salle(Pos.x, Pos.y+2*(T+T/10), T);
    Salle[2].DefType(2);
    Salle[2].DefNom("Pilotage");

    Salle[3] =new Salle(Pos.x, Pos.y+3*(T+T/10), T);
    Salle[3].DefType(3);
    Salle[3].DefNom("Surveillance");

    Salle[4] =new Salle(Pos.x+(T+T/10)*O, Pos.y+(T/2), T );
    Salle[4].DefType(4);
    Salle[4].DefNom("Oxygene");

    Salle[5] =new Salle(Pos.x+(T+T/10)*O, Pos.y+3*(T/2+T/10), T);
    Salle[5].DefType(5);
    Salle[5].DefNom("Soin");

    Salle[6] =new Salle(Pos.x+(T+T/10)*O, Pos.y+5*(T/2+T/10), T);
    Salle[6].DefType(6);
    Salle[6].DefNom("Reserve ");

    Salle[7] =new Salle(Pos.x+2*(T+T/10)*O, Pos.y+3*(T/2+T/10), T);
    Salle[7].DefType(7);
    Salle[7].DefNom("Arme");
  }
}
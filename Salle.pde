public class Salle extends Bouton {
  Boolean Texture =false;
  int Type;
  int PV = 1, PVMax = 1;
  
  void draw() {  
    stroke(0, 120, 120);
    strokeWeight(2);
    fill(255);
    rect(Pos.x, Pos.y, Long, Larg);
    if(Texture) Tex.Texture(this);
    fill(0);
    textAlign(LEFT, CENTER);
    if (AuDessu()) {
      fill(0, 120, 120, 120);
      rect(Pos.x, Pos.y, Long, Larg);
      fill(0,120); 
      rect(mouseX,mouseY,-textWidth(Nom)-width/100,-50); 
      fill(255); 
      text(Nom, mouseX-textWidth(Nom)-width/200, mouseY-40); 
      if(PV<=0){ 
      fill(255,0,0); 
      } 
      text("PV :" +PV,mouseX-textWidth(Nom)+textWidth("PV :" +PV)/2-width/200,mouseY-10); 
    }
  }
  /*
 Type :
   0 = bouclier
   1 = reacteur
   2 = Poste de Pilotage
   3 = Surveillance 
   4 = Oxygene
   5 = Soin
   6 = Reverve
   7 = Arme
   */
  //Salle(int X, int Y) {
  //  super(X,Y);
  //  Nom = "";
  //}
  //Salle(float X, float Y) {
  //  super(X,Y);
  //  Nom = "";
  //}
  Salle(float X, float Y, int Long, int Larg) {
    super(int(X),int(Y),Long,Larg,0);
    this.Long = Long;
    this.Larg = Larg;
    Nom = "";
    Arrondie = 0;
  }
  Salle(float X,float Y, int T){
    super(int(X),int(Y),T,T,0);
    this.Long = T;
    this.Larg = T;
    Nom = "";
    Arrondie= 0;
  }
  void DefType(int Type) {
    this.Type = Type;
  }

  void DefNom(String Nom) {
    this.Nom = Nom;
  }

  void DefTex() {
  }
  void Dommage(int N) {
    PV-=N;
  }
  void mousePressed() {
    if (AuDessu()) {
      fill(0, 120, 120, 120);
      rect(Pos.x, Pos.y, Long, Larg);
    }
  }
  void mouseMoved() {
    
  }

}

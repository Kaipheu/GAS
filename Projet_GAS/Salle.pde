public class Salle {
  PVector Pos;
  int Larg = 100;
  int Long = 100;
  String Tex = "defaut", Nom;
  Boolean Texture =false;
  int Type;
  int PV = 2;
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
  Salle(int X, int Y) {
    Pos = new PVector(X, Y);
    Nom = "";
  }
  Salle(float X, float Y) {
    Pos = new PVector(X, Y);
    Nom = "";
  }
  Salle(float X, float Y, int T) {
    Pos = new PVector(X, Y);
    Long = T;
    Larg = T;
    Nom = "";
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
  void draw() {  
    stroke(0, 120, 120);
    strokeWeight(2);
    fill(255);
    rect(Pos.x, Pos.y, Long, Larg);
    fill(0);
    textAlign(LEFT, CENTER);
    text(Nom, Pos.x, Pos.y+Larg/2);
    mouseMoved();
  }
  void mousePressed() {
    if (mouseX>Pos.x && mouseX<Pos.x+Long && mouseY >Pos.y && mouseY<Pos.y+Larg) {
      println(1);
      fill(0, 120, 120, 120);
      rect(Pos.x, Pos.y, Long, Larg);
    }
  }
  void mouseMoved() {
    if (mouseX>Pos.x && mouseX<Pos.x+Long && mouseY >Pos.y && mouseY<Pos.y+Larg) {
      fill(0, 120, 120, 120);
      rect(Pos.x, Pos.y, Long, Larg);
      textAlign(CENTER, BOTTOM);
      text(Nom, mouseX, mouseY);
    }
  }
  boolean Audessu() {
    if (mouseX>Pos.x && mouseX<Pos.x+Long && mouseY >Pos.y && mouseY<Pos.y+Larg) {
      return true;
    } else {
      return false;
    }
  }
}
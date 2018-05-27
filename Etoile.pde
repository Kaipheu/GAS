/*********************************************************************************************************
 Titre du Programme : Gestion d'Attaque Spatiale (GAS)
 **********************************************************************************************************
 Date de création du programme : 23/01/2018
 **********************************************************************************************************
 Auteurs : Berenger Florian, Said Djambae
 
 Lycée : Pierre Termier
 **********************************************************************************************************
 Nom du fichier : Etoile
 *********************************************************************************************************/
class Etoiles {
  PVector Pos= new PVector(), Post = new PVector();
  PVector Vst = new PVector();
  PVector Acc = new PVector();
  int R=255, G=255, B=255, A=255;
  boolean AnimVisible = false;
  float Taille = 5;
  boolean E  = false;
  Etoiles(float x, float y, float T, Boolean Et) {
    Pos.set(x, y);
    Taille = T;
    E = Et;
  }
  void draw() {
    stroke(R, G, B, A);
    strokeWeight(1);
    if (!E)line(Pos.x, Pos.y, Post.x, Post.y);
    translate(Pos.x, Pos.y);
    strokeWeight(1);
    if (E) {
      for (int i = 0; i<5; i++) {
        rotate((PI/4)*i);
        line(-Taille, 0, Taille, 0);
      }
    }
  }
  void DefAcc(float x, float y) {
    Acc.set(x, y);
  }
  void Acc() {
    Vst.add(Acc);
  }
  void Deplacement() {
    Post.set(Pos);
    Pos.add(Vst);
    if (!E) {
      Acc(); 
      Taille= norm(Vst.mag(), 0, 2.5);
    }
  }
  void DefAcc() {
    Acc.set(Taille/10*random(0, 1), Taille*1/20*random(0, 1));
  }
  void AleAcc() {
    Acc.set(random(-width/1000, width/1000), random(-height/1000, height/1000));
  }
  void Pos() {
    
    if (Pos.x<=-1 ||Pos.x>=width+1 ||Pos.y<=-1 ||Pos.y>=height+1) { 
      if (!E) {
        Pos.set(width/2, height/2);
        DefAcc(random(-1, 1), random(-1, 1));
        Taille=1;
        Vst.set(0, 0);
      } else {
        AleAcc();
        //Taille
        Pos.set(random(width), random(height));
        Vst.set(0,0);
        Acc();
        Taille = random(5);
      }
      
    }
  }

  void Ale() {
    Pos.set(int(random(0, width)), int(random(0, height)));
  }
}
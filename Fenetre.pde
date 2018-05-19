class Fenetre {
  Bouton[] B;
  String[] Chaine; 
  PVector Pos;
  Boolean Aff = false;
  Fenetre(float x, float y, int Nbouton, int Nchamp) {
    B = new Bouton[Nbouton];
    Chaine = new String[Nchamp];
    Pos = new PVector(x, y);
  }

  void draw() {
    stroke(0);
    fill(0,0,0,200);
    rect(Pos.x,Pos.y,width/4, height/2);
      for (Bouton B : B) {
      try {
        B.draw();
      }
      catch(NullPointerException e) {
      }
    }
  }
}

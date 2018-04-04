class Unite {
  PVector Pos= new PVector();
  int Log = 10;
  int Lar = 20;
  color Remplisage = 255;
  color Trait = 0;
  Unite(int x, int y) {
    Pos.set(x, y);
  }
  void Taille(int log, int lar) {
    Log = log;
    Lar = lar;
  }
  void draw() {
    fill(Remplisage);
    stroke(Trait);
    strokeWeight(1.5);
    rect(Pos.x, Pos.y, Log, Lar);
  }
  void DefCouleur(color Couleur) {
    Remplisage = Couleur;
  }
  void DefCTrait(color Couleur) {
    Trait = Couleur;
  }
  void DefPos(int x, int y) {
    Pos.set(x, y);
    println(Pos.x+"  "+Pos.y);
  }
}
class Unite {
  PVector Pos= new PVector();
  int Long = 10, Ar=0;
  int Larg = 20;
  color C_Rp = 255;
  color C_Tr = 0;
  Unite(float x, float y) {
    Pos.set(x, y);
  }
  Unite(float x, float y, int l, int L) {
    Pos.set(x, y);
    Long = l;
    Larg = L;
  }
  void Taille(int Long, int Larg) {
    this.Long = Long;
    this.Larg = Larg;
  }
  void draw() {
    fill(C_Rp);
    stroke(C_Tr);
    strokeWeight(1.5);
    rect(Pos.x, Pos.y, Long, Larg, Ar);
  }
  void DefCouleur(color Couleur) {
    C_Rp = Couleur;
  }
  void DefCTrait(color Couleur) {
    C_Tr = Couleur;
  }
  void DefPos(int x, int y) {
    Pos.set(x, y);
    println(Pos.x+"  "+Pos.y);
  }
}

class UniteT extends Unite {
  int Type = 0;
  UniteT(float x, float y, int l, int L, int T) {
    super(x, y, l, L);
    Type = T;
  }
  
  void draw(){
    Tex.TexU(this);
  }
}
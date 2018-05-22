class Barr extends Unite {
  int N;
  Unite[] Unite;
  int Esp = 10;
  String Nom ="Vide";
  short TPolice= 15;
  color C_Txt = 0;
  void draw() {
   if(N>=Unite.length){
    N =Unite.length-1;
    }
    for (int i = 0; i<N; i++) {
      Unite[i].draw();
    }
    fill(C_Txt);
    textAlign(TOP, LEFT);
    textSize(TPolice);
    text(Nom, Pos.x, Pos.y+TPolice);
  }

  Barr(float x, float y, int N, int Log, int Lar, String Nom) {
    super(x, y);
    Unite = new Unite[N];
    Esp= Log/2;
    this.N = N;
    for (int i = 0; i<Unite.length; i++) {
      Unite[i]= new Unite((10*(i))+x, y);
      Unite[i].Larg = Lar;
      Unite[i].Long = Log;
      Unite[i].DefCTrait(color(0, 120, 120, 120));
    }
    this.Nom=Nom;
  }
  void DefCouleur(color Couleur) {
    for (Unite U : Unite) {
      U.DefCouleur(Couleur);
    }
  }
  void DefCTrait(color Couleur) {
    for (Unite U : Unite) {
      U.DefCTrait(Couleur);
    }
  }
  void DefPos(int x, int y) {
    for (int i = 0; i<Unite.length; i++) {
      Unite[i].DefPos(i*Esp+x, y);
      //println(Pos.x+"  "+Pos.y);
    }
  }
}
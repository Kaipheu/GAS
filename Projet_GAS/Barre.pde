class Barr extends Unite {

  Unite[] Unite;
  short Esp = 10;
  String Nom ="Vide";

  Barr(int x, int y, int N) {
    super(x, y);
    Unite = new Unite[N];
    //Esp += x;
    for (int i = 0; i<Unite.length; i++) {
      Unite[i]= new Unite(10*(i)+x, y);
      Unite[i].DefCTrait(color(0, 120, 120, 120));
    }
  }
  Barr(int x, int y, int Log, int Lar) {
    super(x, y);
    Esp += Log;

    for (int i = 0; i<Unite.length; i++) {
      Unite[i]= new Unite(10*(i+Log)+x, y);
      Unite[i].Taille(Log, Lar);
      Unite[i].DefCTrait(color(0, 120, 120, 120));
    }
  }
  Barr(int x, int y, int N, int O, boolean temp) {
    super(x, y);
    Unite = new Unite[N];
    for (int i = 0; i<Unite.length; i++) {
      Unite[i]= new Unite((10*(i))*O+x, y);
      Unite[i].DefCTrait(color(0, 120, 120, 120));
    }
  }
  void draw(int N) {

    N= int(Unite.length-N);
    for (int i = 0; i<Unite.length-N; i++) {
      Unite[i].draw();
    }
    fill(0);
    textAlign(TOP, LEFT);
    text(Nom, Pos.x, Pos.y);
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
      println(Pos.x+"  "+Pos.y);
    }
  }
}
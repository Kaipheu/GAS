/*
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
  Barr(int x, int y, int N, int O, int Taille) {
    super(x, y);
    Unite = new Unite[N];
    for (int i = 0; i<Unite.length; i++) {
      Unite[i]= new Unite((10*(i))*O+x, y);
      Unite[i].DefCTrait(color(0, 120, 120, 120));
      Unite[i].Lar = Unite[i].Lar*Taille;
      Unite[i].Log = Unite[i].Log*Taille;
    }
  }

*/
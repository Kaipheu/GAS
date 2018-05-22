class Credit {
  PVector Pos;
  PVector Vst;
  boolean Affiche = false;
  PFont[] Police = new PFont[2];
  PImage[] Image = new PImage[6];
  Credit() {
    Pos = new PVector(width/2, height+10);
    Vst = new PVector(0, 5);  
    Police[0] = loadFont("Ubuntu-Bold-48.vlw");
    Police[1] = loadFont("Ubuntu-Bold-28.vlw");
    Image[1] = loadImage("Gimp.png");
    Image[0] = loadImage("Processing.png");
    Image[2] = loadImage("Gitkraken.png");
    Image[3] = loadImage("Windows.png");
    Image[4] = loadImage("Ubuntu.png");
    Image[5] = loadImage("PierreTermier.png");
  }
  void draw() {
    background(0);
    textAlign(CENTER, CENTER);
    imageMode(CENTER);

    textFont(Police[0]);
    text("Réalisation", Pos.x, Pos.y);
    textFont(Police[1]);
    text("Floriant BERENGER", Pos.x, Pos.y+50);
    text("Saïd DJAMBAE", Pos.x, Pos.y+100);
    textFont(Police[0]);
    text("Outils & Support", Pos.x, Pos.y+150);
    textFont(Police[1]);
    text("Porcessing", Pos.x, Pos.y+200);
    image(Image[0], Pos.x+textWidth("Porcessing")*2, Pos.y+200, width/20, width/20);
    text("Gimp", Pos.x, Pos.y+250);
    image(Image[1], Pos.x-textWidth("Porcessing")*2, Pos.y+250, width/20, width/20);
    text("Gitkraken", Pos.x, Pos.y+300);
    image(Image[2], Pos.x+textWidth("Porcessing")*2, Pos.y+300, width/20, width/20);
    text("Ubuntu", Pos.x, Pos.y+350);
    image(Image[4], Pos.x-textWidth("Porcessing")*2, Pos.y+350, width/20, width/20);
    text("Windows", Pos.x, Pos.y+400);
    image(Image[3], Pos.x+textWidth("Porcessing")*2, Pos.y+400, width/20, width/20);
    text("Dans de la cardre du cours d'informatique et science du numérique \n au lycée Pierre Termier", Pos.x, Pos.y+500);
    image(Image[5], Pos.x, Pos.y+550+width/20, width/20, width/20);
    Deplacement();
  }
  void Deplacement() {
    Pos.sub(Vst);
    if (Pos.y+650<0)
    {
      Pos.set(width/2, height);
      Suppr(this);
    }
  }
}
class Credit {
  PVector Pos;
  PVector Vst;
  boolean Affiche = false;
  Credit() {
    Pos = new PVector(width/2,height+10);
    Vst = new PVector(0,5);  
}
  void draw() {
    background(0);
    textAlign(CENTER, CENTER);
    textSize(5);
    text("Réalisation", Pos.x, Pos.y);
    Deplacement();
  }
  void Deplacement(){
   Pos.add(Vst);
  }
}
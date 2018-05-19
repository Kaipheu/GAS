class Champ extends Unite{
  String Texte;
  Champ(float x, float y, String Ch){
  super(x,y);
  Texte = Ch;
  }
  
  void draw(){
    super.draw();
    text(Texte,Pos.x,Pos.y);
  }
}

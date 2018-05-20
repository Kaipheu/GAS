class Homme{
  PVector Pos;
  int PV, PVMax,Taille;
  Homme(float x, float  y ,int T ){
  Pos = new PVector(x,y);
  Taille = T;
  PV = 3;
  }
  void draw(){
  Tex.Texture(this);
  }
}
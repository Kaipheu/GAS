<<<<<<< Updated upstream
class Homme{
  PVector Pos;
  int Taille;
  int Salle;
  Homme(float x, float  y ,int T ){
  Pos = new PVector(x,y);
  Taille = T;
  }
  void draw(){
  Tex.Texture(this);
  }
  void Tp(Salle Autre){
    Pos.set(Autre.Pos);
  }
}
=======
class Homme{
  PVector Pos;
  int Taille, Salle; 
  Homme(float x, float  y ,int T ){
  Pos = new PVector(x,y);
  Taille = T;
  }
  void draw(){
  Tex.Texture(this);
  }
  void Tp(Salle Autre){ 
    Pos.set(Autre.Pos); 
  } 
}
>>>>>>> Stashed changes

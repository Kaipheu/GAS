/*********************************************************************************************************
 Titre du Programme : Gestion d'Attaque Spatiale (GAS)
 **********************************************************************************************************
 Date de création du programme : 23/01/2018
 **********************************************************************************************************
 Auteurs : Berenger Florian, Said Djambae
 
 Lycée : Pierre Termier
 **********************************************************************************************************
 Nom du fichier : Homme
 *********************************************************************************************************/
class Homme{
  PVector Pos;
  int Taille, Salle,PVMax; 
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
   boolean Salle(int ID ){
     if(Salle == ID) return true;
     return false;
   }
}
/*********************************************************************************************************
 Titre du Programme : Gestion d'Attaque Spatiale (GAS)
 **********************************************************************************************************
 Date de création du programme : 23/01/2018
 **********************************************************************************************************
 Auteurs : Berenger Florian, Said Djambae
 
 Lycée : Pierre Termier
 **********************************************************************************************************
 Nom du fichier : Fenetre
 *********************************************************************************************************/
class Fenetre {
  Bouton[] B;
  Champ[] Chaine; 
  PVector Pos;
  String Titre ="-";
  Boolean Aff = false;
  int Long =width/4 ,Larg =height/2;
  Fenetre(float x, float y, int Nbouton, int Nchamp) {
    B = new Bouton[Nbouton];
    Chaine = new Champ[Nchamp];
    Pos = new PVector(x, y);
  }

  void draw() {
    textAlign(CENTER, TOP);
    stroke(0);
    
    fill(0, 0, 0, 200);
    rect(Pos.x, Pos.y, width - Pos.x , height - Pos.y );  //dessiner la fenêtre 
    fill(255);
    
    text(Titre,Pos.x+Long/2,Pos.y);
    for (Bouton B : B) {
      try {
        B.draw();              //dessiner tous les boutons
      }
      catch(NullPointerException e) {
      }
    }
    
    for (Champ C : Chaine) {
      try {
        C.draw();
      }
      catch(NullPointerException e) {
      }
    }
  }
  void InitBouton(int Index, float x, float y, int Long, int Larg) {
    B[Index] = new Bouton(Pos.x+x, Pos.y+y, Long, Larg, Index);
  }
   void InitChamp(int Index, float x, float y, String Ch) {
    Chaine[Index] = new Champ(Pos.x+x, Pos.y+y, Ch);
  }
  
  void mousePressed(){
      try {
        for (Bouton B : B) {
        B.mousePressed();
        }
      }catch(NullPointerException e) {
      }
    } 
    
     void mouseReleased(){
      try {
        for (Bouton B : B) {
        B.mouseReleased();
        }
      }catch(NullPointerException e) {
      }
    } 
}

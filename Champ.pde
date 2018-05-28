/*********************************************************************************************************
 Titre du Programme : Gestion d'Attaque Spatiale (GAS)
 **********************************************************************************************************
 Date de création du programme : 23/01/2018
 **********************************************************************************************************
 Auteurs : Berenger Florian, Said Djambae
 
 Lycée : Pierre Termier
 **********************************************************************************************************
 Nom du fichier : Champ
 Permet d'avoir du texte dans les fenetre
 *********************************************************************************************************/
class Champ extends Unite{
  String Texte; // Texte a afficher
  Champ(float x, float y, String Ch){ // constructeur : poisition x,y Texte a affiché
  super(x,y);
  Texte = Ch;
  }
  
  void draw(){ // tracage du texte
    super.draw();
    text(Texte,Pos.x,Pos.y);
  }
}
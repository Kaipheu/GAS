/*********************************************************************************************************
 Titre du Programme : Gestion d'Attaque Spatiale (GAS)
 **********************************************************************************************************
 Date de création du programme : 23/01/2018
 **********************************************************************************************************
 Auteurs : Berenger Florian, Said Djambae
 
 Lycée : Pierre Termier
 **********************************************************************************************************
 Nom du fichier : Bouton
 *********************************************************************************************************/
class Bouton extends Unite {
  Boolean Activ = false, Aff = true, Texture=false;   //initialisation des variables
  String Nom;
  color C_Tx = 255;
  int ID;
  
  Bouton(float x, float y, int Long, int Larg, int Id) {  //constructeur
    super(x,y,Long,Larg);
    Nom = str(Id);
    ID=Id;
    Arrondie = 50;
  }
   Bouton(int x, int y, int Long, int Larg, int Id) { //constructeur sans float
    super(x,y,Long,Larg);
    Nom = str(Id);
    ID=Id;
    Arrondie = 50;
  }

  void draw() {          //dessiner le bouton
    if(!Texture){
     fill(C_Rp);
    stroke(C_Tr);
    rect(Pos.x, Pos.y, Long, Larg,Arrondie);
    textAlign(CENTER, CENTER);
    fill(C_Tx);
    text(Nom, Pos.x+Long/2, Pos.y+Larg/2);        //et le texte
    }else{
      
    }
    if(AuDessu()){
      fill(255,120);
      rect(Pos.x, Pos.y, Long, Larg,50);
    }
  }
    void Position(int x, int y) {        //marquer sa position en vecteur
    Pos.set(x, y);
  }
  
  PVector Av_Position() {           //fonction qui donne sa position
    return Pos;
  }

  void Def_Ch(String Ch) {         //définition de la couleur
    this.Nom = Ch;
  }
  void Def_CStroke(color Ch) {     
    C_Tr = Ch;
  }
  void Def_CReplisage(color Ch) { //définition du remplissage
    C_Rp = Ch;
  }
  void Def_CTexte(color Ch) {     //définition du texte
    C_Tx = Ch;
  }
  
  boolean AuDessu(){              //permet de montrer si l'on est dessus
    if (mouseX<=Pos.x+Long && mouseX>=Pos.x && mouseY<=Pos.y+Larg && mouseY>=Pos.y) {
  return true;
    }else{
    return false;
    }
  }
  
  void mousePressed() {          //si on presse la souris 
    if (AuDessu()) {
        Activ = true;            //le bouton est activé
    }
  }
  void mouseReleased(){
  Activ = false;                 //si on la relâche, le bouton est désactivé
  }
}

/*********************************************************************************************************
 Titre du Programme : Gestion d'Attaque Spatiale (GAS)
 **********************************************************************************************************
 Date de création du programme : 23/01/2018
 **********************************************************************************************************
 Auteurs : Berenger Florian, Said Djambae
 
 Lycée : Pierre Termier
 **********************************************************************************************************
 Nom du fichier : Salle
 *********************************************************************************************************/
public class Salle extends Bouton {
  Boolean Texture =false;
  int Type;

  int PV = 1, PVMax = 1;  //PV et PVmax de la Salle
  
  Salle(float X, float Y) {//constructeur 1
    super(X,Y,0,0,0);
    Nom = "";
  }
  Salle(float X, float Y, int Long, int Larg) {   //constructeur 2
    super(int(X),int(Y),Long,Larg,0);
    this.Long = Long;
    this.Larg = Larg;
    Nom = "";
    Arrondie = 0;
  }
  Salle(float X,float Y, int T){    //constructeur 3
    super(int(X),int(Y),T,T,0);
    this.Long = T;
    this.Larg = T;
    Nom = "";
    Arrondie= 0;
  }
  
  void draw() {  
    stroke(0, 120, 120);
    strokeWeight(2);
    fill(255);
    rect(Pos.x, Pos.y, Long, Larg);  //dessiner le rectangle comportant la salle
    if(Texture) Tex.Texture(this);   //apporter la texture de la salle
    fill(0);
    textAlign(LEFT, CENTER);         //aligner le texte
    if (AuDessu()) {  //si la souris est au dessus :
      fill(0, 120, 120, 120);
      rect(Pos.x, Pos.y, Long, Larg);   //tracer un carré comportant :
      fill(0,120); 
      rect(mouseX,mouseY,-textWidth(Nom)-width/100,-50);
      fill(255); 
      text(Nom, mouseX-textWidth(Nom)-width/200, mouseY-40);  //le nom de la Salle 

      if(PV<=0){ 
      fill(255,0,0); 
      } 
      text("PV :" +PV,mouseX-textWidth(Nom)+textWidth("PV :" +PV)/2-width/200,mouseY-10);   //si ses PV sont inférieurs à 0 les remettreà 1.
    }
  }
  /*
 Type :
   0 = bouclier
   1 = reacteur
   2 = Poste de Pilotage
   3 = Surveillance 
   4 = Oxygene
   5 = Soin
   6 = Reverve
   7 = Arme
   */
  
  void DefType(int Type) {       //définir le type
    this.Type = Type;
  }

  void DefNom(String Nom) {      //définir le nom
    this.Nom = Nom;
  }

  
  void Dommage(int N) {           //définir les dommages
    PV-=N;
  }
  void mousePressed() {
    if (AuDessu()) {
      fill(0, 120, 120, 120);
      rect(Pos.x, Pos.y, Long, Larg);
    }
  }
  void mouseMoved() {
    
  }

}

class Unite { // Classe de Base
  PVector Pos= new PVector(); //Crée du vecteur position
  int Long = 10, Arrondie=0; // Variable de taille et d'arrondie 
  int Larg = 20;// Largeur
  color C_Rp = 255; // Couleur de remplisage 
  color C_Tr = 0;// Couleur du contour

  Unite(float x, float y) { // Constructeur avec les position x y
    Pos.set(x, y);//Initialisation de l'instance PVector
  }
  Unite(float x, float y, int l, int L) {// Constructeur avec les position la Longeur et le Largeur
    Pos.set(x, y);
    Long = l;//Longeur  
    Larg = L;//Largeur
  }


  void draw() {
    fill(C_Rp);// Changemet de la couleur de remplisage
    stroke(C_Tr);// Changement de la couleur de contour 
    strokeWeight(1.5);//Changement de la  taille du contour
    rect(Pos.x, Pos.y, Long, Larg, Arrondie); // traçage du rectangle représante l'unité
  }

  void Taille(int Long, int Larg) { // Methode de changement de Taille
    this.Long = Long;
    this.Larg = Larg;
  }

  void DefCouleur(color Couleur) { // Methode de changement de la couleur de Remplisage
    C_Rp = Couleur;
  }

  void DefCTrait(color Couleur) { // Methode de changement de la couleur de contour
    C_Tr = Couleur;
  }

  void DefPos(int x, int y) { // Methode de changement de position
    Pos.set(x, y);
    //println(Pos.x+"  "+Pos.y);
  }
}

class UniteT extends Unite { // Classe unite mais avec une Texture 
  int Type = 0; // variable qui choisie la Texture a affiché
  UniteT(float x, float y, int l, int L, int T) {
    super(x, y, l, L);
    Type = T;
  }

  void draw() {
    Tex.TexU(this);
  }
}
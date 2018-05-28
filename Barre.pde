/*********************************************************************************************************
 Titre du Programme : Gestion d'Attaque Spatiale (GAS)
 **********************************************************************************************************
 Date de création du programme : 23/01/2018
 **********************************************************************************************************
 Auteurs : Berenger Florian, Said Djambae
 
 Lycée : Pierre Termier
 **********************************************************************************************************
 Nom du fichier : Barre
 *********************************************************************************************************/
class Barr extends Unite {
  int N;// Nombre d'Unité
  Unite[] Unite;// Tableau d'Unité
  int Esp = 10; // Espacement entre les unité 
  String Nom ="Vide";// Nom de la Barr
  short TPolice= 15; // Police du nom de la barr
  color C_Txt = color(255,0,0); // couleur du Nom
  void draw() {
   if(N>Unite.length){
    N =Unite.length-1;
    }
    for (int i = 0; i<N; i++) {
      Unite[i].draw();          // Afichage de Unités 
    }
    fill(C_Txt);// Changemant de couleur
    textAlign(TOP, LEFT); // changement de type d'alignement du texte
    textSize(TPolice);    // Changement de la taille du texte
    text(Nom+" "+N, Pos.x, Pos.y+TPolice); // Tracage du nom
  }

  Barr(float x, float y, int N, int Log, int Lar, String Nom) { // Constructeur : position x,y nombre de unités,longeur, largeur de l'unité, nom de la Barr
    super(x, y);
    Unite = new Unite[N];
    Esp= Log/2;
    this.N = N;
    Long = Log;
    Larg = Lar;
    for (int i = 0; i<Unite.length; i++) {
      Unite[i]= new Unite((10*(i))+x, y); // créeation des unité
      Unite[i].Larg = Lar;                //Changement de la longeur
      Unite[i].Long = Log;                //Changement de la largeur
      Unite[i].DefCTrait(color(0, 120, 120, 120));;                //Changement de la couleur
    }
    this.Nom=Nom;;                //Changement du nom
  }
  
  void DefCouleur(color Couleur) { // Definir la couleur des unités
    for (Unite U : Unite) {
      U.DefCouleur(Couleur);
    }
  }
  void DefCTrait(color Couleur) {// Definir la couleur de conture des unités
    for (Unite U : Unite) {
      U.DefCTrait(Couleur);
    }
  }
  void DefPos(int x, int y) {// Definir la positon des unités
    for (int i = 0; i<Unite.length; i++) {
      Unite[i].DefPos(i*Esp+x, y);
      //println(Pos.x+"  "+Pos.y);
    }
  }
}
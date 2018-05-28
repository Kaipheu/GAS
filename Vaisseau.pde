/*********************************************************************************************************
 Titre du Programme : Gestion d'Attaque Spatiale (GAS)
 **********************************************************************************************************
 Date de création du programme : 23/01/2018
 **********************************************************************************************************
 Auteurs : Berenger Florian, Said Djambae
 
 Lycée : Pierre Termier
 **********************************************************************************************************
 Nom du fichier : Vaisseau
 *********************************************************************************************************/
class Vaisseau extends Ennemie {
  Barr Carbu;// Carburant restant
  Barr Equi;// Point de l'équipage 
  Barr Missile; // Missile restants
  Barr Oxy;   // Niveau d'oxygène du Vaiseaux
  Homme Michel;

  boolean MRTer = false;
  int MR = 0;        //Variable pour l'Arbitre
  int MEquiper = Miss.M[0][0];  //Variable pour l'Arbitre
  int Boucliermax=2;            //Variable pour l'Arbitre
  int PVmax=20;
  //float[][] Viser = new float[1][2];

  Vaisseau(int x, int y, int T) {
    super(x, y, T);
    Pv.N = 20;
    Image = loadImage("Texture/PNG/Vaisseau500.png");// Chargement de l'image du vaiseaux
    int L=T/10, l=T/5;//Variable de Taille pour les salle
    Pos = new PVector(x, y);// Création  du vecteur position 
    Salle[0].Pos.set(32, 141).add(Pos); //Position de la Salle
    Salle[1].Pos.set(32, 27).add(Pos);  //-
    Salle[2].Pos.set(364, 209).add(Pos);  //-
    Salle[3].Pos.set(32, 256).add(Pos);  //-
    Salle[4].Pos.set(198, 209).add(Pos);  //-
    Salle[5].Pos.set(198, 95).add(Pos);  //-
    Salle[6].Pos.set(32, 370).add(Pos);//-
    Salle[7].Pos.set(198, 325).add(Pos); //--------------------
    Pv = null;
    Pv = new Barr(x, y-(5*L)-5, 20, L, l, "Vaisseau Point de Vie");// Création de l'instance de Barr pour les points de Vie
    Bouclier = new Barr(x, y-3*L, 2, L, l, "Bouclier");// Création de l'instance de Barr pour les Point de bouclier                       
    Oxy = new Barr(x, y+Image.width+l*0.5, 10, L, l, "O2");// Création de l'instance de Barr pour le niveau d'Oxgène
    Missile = new Barr(x*3, y-1.5*l, 13, L, l, "Missiles");// Création d'une instance de Barr pour les missile restant
    Carbu = new Barr(x+150, y+(l*0.5+Image.width), 5, L, l, "Carburant");// Création d'une instance de Barr pour le caburant restant
    Equi = new Barr(x, y+Image.width+l*2, 3, L, l, "Michel");// Création d'une instance de Barr pour les point de vie de Michel
    Michel = new Homme(Pos.x+32, Pos.y+27, T);
    }


  void draw() { 
    image(Image, Pos.x, Pos.y);
    for (Salle S : Salle) {
      S.draw();
      if (S.PV <1) { 
        Michel.Pos.set(S.Pos);
      }
    }
    Pv.draw(); //Affichage du niveau des point de vie  
    Bouclier.draw();//Affichage du niveau d'Oxygène 
    Oxy.draw();//Affichage du niveau d'Oxygène 
    Carbu.draw();// Affichage du carburant restant 
    Equi.draw();// affichage des Points de vie de pierre 
    Missile.draw();//Affichage des Missile restant 
    Michel.draw();
    fill(200,255,100);
    text("Vous avez :" +str(E.Lune)+" lunes",width/4, height/9);   //afficher le nombre de lunes (argen) que possède le joueur
  }


  void Dommage(int ID, int Pts) { // Methode retirant de point de vie au Salle 
    Salle[ID].Dommage(Pts); 
    Pv.N-=Pts;
  }
  void mousePressed() {
    super.mousePressed();
    int Id = ArrivMissile();       //l'identifiant prend la valeur de la salle où arrive le Missile
    if (Id<9) {
      Michel.Tp(Salle[Id]);        //michel se téléporte à la salle
    }
  }
}

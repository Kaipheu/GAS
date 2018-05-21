class Vaisseau extends Enemie {
  Barr Carbu;// Carburant restant
  Barr Equi;// Point de l'équipage 
  Barr Missile; // Missile restants
  Barr Oxy;   // Niveau d'oxygène du Vaiseaux
  Homme Michel;

  boolean Recharge = false; //Vraie quand le bouclier en charge
  long TempoBouclier; // Variable permetant compter le "temps" de chargement du bouclier
  boolean[] MRTer = new boolean[2];// Variable pour l'Arbitre
  int[] MR = new int[2];        //Variable pour l'Arbitre
  int[] MEquiper = new int[2];  //Variable pour l'Arbitre
  int Boucliermax=1;            //Variable pour l'Arbitre

  Vaisseau(int x, int y, int T) {
    super(x, y, T);
    Image = loadImage("Texture/PNG/Vaisseau500.png");// Chargement de l'image du vaiseaux
    int[] MEquiper = new int[2];  //arme équiper            
    boolean[] MRTer = new boolean[2];//arme équiper
    int L=T/10, l=T/5;//Variable de Taille pour les salle
    Pos = new PVector(x, y);// Création  du vecteur position 
    Salle[0].Pos.set(364, 209).add(Pos); //Position de la Salle
    Salle[1].Pos.set(32, 27).add(Pos);  //-
    Salle[2].Pos.set(32, 141).add(Pos);  //-
    Salle[3].Pos.set(32, 256).add(Pos);  //-
    Salle[4].Pos.set(198, 209).add(Pos);  //-
    Salle[5].Pos.set(198, 95).add(Pos);  //-
    Salle[6].Pos.set(32, 370).add(Pos);//-
    Salle[7].Pos.set(198, 342).add(Pos); //--------------------
    Pv = new Barr(x, y-(5*L)-5, PV, L, l, "Point de vie");// Création de l'instance de Barr pour les points de Vie
    Bouclier = new Barr(x, y-3*L, 3, L, l, "Bouclier");// Création de l'instance de Barr pour les Point de bouclier 
    Oxy = new Barr(x, y+Image.width+l*0.5, 10, L, l, "O2");// Création de l'instance de Barr pour le niveau d'Oxgène
    Missile = new Barr(x*3, y-3*l, 10, L, l, "Missiles");// Création d'une instance de Barr pour les missile restant
    Carbu = new Barr(x+150, y+(l*0.5+Image.width), 10, L, l, "Carburant");// Création d'une instance de Barr pour le caburant restant
    Equi = new Barr(x, y+Image.width+l*2, 3, L, l, "Michel");// Création d'une instance de Barr pour les point de vie de Michel
    Michel = new Homme(Pos.x+32, Pos.y+27, T); 

    Missile.N = Carbu.N = 13;            //dispositifs au début du jeu
    MEquiper[1] = 0;
    MRTer[0] = MRTer[1] = false;
    MEquiper[0] = Miss.M[0][0];
    PV=20;
  }


  void draw() 
  { 
    image(Image, Pos.x, Pos.y);
    for (Salle S : Salle) {
      S.draw();
      if (S.PV <1) { 
        Michel.Pos.set(S.Pos);
      }
    } 
    Oxy.draw();//Affichage du niveau d'Oxygène 
    Carbu.draw();// Affichage du carburant restant 
    Equi.draw();// affichage des Points de vie de pierre 
    Missile.draw();//Affichage des Missile restant 
    Michel.draw(); 
    if ( Recharge) { 
      Recharge();// methode de recharge du bouclier
    }
  } 
  void Recharge() {
    if (frameCount+(frameRate)*10 - TempoBouclier<=0) { // Vérification du temps pour recharge de le bouclier
      Bouclier.N = 2;
      Recharge = false;
    }
  }

  void Dommage(int ID, int Pts) { // Methode retirant de point de vie au Salle 
    Salle[ID].Dommage(Pts); 
    PV-=Pts; 
    if (ID==0) { 
      Recharge = true; 
      TempoBouclier = frameCount;
    }
  }
  void mousePressed(){
  super.mousePressed();
  int Id = ArrivMissile();
  if(Id<9){
    Michel.Tp(Salle[Id]);
  }
  }
}
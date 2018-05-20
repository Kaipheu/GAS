class Vaisseau extends Enemie {
  Barr Carbu;// Carburant restant
  Barr[] Equi= new Barr[3];// Point de l'équipage 
  Barr Missile; // Missile restants
  Barr Oxy;   // Niveau d'oxygène du Vaiseaux

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
    Salle[0].Pos.set(364,209).add(Pos); //Position de la Salle
    Salle[1].Pos.set(32,27 ).add(Pos);  //-
    Salle[2].Pos.set(32,141).add(Pos);  //-
    Salle[3].Pos.set(32,256).add(Pos);  //-
    Salle[4].Pos.set(32,370).add(Pos);  //-
   Salle[5].Pos.set( 198,95).add(Pos);  //-
    Salle[6].Pos.set( 198,209).add(Pos);//-
    Salle[7].Pos.set(198,342).add(Pos); //--------------------
    Pv = new Barr(x, y-(5*L)-5, PV, L, l, "Point de vie");// Création de l'instance de Barr pour les points de Vie
    Bouclier = new Barr(x, y-3*L, 3, L, l, "Bouclier");// Création de l'instance de Barr pour les Point de bouclier 
    Oxy = new Barr(x, y+Image.width+l*0.5, 10, L, l, "O2");// Création de l'instance de Barr pour le niveau d'Oxgène
    Missile = new Barr(x*3, y-3*l, 10, L, l, "Missiles");// Création d'une instance de Barr pour les missile restant
    Carbu = new Barr(x+150, y+(l*0.5+Image.width), 10, L, l, "Caburant");// Création d'une instance de Barr pour le caburant restant
    Equi[0] = new Barr(x, y+Image.width+l*2, 3, L, l, "Pierre");// Création d'une instance de Barr pour les point de vie de Pierre 
    Equi[1] = new Barr(x+(l*3)^2, y+l*2+Image.width, 3, L, l, "Jacques"); // Création d'une instance de Barr pour les point de vie de Jacque
    Equi[2] = new Barr(x+(l*6), y+l*2+Image.width, 3, L, l, "Michel"); // Création d'une instance de Barr pour les point de vie de Michiel

      Missile.N = Carbu.N = 13;            //dispositifs au début du jeu
      MEquiper[1] = 0;
      MRTer[0] = MRTer[1] = false;
      MEquiper[0] = Miss.M[0][0];
      PV=20;
  }


  void draw() {
    super.draw();// Execution de la methode draw de la classe mère
    Oxy.draw();//Affichage du niveau d'Oxygène
    Carbu.draw();// Affichage du carburant restant
    Equi[0].draw();// affichage des Points de vie de pierre
    Equi[1].draw(); //Affichage des points de vie de Jaque
    Equi[2].draw();//Affichage des points de vie de Michel
    Missile.draw();//Affichage des Missile restant
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
  PVector AvPos(int ID) {
    return Salle[ID].Pos;
  }
  int AvPVSalle(int ID) {
    return Salle[ID].PV;
  }
  int ArrivMissile() { 
    for (Salle S : Salle) { 
      if (S.AuDessu()) { 
        return S.Type;
      }
    } 
    return 9;
  } 

  void PlacementSalle(int T, short[][] PosS) {

    Salle[0] =new Salle(Pos.x+PosS[0][0], Pos.y+PosS[0][1], T); 
    Salle[0].DefType(0);
    Salle[0].DefNom("Bouclier");
    Salle[0].Texture = true;
    Salle[1] =new Salle(Pos.x+PosS[1][0], Pos.y+PosS[1][1], T);
    Salle[1].DefType(1);
    Salle[1].DefNom("Réacteur");

    Salle[2] =new Salle(Pos.x+PosS[2][0], Pos.y+PosS[2][1], T);
    Salle[2].DefType(2);
    Salle[2].DefNom("Pilotage");

    Salle[3] =new Salle(Pos.x+PosS[3][0], Pos.y+PosS[3][1], T);
    Salle[3].DefType(3);
    Salle[3].DefNom("Surveillance");

    Salle[4] =new Salle(Pos.x+PosS[4][0], Pos.y+PosS[4][1], T );
    Salle[4].DefType(4);
    Salle[4].DefNom("Oxygene");

    Salle[5] =new Salle(Pos.x+PosS[5][0], Pos.y+PosS[4][1], T);
    Salle[5].DefType(5);
    Salle[5].DefNom("Soin");

    Salle[6] =new Salle(Pos.x+PosS[6][0], Pos.y+PosS[5][1], T);
    Salle[6].DefType(6);
    Salle[6].DefNom("Reserve ");

    Salle[7] =new Salle(Pos.x+PosS[7][0], Pos.y+PosS[6][1], T);
    Salle[7].DefType(7);
    Salle[7].DefNom("Arme");
  }
}

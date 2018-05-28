/********************************************************************************************************* //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>//
 Titre du Programme : Gestion d'Attaque Spatiale (GAS)
 **********************************************************************************************************
 Date de création du programme : 23/01/2018
 **********************************************************************************************************
 Auteurs : Berenger Florian, Said Djambae
 
 Lycée : Pierre Termier
 **********************************************************************************************************
 Commentaire : R.A.S.
 *********************************************************************************************************/

Menu M; // Objet Menu  //<>// //<>// //<>// //<>// //<>// //<>//
 //<>//
// Objet vaisseaux Joueur et ennemi

Texture Tex;   // Objet qui stocke les texture
Missile Miss; // Objet qui stocke les données sur les missile
Echange E;    // Objet qui gère les interaction monaitaire
IA IA;        // Ennemie
Vaisseau V;  // Vaisseau du joueur
Bouton[] Boutique = new Bouton[1];  // Boution pour apparaitre la boutique
Etoiles[] Et = new Etoiles[100];    // Etoile du décore de fond
Etoiles[] Missile = new Etoiles[2]; // Missiles graphisme et position et vitesse
Credit C;                           // Credit
char KEY ='0';                      // Garder en mémoire la touche pressé        
int[] F = new int[51];  //tableau permettant des tempos  
int Viser;     //identifiant de la salle viser
int  IExplo=0, k=1;      //IExplo : missile de l'explosion ; k : permettant une autre tempo


void settings () {
  fullScreen();
  //size(630, 380);
}
void setup() {
  background(0);
  Tex = new Texture(); // Initialisation de Texture : chargement de texture
  smooth(9);
  textSize(20);
  M = new Menu();                                                             // Création des instances
  Miss = new Missile(200, 200);                                               //
  V = new Vaisseau(width/10, height/10, 104);                                 //
  E = new Echange();                                                          //
  IA = new IA (100, 100);                                                     //
  C = new Credit();                                                           //
  Missile[0] = new Etoiles(V.Pos.x+500, V.Pos.y +250, 1, true);               //
  Missile[1] = new Etoiles(IA.VIA.Pos.x-500, IA.VIA.Pos.y+250, 1, true);      //-------------------------
  Boutique[0] = new Bouton(width -200, height - 70, 180, 70, 0);
  Boutique[0].Def_Ch(" La cosmo boutique " );                         //afficher le bouton boutique
  Boutique[0].C_Rp = color(#BFB3B3);
  for (int l =0; l<=50; l++)
  {
    F[l] = 0;  //les valeurs du tableau F (pour les temporisations) prennent la valeur 0.
  }
}

void draw() {
  background(120);// 
  if (M.Aff) {
    M.draw();
    if (C.Affiche) {
      C.draw();
    }
  } else {
    background(0);
    for (Etoiles E : Et) {
      pushMatrix();    
      E.draw();
      popMatrix();
      E.Deplacement();
      E.Pos();
    }
    if (IA != null)  //si l'IA est non nul
    {
      IA.draw();    //elle est dessinée
    }
    V.draw();  //dessiner le Vaisseau
    if (IA.Visible == true) {     //si l'IA est visible la phase de combat est activé
      dommage();
      reparer();
      recharger();
      actionIA();
      combat();
    }
    if (Boutique[0].Activ /*&& IA.Visible==false*/) { //si l'IA n'est plus visible et que le Joueur appuie sur le bouton de la boutique
      E.draw();  //la classe Echange(boutique) est dessinéé
    } else {
      Boutique[0].draw();
    }
    if (Missile[0].AnimVisible == true) {      //si l'Animation du Misssile 0, soit du Joueur est activé 
      animBoomV();                             //la fonction associée s'affiche
    } 
    if (Missile[1].AnimVisible == true) {      //si l'Animation du Misssile 1, soit de l'IA est activé 
      animBoomIA();                            //la fonction associée s'affiche
    }
  }
}

void keyPressed() {
  KEY = key;
  M.keyPressed();
  if (key==' ') {            //si la touche espace est pressée
    Missile[0].Pos.set(V.Pos.x+500, V.Pos.y +250);         //le Missile prend la position initiale du Vaisseau adverse  
    Missile[0].Vst.set(0, 0);
  }
  V.Bouclier.N--;
}

void keyReleased() {
  KEY = '0';
}

void mousePressed() {
  if (M.Aff) {
    M.mousePressed();
  } else {
    V.mousePressed();
    IA.VIA.mousePressed();
    Viser = IA.VIA.ArrivMissile();    //la variable viser prend la valeur de l'identifiant de la salle visée
    if (Viser<=7 && Missile[0].Pos.x == V.Pos.x+500) {  //si la salle existe et que la position du Missile est vérifiée
      Missile[0].Vst.set(PVector.sub(IA.VIA.AvPos(Viser), Missile[0].Pos).add(IA.VIA.Salle[Viser].Long/2, IA.VIA.Salle[Viser].Larg/2).setMag(15));      //le Missile prend tel coordonnées en fonction du temps
    }
    
    if (IA.VIA.Pv.N<=0 || Boutique[0].Activ) {
      E.mousePressed();
    }
  }
  Boutique[0].mousePressed();
}
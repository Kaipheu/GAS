/********************************************************************************************************* //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>//
 Titre du Programme : Gestion d'Attaque Spatiale
 **********************************************************************************************************
 Date de création du programme : 23/01/2018
 **********************************************************************************************************
 Auteurs : Berenger Florian, Said Djambae
 
 Lycée : Pierre Termier
 **********************************************************************************************************
 
 **********************************************************************************************************
 Commentaire : R.A.S.
 *********************************************************************************************************/

Menu M; // Objet Menu  //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>//

// Objet vaisseaux Joueur et ennemi

Texture Tex;
//Geste G;
Missile Miss;
Echange E;
IA IA;
Vaisseau V;
Fenetre Fen;

char KEY ='0';
Etoiles[] Et = new Etoiles[100];

int[] F = new int[51];
void frameCount()
{
  for (int i=0; i<=50; i++)
  {
    F[i]=frameCount;
  }
} // >=F[10] non utilisé

    int LO=0;

void settings () {
  fullScreen();
  Tex = new Texture();
  //size(630, 380);
  //G = new Geste();
}
void setup() {
  smooth(9);
  textSize(20);
  frameCount();
  M = new Menu();// Créeation d'une instance Menu.
  Miss = new Missile(200, 200);
  V = new Vaisseau(width/10, height/10, 104);// Instance Vaiseau Joueur
  E = new Echange();
  IA = new IA (100, 100);
}
public void Load() {
  V.Image = loadImage("Texture/PNG/Vaisseaux500.png");
}

void draw() {
  background(120);
  if (M.Aff) {
    M.draw();
  } else { //<>//
    background(0);
    for(Etoiles E:Et){
        pushMatrix();
        E.draw();
        popMatrix();
        E.Deplacement();
        E.Pos();
      }
    frameCount();
    V.draw();
    IA.draw();
    combat(); //<>//
    animMiss();
    dommage();
    reparer();
    recharger();
  }
  
  textAlign(TOP, LEFT);
  fill(0);
  //println(V.Equi.N);
  
  if(E.Fen.B[0].Activ)
  {
    E.draw();
    fill (#BE2292);
    rect (300, 300, width-600, height-600);
    fill (#A8491F);
    textSize(32);
    text ("Que voulez-vous acheter, étrangers ?", width/6, height-250);
  }
}

void keyPressed() {
  KEY = key;
  M.keyPressed();
}

void keyReleased() {
  KEY = '0';
}
void mouseMoved() {
}

void mousePressed() {
  if (M.Aff) {
    M.mousePressed();
  } else {
    V.mousePressed();
  }
}
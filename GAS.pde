/********************************************************************************************************* //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>//
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

Menu M; // Objet Menu  //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>//

// Objet vaisseaux Joueur et ennemi

Texture Tex;
//Geste G;
Missile Miss;
Echange E;
IA IA;
Vaisseau V;
Fenetre Fen;
Bouton[] Boutique = new Bouton[1];
char KEY ='0';
Etoiles[] Et = new Etoiles[100];

int[] F = new int[51];
int T, LO=0;


void settings () {
  fullScreen();
  Tex = new Texture();
  //size(630, 380);
  //G = new Geste();
}
void setup() {
  smooth(9);
  textSize(20);
  M = new Menu();// Créeation d'une instance Menu.
  Miss = new Missile(200, 200);
  V = new Vaisseau(width/10, height/10, 104);// Instance Vaiseau Joueur
  E = new Echange();
  IA = new IA (100, 100);
  Boutique[0] = new Bouton(width -200, height - 70, 180, 70, 0);
  Boutique[0].Def_Ch(" La cosmo boutique " ); 
  Boutique[0].C_Rp = color(#BFB3B3);
}

void draw() {
  background(120);
  if (M.Aff) {
    M.draw();
  } else {
    background(0);
    for (Etoiles E : Et) {
      pushMatrix();    
      E.draw();
      popMatrix();
      E.Deplacement();
      E.Pos();
    }
    frameCount();
    V.draw();
    IA.draw();
    dommage();
    reparer();
    recharger();
    combat();
    if (Boutique[0].Activ) {
      E.draw();
    } else {
      Boutique[0].draw();
    }
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
  float tempx = mouseX-V.Pos.x;
  float tempy = mouseY-V.Pos.y;
  println(tempx+" "+tempy); 
  if (M.Aff) {
    M.mousePressed();
  } else {
    V.mousePressed();
    if (IA.VIA.PV<=0) {
      E.mousePressed();
    }
  }
  Boutique[0].mousePressed();
}
void frameCount()
{
  for (int i=0; i<=50; i++)
  {
    F[i]=frameCount;
  }
} // >=F[10] non utilisé

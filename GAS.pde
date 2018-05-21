<<<<<<< Updated upstream
/********************************************************************************************************* //<>// //<>// //<>//
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

Menu M; // Objet Menu  //<>// //<>// //<>// //<>// //<>// //<>//

 // Objet vaisseaux Joueur et ennemi

Texture Tex;
//Geste G;
Missile Miss;
Echange E;
IA IA;
Vaisseau V;
char KEY ='0';
Etoiles[] Et = new Etoiles[100];
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
  V = new Vaisseau(100, height/4, 104);// Instance Vaiseau Joueur
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
  } else {
    background(0);
    //for(Etoiles E:Et){
    //    pushMatrix();    
    //    E.draw();
    //    popMatrix();
    //  }
    V.draw();
    IA.draw();
    if(E.Affiche)E.draw();
  }
  textAlign(TOP, LEFT);
  fill(0);
}

void keyPressed() {
  KEY = key;
  M.keyPressed();
}

void keyReleased() {
  KEY = '0';
}
void mouseMoved() {}

void mousePressed() {
  if (M.Aff) {
    M.mousePressed();
  }
}
=======
/********************************************************************************************************* //<>// //<>// //<>//
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

Menu M; // Objet Menu  //<>// //<>// //<>// //<>// //<>// //<>//

 // Objet vaisseaux Joueur et ennemi

Texture Tex;
//Geste G;
Missile Miss;
Echange E;
IA IA;
Vaisseau V;
char KEY ='0';
Etoiles[] Et = new Etoiles[100];
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
  V = new Vaisseau(100, height/4, 104);// Instance Vaiseau Joueur
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
  } else {
    background(120);
    //for(Etoiles E:Et){
    //    pushMatrix();    
    //    E.draw();
    //    popMatrix();
    //  }
    V.draw();
    IA.draw();
    if(E.Affiche)E.draw();
  }
  textAlign(TOP, LEFT);
  fill(0);
}

void keyPressed() {
  KEY = key;
  M.keyPressed();
}

void keyReleased() {
  KEY = '0';
}
void mouseMoved() {}

void mousePressed() {
  if (M.Aff) {
    M.mousePressed();
  }
}
>>>>>>> Stashed changes

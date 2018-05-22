<<<<<<< Updated upstream
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
=======
/********************************************************************************************************* //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>//
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

Menu M; // Objet Menu  //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>//

// Objet vaisseaux Joueur et ennemi

Texture Tex;
//Geste G;
Missile Miss;
Echange E;
IA IA;
Vaisseau V;
Fenetre Fen;
Bouton[] B = new Bouton[2];
char KEY ='0';
Etoiles[] Et = new Etoiles[100];

int[] F = new int[50];
int T;


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
  B[0] = new Bouton(width -200, height - 70, 180, 70, 0);
  B[1] = new Bouton(width -200, height - 140, 180, 70, 1);
  // bouton pour continuer le jeu
  B[0].Def_Ch(" La cosmo boutique " );
  B[1].Def_Ch(" Passer au niveau suivant ");    
  B[1].C_Rp = color(#BFB3B3);
  B[0].C_Rp = color(#BFB3B3);
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
    V.draw();
    IA.draw();
    combat();
    dommage();
    reparer();
    recharger();
    if (B[0].Activ)
    {
      E.draw();
    }else{
      B[0].draw();
      B[1].draw();
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
    E.mousePressed();
  }
  B[0].mousePressed();
      B[1].mousePressed();
}
void frameCount()
{
  for (int i=0; i<=50; i++)
  {
    F[i]=frameCount;
  }
} // >=F[10] non utilisé
>>>>>>> Stashed changes

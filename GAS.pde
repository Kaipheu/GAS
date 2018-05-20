/********************************************************************************************************* //<>//
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

Menu M; // Objet Menu  //<>// //<>// //<>// //<>//

Vaisseau V; // Objet vaisseaux Joueur et ennemi

Texture Tex;
//Geste G;
Missile Missile;
Echange E;
IA IA;
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
  V = new Vaisseau(100, height/4, 104, true);// Instance Vaiseau Joueur
  V = new Vaisseau(100, height/4, 104,true);// Instance Vaiseau Joueur
  E = new Echange();
  Missile = new Missile(200, 200);
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
    E.draw();
    println(mouseX);
    println(mouseY);
  }
  
  //G.draw();
  textAlign(TOP, LEFT);
  fill(0);
  //text("FPS  : "+int(frameRate)+" Mode T: "+str(G.Trace)+" Choix : "+str(G.Choix)+" Clique : "+G.CptClque+" F1 aff : "+str(F1.Aff), 15, 15);
}

void keyPressed() {
  KEY = key;
  M.keyPressed();
}

void keyReleased() {
  KEY = '0';
}
void mouseMoved() {
  //if (G.Choix && !G.Trace) {
  //  V.Salle[G.Index].DefPos(mouseX, mouseY);
  //}
  //if (G.Choix && G.Trace) {
  //  G.Redef(G.Index, mouseX, mouseY);
  //}
}

void mousePressed() {
  thread("Th_mousePressed");
}
void Th_mousePressed() {

  if (M.Aff) {
    M.mousePressed();
  }
  //G.mousePressed();
}
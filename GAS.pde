/********************************************************************************************************* //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>//
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

// Objet vaisseaux Joueur et ennemi

Texture Tex;
//Geste G;
Missile Miss;
Echange E;
IA IA;
Vaisseau V;
Fenetre Fen;
Bouton[] Boutique = new Bouton[1];
Etoiles[] Et = new Etoiles[100];
Etoiles[] Missile = new Etoiles[2];
Credit C;
char KEY ='0';
int[] F = new int[51];
int Viser;     //identifiant de la salle viser
int  L0 =0, IExplo=0;
boolean Foi = false;
int []EExplosion = new int[2];   //frame of explosion

void settings () {
  fullScreen();
  Tex = new Texture();
  //size(630, 380);
}
void setup() {
  smooth(9);
  textSize(20);
  M = new Menu();// Créeation d'une instance Menu.
  Miss = new Missile(200, 200);
  V = new Vaisseau(width/10, height/10, 104);// Instance Vaiseau Joueur
  E = new Echange();
  IA = new IA (100, 100);
  C = new Credit();
  Boutique[0] = new Bouton(width -200, height - 70, 180, 70, 0);
  Boutique[0].Def_Ch(" La cosmo boutique " ); 
  Boutique[0].C_Rp = color(#BFB3B3);
  Missile[0] = new Etoiles(V.Pos.x+500, V.Pos.y +250, 1, true);
  Missile[1] = new Etoiles(IA.VIA.Pos.x-500, IA.VIA.Pos.y+250, 1, true);
  println(IA.VIA.Pos.x-500+" "+IA.VIA.Pos.y+250);
  for (int i =0; i<=1; i++)
  {
    EExplosion[i] = -1;
  }
  for (int l =0; l<=50; l++)
  {
    F[l] = 0;
  }
}

void draw() {
  //println(EExplosion);
  //println(F[7]);
  background(120);
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
    V.draw();
    if (IA != null)
    {
      IA.draw();
    }
    imageMode(CENTER);
    if (IA.Visible == true) {
    dommage();
    reparer();
    recharger();
    actionIA();
    combat();
    }
    if (Boutique[0].Activ && IA.Visible==false) {
      E.draw();
    } else {
      Boutique[0].draw();
    }
    if (Missile[0].AnimVisible == true) {
      animBoomV();
    } /*else if (Missile[0].LO == false) {
      Missile[0] = null;
      Missile[0] = new Etoiles(V.Pos.x+500, V.Pos.y +250, 1, true);
    }*/
    if (Missile[1].AnimVisible == true) {
      animBoomIA();
    } /*else if (Missile[1].LO == false) {
      Missile[1] = null;
      Missile[1] = new Etoiles(IA.VIA.Pos.x-500, IA.VIA.Pos.y +250, 1, true);
    }*/
    imageMode(CORNER);
  }
  //IA.VIA.Pv.Pos.set(mouseX,mouseY);
}

void keyPressed() {
  KEY = key;
  M.keyPressed();
  if (key=='e') {
    Missile[0].Pos.set(V.Pos.x+500, V.Pos.y +250);
    Missile[0].Vst.set(0, 0);
  }
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
    IA.VIA.mousePressed();
    Viser = IA.VIA.ArrivMissile();
    if (Viser<=7 && Missile[0].Pos.x == V.Pos.x+500) {
      Missile[0].Vst.set(PVector.sub(IA.VIA.AvPos(Viser), Missile[0].Pos).add(IA.VIA.Salle[Viser].Long/2, IA.VIA.Salle[Viser].Larg/2).setMag(15));
      //Missile[0].Vst.x = Missile[0].Vst.x);
    }
    if (IA.VIA.PV<=0) {
      E.mousePressed();
    }
  }
  Boutique[0].mousePressed();
}
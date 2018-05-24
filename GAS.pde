/********************************************************************************************************* //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>//
 Titre du Programme : Gestion d'Attaque Spatiale (GAS)
 **********************************************************************************************************
 Date de création du programme : 23/01/2018
 **********************************************************************************************************
 Auteurs : Berenger Florian, Said Djambae
 
 Lycée : Pierre Termier
 **********************************************************************************************************
 Commentaire : R.A.S.
 *********************************************************************************************************/

Menu M; // Objet Menu  //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>//

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

char KEY ='0';
int[] F = new int[51];
int Viser;
int  LO =0;
boolean Foi = false;


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
  Boutique[0] = new Bouton(width -200, height - 70, 180, 70, 0);
  Boutique[0].Def_Ch(" La cosmo boutique " ); 
  Boutique[0].C_Rp = color(#BFB3B3);
  Missile[0] = new Etoiles(V.Pos.x+500, V.Pos.y +250, 1, true);
  Missile[1] = new Etoiles(IA.VIA.Pos.x-500, IA.VIA.Pos.y+250, 1, true);
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
    if (IA != null)
    {
      IA.draw();
    }
    dommage();
    reparer();
    recharger();
    combat();
    if (Boutique[0].Activ && IA==null) {
      E.draw();
    } else {
      Boutique[0].draw();
    }
    if (Missile[0].LO == true)
    {
      animBoomV();
      if (int((frameCount - F[13]) / (frameRate *10000)) >= 3)
      {
        Missile[0] = null;
        F[13]=frameCount;
      }
    }
    if (Missile[1].LO == true)
    {
      animBoomIA();
      if (int((frameCount - F[13]) / (frameRate *10000)) >= 3)
      {
        Missile[1] = null;
        F[14]=frameCount;
      }
    }
  }
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
  float tempx = mouseX-V.Pos.x;
  float tempy = mouseY-V.Pos.y;
  println(tempx+" "+tempy); 
  if (M.Aff) {
    M.mousePressed();
  } else {
    V.mousePressed();
    IA.VIA.mousePressed();
    Viser = IA.VIA.ArrivMissile();
    if (Viser<=7 && Missile[0].Pos.x == V.Pos.x+500) {
      Missile[0].Vst.set(PVector.sub(IA.VIA.AvPos(Viser), Missile[0].Pos).add(IA.VIA.Salle[Viser].Long/2, IA.VIA.Salle[Viser].Larg/2).setMag(5));
      //Missile[0].Vst.x = Missile[0].Vst.x);
    }
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
} // >=F[15] non utilisé
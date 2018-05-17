/*********************************************************************************************************
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

String NomVaisseau = "Utilisateur";
boolean Vaisseau_joueur=false;
int ms = millis();
int s = second();

void combat()
{
  while (Vaisseau_joueur==true || IA.EnVie==true)
  {
    if (Vaisseau.MR1Ter == true && Vaisseau.Tire1 == true && Vaisseau.NbMissile>=1)
    {
      Vaisseau.Tire1=false;
      Vaisseau.MR1Ter=false;
      animMiss ();
    }
    if (Vaisseau.MR2Ter == true && Vaisseau.Tire2 == true && Vaisseau.NbMissile>=1)
    {
      Vaisseau.Tire2=false;
      Vaisseau.MR2Ter=false;
      animMiss ();
    }
    if (IA.MR1Ter == true && IA.Tire1 == true)
    {
      IA.Tire1=false;
      IA.MR1Ter=false;
      animMiss ();
    }
    if (IA.MR2Ter == true && IA.Tire2 == true)
    {
      IA.Tire2=false;
      IA.MR2Ter=false;
      animMiss ();
    }
  }
  if (IA.PV <=0)
  {
    IA.EnVie=false;
    text("Etes-vous prêt à continuer ?", 700, 500);
    if (mousePressed==true && mouseX>=630 && mouseX<=680 && mouseY>=400 && mouseY<=450)
    {
      IA = new IA(9/10, 4/5);
      IA.NumEnnemi++;
    }
  }
  if (Vaisseau.PV <=0)
  {
    fill(#BE2292);
    textSize(28);
    text("Vous avez perdu", 700, 500);
  }
}

void animMiss ()
{  
  PImage imgMissile;
  boolean probM = false;
  int xposMissileinitiale, yposMissileinitiale, xposMissilefinale, yposMissilefinale;
  int ProbabM=int(random(100));

  if ((IA.MEequiper[0] == Missile.M[0][0]) || (IA.MEequiper[0] == Missile.M[1][0]))
  {
    ProbabM= M[0][0]/ProbabM;
    if (ProbabM <1)
    {
      ProbM=false;
    }
    imgMissile = loadImage("Missile0.PNG");
    xposMissileinitiale=800;
    yposMissileinitiale=800;
    if (ProbMissintercept >= Missile.M[0][0])
    {
      ProbM=true;
    }
    Vaisseau.NbBouclier--;
    Vaisseau.PV = Vaisseau.PV - M[0][1];
  }
  if ((IA.MEequiper[1] == Missile.M[1][0]) || (IA.MEequiper[1] == Missile.M[1][0]))
  {
    ProbabM= M[1][0]/ProbabM;
    if (ProbabM <1)
    {
      ProbM=false;
    }
    imgMissile = loadImage("Missile1.PNG");
    xposMissileinitiale=800;
    yposMissileinitiale=800;
    if (ProbMissintercept >= Missile.M[1][0])
    {
      ProbM=true;
    }
    Vaisseau.NbBouclier--;
    Vaisseau.PV = Vaisseau.PV - M[1][1];
  }
  if ((Vaisseau.MEequiper[0] == Missile.M[0][0]) || (Vaisseau.MEequiper[0] == Missile.M[1][0]))
  {
    ProbabM= M[0][0]/ProbabM;
    if (ProbabM <1)
    {
      ProbM=false;
    }
    imgMissile = loadImage("Missile0.PNG");
    xposMissileinitiale=800;
    yposMissileinitiale=800;
    if (ProbMissintercept >= Missile.M[0][0])
    {
      ProbM=true;
    }
    IA.NbBouclier--;
    Joueur.NbMissile--;
    IA.PV = IA.PV - M[0][1];
  }
  if ((Vaisseau.MEequiper[1] == Missile.M[1][0]) || (Vaisseau.MEequiper[1] == Missile.M[1][0]))
  {
    ProbabM= M[1][0]/ProbabM;
    if (ProbabM <1)
    {
      ProbM=false;
    }
    imgMissile = loadImage("Missile1.PNG");
    xposMissileinitiale=800;
    yposMissileinitiale=800;
    if (ProbMissintercept >= Missile.M[1][0])
    {
      ProbM=true;
    }
    IA.NbBouclier--;
    Joueur.NbMissile--;
    IA.PV = IA.PV - M[1][1];
  }
  Missile = new Missile(xposMissileinitiale, yposMissileinitiale);
  PVector TrajMiss = new PVector(xposMissileinitiale, yposMissileinitiale);
  PVector vitesse = new PVector(1.5, 2.1);
  TrajMiss.add(vitesse);
  image(Missile.Missile0, TrajMiss.x, TrajMiss.y, 30, 30);
  stroke(255);
  noFill();
  //int K= int(random(-50, 50))*s;
  //int V = 300*ms; // vitesse du missile
  //while (Missile.xposMissile > Vaisseau.x && Missile.xposMissile<Joueur.xpos && Missile.yposMissile<Joueur.ypos && Missile.xposMissile<Joueur.ypos) {
  //  image(Missile.Missile0, s, s, 30, 30);
  //  stroke(255);
  //  noFill();
  //}
}

void animBoom (probM=true)
{
  int p= millis() - ms;
  int ME1equipe=0, ME2equipe=0;
  if (Vaisseau.MEequiper[0] == Missile.M[0][0] || Vaisseau.MEequiper[1] == Missile.M[0][0] || IA.MEequiper[0] == Missile.M[0][0] || IA.MEequiper[1] == Missile.M[0][0])
  {
    copy(Missile.Missile0, 300*p/100, 0, 300, 300, 25, 50, 30, 30); //copy(image, sourceXdsImage, sourceYdsImage, dimSourceX, dimSourceY, posEcranX, posEcranY, tailleX, tailleY);
    stroke(255);
    noFill();
  }
  if (Vaisseau.MEequiper[0] == Missile.M[1][0] || Vaisseau.MEequiper[1] == Missile.M[1][0] || IA.MEequiper[0] == Missile.M[1][0] || IA.MEequiper[1] == Missile.M[1][0])
  {
    copy(Missile.Missile1, 300*p/100, 300, 300, 300, 25, 50, 30, 30); //copy(image, sourceXdsImage, sourceYdsImage, dimSourceX, dimSourceY, posEcranX, posEcranY, tailleX, tailleY);
    stroke(255);
    noFill();
  }
}

void rechargeJoueur()
{
  int q =second() - s;
  int JoNbBouclier = Joueur.Boucliermax;
  int IANbBouclier = IA.Boucliermax;
  int RBouclier = q;
  while (JoNbBouclier <= Joueur.Boucliermax) //a enlever le while
  {
    if (RBouclier == 6)
    {
      RBouclier=q-6;
    }
    JoNbBouclier++;
  }
  while (IANbBouclier <= IA.Boucliermax) //a enlever le while
  {
    if (RBouclier == 6)
    {
      RBouclier=q-6;
    }
    IANbBouclier++;
  }
  while (Joueur.MR1 <= Missile.[0][2])
  {
    
  }  
}

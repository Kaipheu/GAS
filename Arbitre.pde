int ms = millis();
int s = second();

void combat()
{
  while (V.PV >=0 || IA.PV >= 0)
  {
    if (V.MRTer[0]== true && V.ArrivMissile()<=7 && V.Missile.N>=1)
    {
      animMiss ();
      recharger ();
    }
    if (V.MRTer[0]== true && V.ArrivMissile<=7 && V.Missile.N>=1) 
    {
      animMiss ();
      recharger ();
    }
    if (IA.MRTer[0]== true && IA.Tire1 == true)
    {
      IA.Tire1=false;
      animMiss ();
      recharger ();
    }
    if (IA.MRTer[0]== true && IA.Tire2 == true)
    {
      IA.Tire2=false;
      animMiss ();
      recharger ();
    }
  }
  if (IA.PV <=0)
  {
    text("Etes-vous prêt à continuer ?", 700, 500);
    if (mousePressed==true && mouseX>=630 && mouseX<=680 && mouseY>=400 && mouseY<=450)
    {
      IA = new IA(9/10, 4/5);
      IA.NumEnnemi++;
    }
  }
  if (V.PV <=0)
  {
    fill(#BE2292);
    textSize(28);
    text("Vous avez perdu", 700, 500);
  }
}

void animMiss ()
{  
  PImage imgMissile;
  boolean ProbM = false;
  int xposMissileinitiale =0, yposMissileinitiale=0; //xposMissilefinale=0, yposMissilefinale=0;
  int ProbabM=int(random(100)), T=0, Viser=10;

  if ((IA.MEquiper[0] == Missile.M[0][0]) || (IA.MEquiper[0] == Missile.M[1][0]))
  {
    ProbabM= Missile.M[0][0]/ProbabM;
    if (ProbabM <1)
    {
      ProbM=false;
    }
    imgMissile = Tex.Ico[15];
    xposMissileinitiale=800;
    yposMissileinitiale=800;
    if (ProbabM >= Missile.M[0][0])
    {
      ProbM=true;
    }
    V.Bouclier.N--;
    V.PV = V.PV - Missile.M[0][1];
  }
  if ((IA.MEquiper[1] == Missile.M[0][0]) || (IA.MEquiper[1] == Missile.M[1][0]))
  {
    ProbabM= Missile.M[1][0]/ProbabM;
    if (ProbabM <1)
    {
      ProbM=false;
    }
    imgMissile = Tex.Ico[16];
    xposMissileinitiale=800;
    yposMissileinitiale=800;
    if (ProbabM >= Missile.M[1][0])
    {
      ProbM=true;
    }
    V.Bouclier.N--;
    V.PV = V.PV - Missile.M[1][1];
  }
  if ((V.MEquiper[0] == Missile.M[0][0]) || (V.MEquiper[0] == Missile.M[1][0]))
  {
    ProbabM= Missile.M[0][0]/ProbabM;
    if (ProbabM <1)
    {
      ProbM=false;
    }
    imgMissile = Tex.Ico[15];
    xposMissileinitiale=800;
    yposMissileinitiale=800;
    if (ProbabM >= Missile.M[0][0])
    {
      ProbM=true;
    }
    IA.NbBouclier--;
    V.Missile.N--;
    IA.PV = IA.PV - Missile.M[0][1];
  }
  if ((V.MEquiper[1] == Missile.M[0][0]) || (V.MEquiper[1] == Missile.M[1][0]))
  {
    ProbabM= Missile.M[1][0]/ProbabM;
    if (ProbabM <1)
    {
      ProbM=false;
    }
    imgMissile = Tex.Ico[16];
    xposMissileinitiale=800;
    yposMissileinitiale=800;
    if (ProbabM >= Missile.M[1][0])
    {
      ProbM=true;
    }
    IA.NbBouclier--;
    V.Missile.N--;
    IA.PV = IA.PV - Missile.M[1][1];
  }
  Missile = new Missile(xposMissileinitiale, yposMissileinitiale);
  PVector TrajMiss = new PVector(xposMissileinitiale, yposMissileinitiale, AvPos(V.ArrivMissile());
  PVector vitesse = new PVector((xposMissileinitiale - xposMissilefinale, yposMissileinitiale - yposMissilefinale);
  TrajMiss.add(vitesse);
  image(Tex.Ico[15], TrajMiss.x, TrajMiss.y, 30, 30);
  stroke(255);
  noFill();
  //int K= int(random(-50, 50))*s;
  //int V = 300*ms; // vitesse du missile
  //while (Missile.xposMissile > V.x && Missile.xposMissile<Joueur.xpos && Missile.yposMissile<Joueur.ypos && Missile.xposMissile<Joueur.ypos) {
  //  image(Tex.Ico[15], s, s, 30, 30);
  //  stroke(255);
  //  noFill();
  //}
}

void animBoom ()
{
  int p= frameCount;
  for (int i=0; i<=1; i++)
  {
    if (V.MEquiper[0] == Missile.M[i][0] || V.MEquiper[1] == Missile.M[i][0])
    {
      copy(Tex.Ico[14], 300*p/100, i*300, 300, 300, 25, 50, 30, 30); //copy(image, sourceXdsImage, sourceYdsImage, dimSourceX, dimSourceY, posEcranX, posEcranY, tailleX, tailleY);
      stroke(255);
      noFill();
      IA.Salle[AvPos(V.ArrivMissile()].PV = IA.Salle[AvPos(V.ArrivMissile()].PV - Missile.M[i][1];
    }
  }

  for (int i=0; i<=1; i++)
  {
    if (IA.MEquiper[0] == Missile.M[i][0] || IA.MEquiper[1] == Missile.M[i][0])
    {
      copy(Tex.Ico[14], 300*p/100, i*300, 300, 300, 25, 50, 30, 30); //copy(image, sourceXdsImage, sourceYdsImage, dimSourceX, dimSourceY, posEcranX, posEcranY, tailleX, tailleY);
      stroke(255);
      noFill();
      V.Salle[AvPos(IA.ArrivMissile()].PV = V.Salle[AvPos(IA.ArrivMissile()].PV - Missile.M[i][1];
    }
  }
}

void recharger()
{
  int q = frameCount;
  int r = frameCount;
  int l = frameCount;
  int RBouclier = q;
  int[] VMRe = new int[2];
  int[] IAMRe = new int[2];
  for (int i=0; i<=1; i++)
  {
    VMRe[i] = 0;
    IAMRe[i] = 0;
  }

  if (V.Bouclier.N <= V.Boucliermax)
  {
    q=0;
    if (RBouclier == 6)
    {
      RBouclier=q-6;
    }
    V.Bouclier.N++;
  }
  if (IA.Bouclier.N <= IA.Boucliermax)
  {
    q=0;
    if (RBouclier == 6)
    {
      RBouclier=q-6;
    }
    IA.Bouclier.N++;
  }
  for (int j=0; j<=1; j++)
  {
    for (int i=0; i<=1; i++)
    {
      if (VMRe[j] <= Missile.M[i][2] && V.MEquiper[i] == Missile.M[i][0])
      {
        l=0;
        if (VMRe[j] == Missile.M[i][2])
        {
          VMRe[j] = l - Missile.M[i][2];
          V.MRTer[j] = true;
        }
      }
    }
  }  
  for (int j=0; j<=1; j++)
  {
    for (int i=0; i<=1; i++)
    {
      if (IAMRe[j] <= Missile.M[i][2] && IA.MEquiper[i] == Missile.M[i][0])
      {
        r=0;
        if (IAMRe[j] == Missile.M[i][2])
        {
          IAMRe[j] = r - Missile.M[i][2];
          IA.MRTer[j] = true;
        }
      }
    }
  }
}

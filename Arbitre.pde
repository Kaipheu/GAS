int ms = millis();
int s = second();

void combat()
{
  while (V.PV >0 || IA.PV > 0)
  {
    if (V.MRTer[0]== true && IA.ArrivMissile()<=7 && V.Missile.N>=1)
    {
      animMiss ();
      recharger ();
    }
    if (V.MRTer[0]== true && IA.ArrivMissile()<=7 && V.Missile.N>=1) 
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
  PVector Pos = new PVector();
  Pos.set(V.AvPos(0));
  float xposMissilefinale = Pos.x;
  float yposMissilefinale = Pos.y;

  PImage imgMissile;
  imgMissile = Tex.Ico[15];
  boolean ProbM = false;
  float xposMissileinitiale =0, yposMissileinitiale=0;
  int ProbabM=int(random(100));

  if ((IA.MEquiper[0] == Missile.M[0][0]) || (IA.MEquiper[0] == Missile.M[1][0]))
  {
    ProbabM= Missile.M[0][0]/(ProbabM+1);
    if (ProbabM <1)
    {
      ProbM=false;
    }
    xposMissileinitiale=540;
    yposMissileinitiale =height/4 +120;
    if (ProbabM >= Missile.M[0][0])
    {
      ProbM=true;
    }
    V.Bouclier.N--;
    V.PV = V.PV - Missile.M[0][1];
  }
  if ((IA.MEquiper[1] == Missile.M[0][0]) || (IA.MEquiper[1] == Missile.M[1][0]))
  {
    ProbabM = Missile.M[1][0]/(ProbabM+1);
    if (ProbabM <1)
    {
      ProbM=false;
    }
    xposMissileinitiale=width - 540;
    yposMissileinitiale=height/4+380;
    if (ProbabM >= Missile.M[1][0])
    {
      ProbM=true;
    }
    V.Bouclier.N--;
    V.PV = V.PV - Missile.M[1][1];
    imgMissile = Tex.Ico[16];
  }
  if ((V.MEquiper[0] == Missile.M[0][0]) || (V.MEquiper[0] == Missile.M[1][0]))
  {
    ProbabM= Missile.M[0][0]/(ProbabM+1);
    if (ProbabM <1)
    {
      ProbM=false;
    }
    xposMissileinitiale=400;
    yposMissileinitiale=height/4+120;
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
    ProbabM= Missile.M[1][0]/(ProbabM+1);
    if (ProbabM <1)
    {
      ProbM=false;
    }
    xposMissileinitiale=400;
    yposMissileinitiale=height/4+380;
    if (ProbabM >= Missile.M[1][0])
    {
      ProbM=true;
    }
    IA.NbBouclier--;
    V.Missile.N--;
    IA.PV = IA.PV - Missile.M[1][1];
    imgMissile = Tex.Ico[16];
  }
  Missile = new Missile(xposMissileinitiale, yposMissileinitiale);
  PVector TrajMiss = new PVector(xposMissileinitiale, yposMissileinitiale);
  PVector vitesse = new PVector(xposMissileinitiale - xposMissilefinale, yposMissileinitiale - yposMissilefinale);
  TrajMiss.add(vitesse);
  image(imgMissile, TrajMiss.x, TrajMiss.y, 30, 30);
  stroke(255);
  noFill();

  if (ProbM == false)
  {
    animBoom();
  }
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
    if (V.MEquiper[0] == Missile.M[i][0])
    {
      copy(Tex.Ico[15+i], 300*p/100, i*300, 300, 300, 25, 50, 30, 30); //copy(image, sourceXdsImage, sourceYdsImage, dimSourceX, dimSourceY, posEcranX, posEcranY, tailleX, tailleY);
      stroke(255);
      noFill();
      IA.Salle[IA.ArrivMissile()].PV = IA.Salle[IA.ArrivMissile()].PV - Missile.M[i][1];
      IA.PV = IA.PV - Missile.M[i][1];
      //if (/*Homme est dans la salle*/)
      //{
      //  V.Homme.PV = V.Homme.PV - Missile.M[i][1];
      //}
    }
  }

  for (int i=0; i<=1; i++)
  {
    if (IA.MEquiper[1] == Missile.M[i][0])
    {
      copy(Tex.Ico[15+i], 300*p/100, i*300, 300, 300, 25, 50, 30, 30); //copy(image, sourceXdsImage, sourceYdsImage, dimSourceX, dimSourceY, posEcranX, posEcranY, tailleX, tailleY);
      stroke(255);
      noFill();
      V.Salle[V.ArrivMissile()].PV = V.Salle[V.ArrivMissile()].PV - Missile.M[i][1];
      V.PV = V.PV - Missile.M[i][1];
      //if (/*Homme est dans la salle*/)
      //{
      //  IA.Homme.PV = IA.Homme.PV - Missile.M[i][1];
      //}
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

  if (V.Bouclier.N <= V.Boucliermax && V.Salle[6].PV>0)
  {
    q=0;
    if (RBouclier == 6)
    {
      RBouclier=q-6;
    }
    V.Bouclier.N++;
  }
  if (IA.Bouclier.N <= IA.Boucliermax && IA.Salle[6].PV>0)
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

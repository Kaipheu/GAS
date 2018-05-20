int ms = millis();
int s = second();

void combat()
{
  while (V.Pv.N >0 || IA.PV > 0)
  {
    if (V.MRTer[0]== true && IA.VIA.ArrivMissile()<=7 && V.Missile.N>=1)
    {
      animMiss ();
      recharger ();
    }
    if (V.MRTer[0]== true && IA.VIA.ArrivMissile()<=7 && V.Missile.N>=1) 
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
  if (V.Pv.N <=0)
  {
    fill(#BE2292);
    textSize(35);
    text("Vous avez perdu ...", width/2, height/2);
  }
  if (IA.NumEnnemi ==10 )
  {
    fill(#BE2292);
    textSize(35);
    text("Vous avez réussi le jeu", width/2, height/2);
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

  if ((IA.MEquiper[0] == Miss.M[0][0]) || (IA.MEquiper[0] == Miss.M[1][0]))
  {
    ProbabM= Miss.M[0][0]/(ProbabM+1);
    if (ProbabM <1)
    {
      ProbM=false;
    }
    xposMissileinitiale=540;
    yposMissileinitiale =height/4 +120;
    if (ProbabM >= Miss.M[0][0])
    {
      ProbM=true;
    }
    V.Bouclier.N--;
    V.Pv.N = V.Pv.N - Miss.M[0][1];
  }
  if ((IA.MEquiper[1] == Miss.M[0][0]) || (IA.MEquiper[1] == Miss.M[1][0]))
  {
    ProbabM = Miss.M[1][0]/(ProbabM+1);
    if (ProbabM <1)
    {
      ProbM=false;
    }
    xposMissileinitiale=width - 540;
    yposMissileinitiale=height/4+380;
    if (ProbabM >= Miss.M[1][0])
    {
      ProbM=true;
    }
    V.Bouclier.N--;
    V.Pv.N = V.Pv.N - Miss.M[1][1];
    imgMissile = Tex.Ico[16];
  }
  if ((V.MEquiper[0] == Miss.M[0][0]) || (V.MEquiper[0] == Miss.M[1][0]))
  {
    ProbabM= Miss.M[0][0]/(ProbabM+1);
    if (ProbabM <1)
    {
      ProbM=false;
    }
    xposMissileinitiale=400;
    yposMissileinitiale=height/4+120;
    if (ProbabM >= Miss.M[0][0])
    {
      ProbM=true;
    }
    IA.NbBouclier--;
    V.Missile.N--;
    IA.PV = IA.PV - Miss.M[0][1];
  }
  if ((V.MEquiper[1] == Miss.M[0][0]) || (V.MEquiper[1] == Miss.M[1][0]))
  {
    ProbabM= Miss.M[1][0]/(ProbabM+1);
    if (ProbabM <1)
    {
      ProbM=false;
    }
    xposMissileinitiale=400;
    yposMissileinitiale=height/4+380;
    if (ProbabM >= Miss.M[1][0])
    {
      ProbM=true;
    }
    IA.NbBouclier--;
    V.Missile.N--;
    IA.PV = IA.PV - Miss.M[1][1];
    imgMissile = Tex.Ico[16];
  }
  if ((V.MEquiper[0] == 0) || (V.MEquiper[1] == 0) || (IA.MEquiper[0] == 0) || (IA.MEquiper[1] == 0))
  {
    ProbM=true;
  }
  if (ProbM == false)
  {
    PVector TrajMiss = new PVector(xposMissileinitiale, yposMissileinitiale);
    PVector vitesse = new PVector(xposMissileinitiale - xposMissilefinale, yposMissileinitiale - yposMissilefinale);
    TrajMiss.add(vitesse);
    image(imgMissile, TrajMiss.x, TrajMiss.y, 30, 30);
    stroke(255);
    noFill();
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
  int p = frameCount;
  for (int i=0; i<=1; i++)
  {
    if (V.MEquiper[0] == Miss.M[i][0] && IA.VIA.ArrivMissile()<=7)
    {
      copy(Tex.Ico[15+i], 300*p/100, i*300, 300, 300, 25, 50, 30, 30); //copy(image, sourceXdsImage, sourceYdsImage, dimSourceX, dimSourceY, posEcranX, posEcranY, tailleX, tailleY);
      stroke(255);
      noFill();
      IA.Salle[IA.VIA.ArrivMissile()].PV = IA.Salle[IA.VIA.ArrivMissile()].PV - Miss.M[i][1];
      IA.PV = IA.PV - Miss.M[i][1];
      //if (/*Homme est dans la salle*/)
      //{
      //  V.Homme.PV = V.Homme.PV - Missile.M[i][1];
      //}
    }
  }

  for (int i=0; i<=1; i++)
  {
    if (IA.MEquiper[1] == Miss.M[i][0] && V.ArrivMissile()<=7)
    {
      copy(Tex.Ico[15+i], 300*p/100, i*300, 300, 300, 25, 50, 30, 30); //copy(image, sourceXdsImage, sourceYdsImage, dimSourceX, dimSourceY, posEcranX, posEcranY, tailleX, tailleY);
      stroke(255);
      noFill();
      V.Salle[V.ArrivMissile()].PV = V.Salle[V.ArrivMissile()].PV - Miss.M[i][1];
      V.Pv.N = V.Pv.N - Miss.M[i][1];
      //if (/*Homme est dans la salle*/)
      //{
      //  IA.Homme.PV = IA.Homme.PV - Missile.M[i][1];
      //}
    }
  }
}


void dommage()
{
  int o = frameCount;
  int p = frameCount;
  if (V.Salle[0].PV<=0)
  {
    V.Salle[0].PV=0;
    V.Oxy.N = V.Oxy.N - (p/1000);
    if (V.Oxy.N==0)
    {
      p=0;
      //V.Homme.PV = V.Homme.PV - (o/600);
    }
  }

  if (V.Salle[2].PV<=0)
  {
    V.Salle[2].PV=0;
    V.Missile.N = int(random((V.Missile.N + V.Carbu.N)/2));
    V.Carbu.N = int(random((V.Missile.N + V.Carbu.N)/2));
  }

  if (V.Salle[3].PV<=0)
  {
    V.Salle[3].PV=0;
    //V.Homme.PV = V.Homme.PV + (o/600)) sui sont dans la salle
  }

  if (V.Salle[4].PV<=0)
  {
    V.Salle[4].PV=0;
    if (V.Equi[0].N <= 0)
    {
      fill(#BE2292);
      textSize(35);
      text("Vous avez perdu", width/2, height/2);
    }
  }

  if (V.Salle[5].PV<=0)
  {
    V.Salle[5].PV=0;
  }

  if (V.Salle[6].PV<=0)
  {
    V.Salle[6].PV=0;
  }
if (V.Equi[0].N >= 0)
    {
      fill(#BE2292);
      textSize(35);
      text("Vous avez perdu ... ", width/2, height/2-150);
      text("Vous n'avez plus d'homme!", width/2, height/2+150);
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
  if (V.Salle[6].PV>0)
  {
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
  }

  if (V.Salle[5].PV>0)
  {
    for (int j=0; j<=1; j++)
    {
      for (int i=0; i<=1; i++)
      {
        if (VMRe[j] <= Miss.M[i][2] && V.MEquiper[i] == Miss.M[i][0])
        {
          l=0;
          if (VMRe[j] == Miss.M[i][2])
          {
            VMRe[j] = l - Miss.M[i][2];
            V.MRTer[j] = true;
          }
        }
      }
    }  
    for (int j=0; j<=1; j++)
    {
      for (int i=0; i<=1; i++)
      {
        if (IAMRe[j] <= Miss.M[i][2] && IA.MEquiper[i] == Miss.M[i][0])
        {
          r=0;
          if (IAMRe[j] == Miss.M[i][2])
          {
            IAMRe[j] = r - Miss.M[i][2];
            IA.MRTer[j] = true;
          }
        }
      }
    }
  }
}

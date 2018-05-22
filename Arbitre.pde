int ms = millis();
int s = second();

void combat()
{
  if ((V.Pv.N >0) || (IA.PV > 0))
  {
    if ((V.MRTer[0]== true) && (IA.VIA.ArrivMissile()<=7) && (V.Missile.N>=1))
    {
      animMiss ();
    }
    if ((V.MRTer[1]== true) && (IA.VIA.ArrivMissile()<=7) && (V.Missile.N>=1))
    {
      animMiss ();
    }
    if ((IA.MRTer[0]== true) && (IA.Tire1 == true))
    {
      IA.Tire1=false;
      animMiss ();
    }
    if ((IA.MRTer[1]== true) && (IA.Tire2 == true))
    {
      IA.Tire2=false;
      animMiss ();
    }
  }
  if (IA.VIA.PV <=0)
  {
    fill(#BE2292);
    textSize(35);
    text("Vous avez réussi le niveau n°" + str(IA.NumEnnemi), width/2, height/8);

    IA = null;
    //Fen.InitBouton(0, width -200, height - 70, 180, 70);               // bouton pour accéder à l'échange
    //Fen.InitBouton(14, width -200, height - 140, 180, 70);             // bouton pour continuer le jeu
    //Fen.B[0].Def_Ch(" La cosmo boutique " );
    //Fen.B[14].Def_Ch(" Passer au niveau suivant ");    
    //Fen.B[0].C_Rp = color(#BFB3B3);
    //Fen.B[14].C_Rp = color(#BFB3B3);
  }
  if (V.PV <=0)
  {
    fill(#BE2292);
    textSize(35);
    text("Vous avez perdu ...", width/2, height/2);
    exit();
  }
  if (IA.NumEnnemi == 10 )
  {
    fill(#BE2292);
    textSize(35);
    text("Vous avez réussi le jeu", width/2, height/2);
    exit();
  }
}


void animMiss () { 
  PVector Pos = new PVector();
  Pos.set(V.AvPos(0));

  PImage imgMissile;
  imgMissile = Tex.Ico[15];
  boolean ProbM = false;
  float xposMissileinitiale =0, yposMissileinitiale=0;
  int ProbabM=int(random(100));

  for (int i=0; i<=1; i++)
  {
    if (IA.MEquiper[0] == Miss.M[i][0])
    {
      ProbabM = Miss.M[i][0]/(ProbabM+1);
      if (ProbabM <1)
      {
        ProbM=false;
      }
      xposMissileinitiale=540;
      yposMissileinitiale =height/4 +120;
      if (ProbabM >= Miss.M[i][0])
      {
        ProbM=true;
      }
    }
    if (i ==1)
    {

      imgMissile = Tex.Ico[16];
    }
  }
  for (int j=0; j<=1; j++)
  {
    if (V.MEquiper[0] == Miss.M[j][0])
    {
      ProbabM= Miss.M[j][0]/(ProbabM+1);
      if (ProbabM <1)
      {
        ProbM=false;
      }
      xposMissileinitiale=400;
      yposMissileinitiale=height/4+120;
      if (ProbabM >= Miss.M[j][0])
      {
        ProbM=true;
      }
    }
    if (j ==1)
    {

      imgMissile = Tex.Ico[16];
    }
  }
  if (ProbM == false)
  {
    LO++; // vitesse du missile
    PVector TrajMiss = new PVector(abs(xposMissileinitiale - Pos.x), abs(yposMissileinitiale - Pos.y));  //vecteur Missile
    TrajMiss.setMag (LO);
    image(imgMissile, TrajMiss.x, TrajMiss.y, 50, 50);
    stroke(255);
    noFill();
    animBoom();
  }
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
      IA.VIA.Bouclier.N--;
      V.Missile.N--;
      IA.PV = IA.PV - Miss.M[i][1];
      if (IA.VIA.ArrivMissile()== i)  //changer
      {
        //V.Equi.N = V.Equi.N - Missile.M[i][1];
      }
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
      int q = frameCount;
      for (int j=6; j<=13; j++) {
        if (V.Equi.N >=0 && V.Michel.Salle == j)
        {
          if (q == 8)
          {
            V.Salle[-6].PV++;
          }
        }
      }
    }
      V.Bouclier.N--;
      V.Pv.N = V.Pv.N - Miss.M[i][1];
    }
}


void dommage()
{
  if (V.Salle[0].PV<=0)
  {
    V.Salle[0].PV=0;
    V.Oxy.N = V.Oxy.N - int((frameCount-F[0])/(frameRate*10));
    if (V.Oxy.N==0)
    {
      F[0]=frameCount;
      V.Equi.N = 0;
    }
  }
  if (V.Salle[1].PV<=0)
  {
    V.Salle[1].PV=0;
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
  }

  if (V.Salle[4].PV<=0)
  {
    V.Salle[4].PV=0;
    if (V.Equi.N <= 0)
    {
      //fill(#BE2292);
      //textSize(35);
      //text("Vous avez perdu", width/2, height/2);
      //exit();
    }
  }
  for (int i=5; i<=7; i++)
  {
    if (V.Salle[i].PV<=0)
    {
      V.Salle[i].PV=0;
    }
  }
  //if (V.Equi.N <= 0)
  //{
  //  fill(#BE2292);
  //  textSize(35);
  //  text("Vous avez perdu ... ", width/2, height/2-150);          //problème
  //  text("Vous n'avez plus d'homme!", width/2, height/2+150);
  // // exit();
  //}

  if (IA.VIA.Salle[0].PV<=0)
  {
    IA.VIA.Salle[0].PV=0;
    IA.Oxy.N = IA.Oxy.N - int((frameCount-F[1])/(frameRate*10));
    if (IA.Oxy.N==0)
    {
      F[1]=frameCount;
      IA.Equi.N = 0;
    }
  }
  for (int i=2; i<=7; i++)
  {
    if (IA.VIA.Salle[i].PV<=0)
    {
      IA.VIA.Salle[i].PV=0;
    }
  }
}


void reparer()
{
  for (int i=6; i<=13; i++) {
    if (V.Equi.N >=0 && V.Michel.Salle == i)
    {
      if (F[2] == 8)
      {
        F[2]=frameCount;
        V.Salle[i-6].PV++;
      }
    }
  }

  if (IA.VIA.Salle[2].PV <= IA.VIA.Salle[2].PVMax || IA.VIA.Salle[5].PV <= IA.VIA.Salle[5].PVMax || IA.VIA.Salle[6].PV <= IA.VIA.Salle[6].PVMax)  //salle qui nécessite des réparations
  {
      //if (IA.VIA.Salle[2] = 8*int((frameCount-F[6])/( frameRate)))
      //{
        
      //}
  } else if (IA.VIA.Salle[0].PV <= IA.VIA.Salle[0].PVMax || IA.VIA.Salle[3].PV <= IA.VIA.Salle[3].PVMax) {
    //Homme va en direction de la salle
  } else if (IA.VIA.Salle[1].PV <= IA.VIA.Salle[1].PVMax || IA.VIA.Salle[4].PV <= IA.VIA.Salle[4].PVMax || IA.VIA.Salle[7].PV <= IA.VIA.Salle[7].PVMax) {
    //Homme va en direction de la salle
  }
}


void recharger()
{
  int RBouclier = 6*int((frameCount-F[6])/( frameRate));
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
      F[3]=0;
      if (RBouclier == 6)
      {
        RBouclier=F[3]-6;
        F[3]=frameCount;
      }
      V.Bouclier.N++;
    }
    if (IA.VIA.Bouclier.N <= IA.Boucliermax && IA.VIA.Salle[6].PV>0)
    {
      F[4]=0;
      if (RBouclier == 6)
      {
        RBouclier=F[3]-6;
        F[3] = frameCount;
      }
      IA.VIA.Bouclier.N++;
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
          F[4]=0;
          if (VMRe[j] == Miss.M[i][2])
          {
            VMRe[j] = F[4] - Miss.M[i][2];
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
          F[5]=0;
          if (IAMRe[j] == Miss.M[i][2])
          {
            IAMRe[j] = F[5] - Miss.M[i][2];
            IA.MRTer[j] = true;
          }
        }
      }
    }
  }
}
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

  //if (IA.VIA.Salle[0].PV<=0)
  //{
  //  IA.VIA.Salle[0].PV=0;
  //  IA.Oxy.N = IA.Oxy.N - int((frameCount-F[1])/(frameRate*10));
  //  if (IA.Oxy.N==0)
  //  {
  //    F[1]=frameCount;
  //    IA.Equi.N = 0;
  //  }
  //}
  for (int i=2; i<=7; i++)
  {
    //if (IA.VIA.Salle[i].PV<=0)
    //{
    //  IA.VIA.Salle[i].PV=0;
    //}
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
      if (RBouclier == 6)
      {
        RBouclier=F[3]-6;
        F[4] = frameCount;
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

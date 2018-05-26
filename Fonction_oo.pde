void dommage()
{
  if (V.Salle[0].PV<=0) {
    V.Salle[0].PV=0;
    V.Oxy.N = V.Oxy.N - int((frameCount - F[0])/(frameRate*10));
    if (V.Oxy.N==0) {
      F[0]=frameCount;
      V.Equi.N = 0;
    }
  }
  if (V.Salle[1].PV<=0) {
    V.Salle[1].PV=0;
  }

  if (V.Salle[2].PV<=0) {
    V.Salle[2].PV=0;
    V.Missile.N = int(random((V.Missile.N + V.Carbu.N)/2));
    V.Carbu.N = int(random((V.Missile.N + V.Carbu.N)/2));
  }

  for (int i=3; i<=7; i++) {
    if (V.Salle[i].PV<=0) {
      V.Salle[i].PV=0;
    }
  }
  if (V.Equi.N <= 0) {
    fill(#BE2292);
    textSize(35);
    text("Vous avez perdu ... ", width/2, height/2-150);          //problème
    text("Vous n'avez plus d'homme!", width/2, height/2+150);
    // exit();
  }

  if (IA.VIA.Salle[0].PV<=0)
  {
    IA.VIA.Salle[0].PV=0;
    IA.VIA.Oxy -= int((frameCount - F[1])/(frameRate*10));
    if (IA.VIA.Oxy==0) {
      F[1]=frameCount;
      IA.VIA.Equi.N = 0;
    }
  }
  for (int i=2; i<=7; i++) {
    if (IA.VIA.Salle[i].PV<=0) {
      IA.VIA.Salle[i].PV=0;
    }
  }
}


void reparer()
{
  for (int i=0; i<=7; i++) {
    if (V.Equi.N >=0 && V.Michel.Salle == i) {
      if (((frameCount - F[2]) / (frameRate)) == 8) {
        F[2]=frameCount;
        V.Salle[i].PV++;
      }
    }
  }

  if (IA.VIA.Salle[2].PV <= IA.VIA.Salle[2].PVMax || IA.VIA.Salle[5].PV <= IA.VIA.Salle[5].PVMax || IA.VIA.Salle[6].PV <= IA.VIA.Salle[6].PVMax)  //salle qui nécessite des réparations
  {
    if (((frameCount - F[2]) / (frameRate)) >= 8) {
      F[2]=frameCount;
      V.Salle[2].PV++;
    } else if (((frameCount - F[2]) / (frameRate)) >= 8) {
      F[2]=frameCount;
      V.Salle[5].PV++;
    } else if (((frameCount - F[2]) / (frameRate)) >= 8) {
      F[2]=frameCount;
      V.Salle[6].PV++;
    }
  } else if (IA.VIA.Salle[0].PV <= IA.VIA.Salle[0].PVMax || IA.VIA.Salle[3].PV <= IA.VIA.Salle[3].PVMax) {
    if (((frameCount - F[2]) / (frameRate)) >= 8) {
      F[2]=frameCount;
      V.Salle[0].PV++;
    } else if (((frameCount - F[2]) / (frameRate)) >= 8) {
      F[2]=frameCount;
      V.Salle[3].PV++;
    }
  } else if (IA.VIA.Salle[1].PV <= IA.VIA.Salle[1].PVMax || IA.VIA.Salle[4].PV <= IA.VIA.Salle[4].PVMax || IA.VIA.Salle[7].PV <= IA.VIA.Salle[7].PVMax) {
    if (((frameCount - F[2]) / (frameRate)) >= 8) {
      F[1]=frameCount;
      V.Salle[2].PV++;
    } else if (((frameCount - F[2]) / (frameRate)) >= 8) {
      F[4]=frameCount;
      V.Salle[5].PV++;
    } else if (((frameCount - F[2]) / (frameRate)) >= 8) {
      F[7]=frameCount;
      V.Salle[2].PV++;
    }
  }
}


void recharger()
{
  int VMRe=0, IAMRe=0;
  if (V.Salle[6].PV>0) {
    if (V.Bouclier.N <= V.Boucliermax && V.Salle[6].PV>0) {
      F[3]=0;
      if ((frameCount - F[3])/( frameRate) == 6) {
        F[3]=frameCount;
      }
      V.Bouclier.N++;
    }
    if (IA.VIA.Bouclier.N <= IA.Boucliermax && IA.VIA.Salle[6].PV>0) {
      if ((frameCount - F[4])/( frameRate) == 6) {
        F[4] = frameCount;
      }
      IA.VIA.Bouclier.N++;
    }
  }

  for (int i=0; i<=1; i++) {
    if (VMRe <= Miss.M[i][2] && V.MEquiper == Miss.M[i][0]) {
      VMRe = int((frameCount - F[4]) / (frameRate)) - Miss.M[i][2];
      if (F[4] == Miss.M[i][2]) {
        F[4]=frameCount;
      }
      V.MRTer = true;
    }
  }  
  for (int i=0; i<=1; i++) {
    if (IAMRe >= Miss.M[i][2] && IA.MEquiper == Miss.M[i][0]) {
      IAMRe = int((frameCount - F[11]) / (frameRate)) - Miss.M[i][2];
      F[11]=frameCount;
      IA.MRTer = true;
    }
  }
}


void actionIA()
{
  if (((frameCount - F[7])/( frameRate))>=Miss.M[0][2]) {
    IA.Tir=true;
    F[7]=frameCount;
  }

  for (int i =0; i<7; i++) {     //salle de préférence à viser
    if ((V.Salle[i+1].PV <= V.Salle[i].PVMax) && (IA.P[i+1] >= IA.P[i])) {
      IA.P[i] = IA.P[i+1];
    }
  }
}
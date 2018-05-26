void animBoomV ()
{
    copy(Tex.Ico[14], 300*int(15*((frameCount - F[11]) / (frameRate))), IExplo*300, 300, 300, int(Missile[0].Pos.x), int(Missile[0].Pos.y), 30, 30);   
    stroke(255);
    noFill();
    if (IA.VIA.Bouclier.N>0) {
      IA.VIA.Bouclier.N--;
    } else if (IA.VIA.Bouclier.N<=0) {
      IA.VIA.Salle[Viser].PV = IA.VIA.Salle[Viser].PV - Miss.M[0][1];     //ArrayIndexOutOFBoundsException : 9
      IA.VIA.PV = IA.VIA.PV - Miss.M[0][1];
      V.Missile.N--;
    }
    if (V.Michel.Salle(Viser)) {
      V.Equi.N = V.Equi.N - Miss.M[1][1];
      for (int j=0; j<=7; j++) {
        if (IA.VIA.Equi.N >=0 && IA.VIA.Michel.Salle == j) {
          IA.VIA.Salle[j].PV++;
        }
      }
    }
    if (300*int(15*((frameCount - F[11]) / (frameRate)))>=3000)
    {
      Missile[0].AnimVisible =false;
    }
}

void animBoomIA ()
{
    copy(Tex.Ico[14], 300*int(15*((frameCount - F[12]) / (frameRate))), IExplo*300, 300, 300, int(Missile[0].Pos.x), int(Missile[0].Pos.y), 50, 50); 
    stroke(255);
    noFill();       
    Missile[1].AnimVisible =false;
    if (IA.VIA.Bouclier.N>0) {
    V.Bouclier.N--;
  } else if (IA.VIA.Bouclier.N<=0) {
    V.Salle[Viser].PV = V.Salle[Viser].PV - Miss.M[IExplo][1];     //ArrayIndexOutOFBoundsException : 9
    V.Pv.N = V.Pv.N - Miss.M[IExplo][1];
  }
  for (int j=0; j<=7; j++) {
    if (V.Equi.N >=0 && V.Michel.Salle == j) {
      V.Salle[j].PV++;
    }
  }
  V.Bouclier.N--;
  V.Pv.N = V.Pv.N - Miss.M[IExplo][1];
    if (300*int(15*((frameCount - F[12]) / (frameRate)))>=3000)
    {
      Missile[1].AnimVisible =false;
    }
}

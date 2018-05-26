void animBoomV ()
{
  imageMode(CENTER);
  println("F11 "+F[11]+" FramC "+frameCount);
  println(int(((frameCount - F[11]) / (frameRate))));
    copy(Tex.Ico[14], 24*int(15*((frameCount - F[11]) / (frameRate))), IExplo*300, 300, 300, int(IA.VIA.AvPos(Viser).x), int(IA.VIA.AvPos(Viser).y), 100, 100);   
    stroke(255);
    noFill();
    //Missile[0].AnimVisible =false;              //la visibilité de l'animation est maintenant terminé
    if (IA.VIA.Bouclier.N>0) {
      IA.VIA.Bouclier.N--;
    } else if (IA.VIA.Bouclier.N<=0) {
      IA.VIA.Salle[Viser].PV = IA.VIA.Salle[Viser].PV - Miss.M[0][1];     //ArrayIndexOutOFBoundsException : 9
      IA.VIA.PV = IA.VIA.PV - Miss.M[0][1];
    }
    if (V.Michel.Salle(Viser)) {
      V.Equi.N = V.Equi.N - Miss.M[1][1];
      for (int j=0; j<=7; j++) {
        if (IA.VIA.Equi.N >=0 && IA.VIA.Michel.Salle == j) {
          IA.VIA.Salle[j].PV++;
        }
      }
    }
}

void animBoomIA ()
{
  imageMode(CENTER);
    copy(Tex.Ico[14], 300*int((frameCount - F[12]) / (frameRate *10000)), IExplo*300, 300, 300, int( Missile[0].Pos.x), int( Missile[0].Pos.y), 30, 30); //copy(image, sourceXdsImage, sourceYdsImage, dimSourceX, dimSourceY, posEcranX, posEcranY, tailleX, tailleY);
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
}
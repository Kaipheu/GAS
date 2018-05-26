void animBoomV()
{      //used to show explosion animation by Vaisseau
  if (EExplosion[0]<300) {     //draw correct sprite in function of animation state
    copy(Tex.Ico[14], 300, 300, IExplo*300, 300, int(Missile[0].Pos.x), int(Missile[0].Pos.y), 30, 30);  //first srpite
  } else if (EExplosion[0]>= 300 && EExplosion[0]<600) {
    copy(Tex.Ico[14], 600, 300, IExplo*300, 300, int(Missile[0].Pos.x), int(Missile[0].Pos.y), 30, 30);      //second sprite
  } else if (EExplosion[0]>= 600 && EExplosion[0]<900) {
    copy(Tex.Ico[14], 900, 300, IExplo*300, 300, int(Missile[0].Pos.x), int(Missile[0].Pos.y), 30, 30);      //third sprite
  } else if (EExplosion[0]>= 900 && EExplosion[0]<1200) {
    copy(Tex.Ico[14], 1200, 300, IExplo*300, 300, int(Missile[0].Pos.x), int(Missile[0].Pos.y), 30, 30);     //fourth sprite
  } else if (EExplosion[0]>= 1200 && EExplosion[0]<1500) {
    copy(Tex.Ico[14], 1500, 300, IExplo*300, 300, int(Missile[0].Pos.x), int(Missile[0].Pos.y), 30, 30);     //fith sprite
  } else if (EExplosion[0]>= 1500 && EExplosion[0]<1800) {
    copy(Tex.Ico[14], 1800, 300, IExplo*300, 300, int(Missile[0].Pos.x), int(Missile[0].Pos.y), 30, 30);     //sixth sprite
  } else if (EExplosion[0]>= 1800 && EExplosion[0]<2100) {
    copy(Tex.Ico[14], 2100, 300, IExplo*300, 300, int(Missile[0].Pos.x), int(Missile[0].Pos.y), 30, 30);     //seventh sprite
  } else if (EExplosion[0]>= 2100 && EExplosion[0]<2400) {
    copy(Tex.Ico[14], 2400, 300, IExplo*300, 300, int(Missile[0].Pos.x), int(Missile[0].Pos.y), 30, 30);     //eight sprite
  } else if (EExplosion[0]>= 2400 && EExplosion[0]<2700) {
    copy(Tex.Ico[14], 2700, 300, IExplo*300, 300, int(Missile[0].Pos.x), int(Missile[0].Pos.y), 30, 30);     //nineth sprite
  } else if (EExplosion[0]>= 2700 && EExplosion[0]<3000) {
    copy(Tex.Ico[14], 3000, 300, IExplo*300, 300, int(Missile[0].Pos.x), int(Missile[0].Pos.y), 30, 30);     //tenth sprite
  }

  if (EExplosion[0]>=3000) {        //si l'animation est terminé
    Missile[0].AnimVisible =false;              //la visibilité de l'animation est maintenant terminé
    EExplosion[0]=-1;    //reset animation
    IA.VIA.Bouclier.N--;
    if (IA.VIA.Bouclier.N < 0) {
      IA.VIA.Salle[Viser].PV = IA.VIA.Salle[Viser].PV - Miss.M[0][1];     //ArrayIndexOutOFBoundsException : 9
      IA.VIA.PV = IA.VIA.PV - Miss.M[0][1];
      IA.VIA.PV=0;
    } else if (IA.VIA.Bouclier.N>=0) {
      IA.VIA.Bouclier.N--;
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
}


void animBoomIA() //pareil pour l'IA
{
  if (EExplosion[1]<300) {   
    copy(Tex.Ico[14], 300, 300, IExplo*300, 300, int(Missile[1].Pos.x), int(Missile[1].Pos.y), 30, 30);
  } else if (EExplosion[1]>= 300 && EExplosion[1]<600) {
    copy(Tex.Ico[14], 600, 300, IExplo*300, 300, int(Missile[1].Pos.x), int(Missile[1].Pos.y), 30, 30);
  } else if (EExplosion[1]>= 600 && EExplosion[1]<900) {
    copy(Tex.Ico[14], 900, 300, IExplo*300, 300, int(Missile[1].Pos.x), int(Missile[1].Pos.y), 30, 30);
  } else if (EExplosion[1]>= 900 && EExplosion[1]<1200) {
    copy(Tex.Ico[14], 1200, 300, IExplo*300, 300, int(Missile[1].Pos.x), int(Missile[1].Pos.y), 30, 30);
  } else if (EExplosion[1]>= 1200 && EExplosion[1]<1500) {
    copy(Tex.Ico[14], 1500, 300, IExplo*300, 300, int(Missile[1].Pos.x), int(Missile[1].Pos.y), 30, 30);
  } else if (EExplosion[1]>= 1500 && EExplosion[1]<1800) {
    copy(Tex.Ico[14], 1800, 300, IExplo*300, 300, int(Missile[1].Pos.x), int(Missile[1].Pos.y), 30, 30);
  } else if (EExplosion[1]>= 1800 && EExplosion[1]<2100) {
    copy(Tex.Ico[14], 2100, 300, IExplo*300, 300, int(Missile[1].Pos.x), int(Missile[1].Pos.y), 30, 30);
  } else if (EExplosion[1]>= 2100 && EExplosion[1]<2400) {
    copy(Tex.Ico[14], 2400, 300, IExplo*300, 300, int(Missile[1].Pos.x), int(Missile[1].Pos.y), 30, 30);
  } else if (EExplosion[1]>= 2400 && EExplosion[1]<2700) {
    copy(Tex.Ico[14], 2700, 300, IExplo*300, 300, int(Missile[1].Pos.x), int(Missile[1].Pos.y), 30, 30);
  } else if (EExplosion[1]>= 2700 && EExplosion[1]<3000) {
    copy(Tex.Ico[14], 3000, 300, IExplo*300, 300, int(Missile[1].Pos.x), int(Missile[1].Pos.y), 30, 30);
  }
  EExplosion[1] = EExplosion[1] + 120; 
  if (EExplosion[1]>=3000) {       
    Missile[1].AnimVisible =false;
    V.Bouclier.N--;
  } else if (IA.VIA.Bouclier.N<0) {
    V.Salle[Viser].PV = V.Salle[Viser].PV - Miss.M[IExplo][1];     //ArrayIndexOutOFBoundsException : 9
    V.Pv.N = V.Pv.N - Miss.M[IExplo][1];
    V.PV=0;
  }

  for (int j=0; j<=7; j++) {
    if (V.Equi.N >=0 && V.Michel.Salle == j) {
      V.Salle[j].PV++;
    }
  }

  V.Bouclier.N--;
  V.Pv.N = V.Pv.N - Miss.M[IExplo][1];
}

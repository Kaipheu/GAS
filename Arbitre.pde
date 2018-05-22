void combat()
{                                                                                               // && IA.VIA.PV<=0
  if ((V.Pv.N >0) || (IA.PV > 0))
  {
    PVector Pos = new PVector();
    Pos.set(V.AvPos(0));
    PImage imgMissile;
    imgMissile = Tex.Ico[15];
    boolean ProbM = false;
    int ProbabM=int(random(100));
    PVector PosMissEn1 = new PVector();
    for (int j=0; j<=1; j++)
    {
      for (int i=0; i<=1; i++)
      {
        if ((IA.MEquiper[j] == Miss.M[i][0]) && (IA.MRTer[i]== true) && (IA.Tir[i] == true))
        {
          ProbabM = Miss.M[i][0]/(ProbabM+1);
          if (ProbabM <1)
          {
            ProbM=false;
          }
          PosMissEn1.set(-409, 147*2.62*(i+1)).add(IA.VIA.Pos);
          if (ProbabM >= Miss.M[i][0])
          {
            ProbM=true;
            IA.Tir[i] =false;
          }
        }
        if (i ==1)
        {

          imgMissile = Tex.Ico[16];
        }
      }
    }
    for (int j=0; j<=1; j++)
    {
      for (int i=0; i<=1; i++)
      {
        if (V.MEquiper[j] == Miss.M[i][0])
        {
          ProbabM= Miss.M[i][0]/(ProbabM+1);
          if (ProbabM <1)
          {
            ProbM=false;
          }
          PosMissEn1.set(-409, 147*2.62*(i+1)).add(V.Pos);
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
    }
    if (ProbM == false)
    {
      T++;
      // vitesse du missile
      PVector Traj = new PVector();
      Traj = PosMissEn1.sub(Pos).setMag(T);
      ;
      image(imgMissile, Traj.x, Traj.y, 30, 30);
      stroke(255);
      noFill();
      animBoom();
    }
  }
  if (IA.PV <=0)
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
  if (IA.NumEnnemi == 11 )
  {
    fill(#BE2292);
    textSize(35);
    text("Vous avez réussi le jeu", width/2, height/2);
    exit();
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
        V.Equi.N = V.Equi.N - Miss.M[i][1];
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

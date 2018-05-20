class Echange {
  int Lune=0;
  int[][] D = new int[4][8];
  int[][] E = new int[4][8];
  int[][] C = new int[4][8];
  Fenetre Fen;
  PImage Image;

  //Homme
  //Ravitaillement : Missile, Carburant, PV
  //Arme : Coup par coup, rafale
  //Salle : Oxygene, Surveillance, Reserve, Hopital, Pilotage, Arme, Bouclier, Reacteur

  Echange() {
    D[1][2]= 30;        //nb max de dispositfs
    D[2][0]= 2;
    for (int i=0; i<=7; i++)
    {
      D[3][i]= 3;
    }
    E[2][0] = 1;
    for (int i=0; i<=7; i++)
    {
      E[3][i]= 3;
    }

    C[0][0]= int(random(5))+42;    //coût
    C[1][0]=  4;
    C[2][0] = 40;
    C[2][1] = 60;//voir classe missile
    C[3][0]= 15;

    Fen = new Fenetre(100, 100, 14, 14);
    Fen.Long= width -100;
    Fen.Larg = height -100;
    for (int i=0; i<=5; i++)
    {
      Fen.InitBouton(i, 200, i*100, 50, 50);
      if (i==5) { 
        for (int j=6; j<=13; j++) {
          Fen.InitBouton(j, j*150-500, i*100, 50, 50);
          Fen.B[j].Def_Ch(V.Salle[j-6].Nom + " "+ str(C[3][0]) + " Lunes");
          image(Tex.Ico[j-6], j*150-500, i*100, 50, 50);
        }
      }
    }
    Fen.B[0].Def_Ch("Hommes  : " + str(C[0][0]) + "  Lunes");                  //afficher le prix
    Fen.B[1].Def_Ch("Missile  : " + str(C[1][0]) + "  Lunes");
    Fen.B[2].Def_Ch("Carburant  : " + str(C[1][0]) + "  Lunes");
    Fen.B[3].Def_Ch("Points de Vie  : " + str(C[1][0]) + "  Lunes");
    Fen.B[4].Def_Ch("Arme tir coup par coup  : " + str(C[2][0]) + "  Lunes");
    Fen.B[5].Def_Ch("Arme tir en rafale  : " + str(C[2][1]) + " :  Lunes");
    for (int i=0; i<=13; i++)
    {
      Fen.B[i].C_Tx = color(255, 0, 0);
      Fen.B[i].C_Rp = color(122, 255, 50);
    }
  }

  void draw() {
    Fen.draw();
  }


  void mousePressed () {
    for (Bouton B : Fen.B) {
      if (mousePressed==true && mouseX>=630 && mouseX<=680 && mouseY>=400 && mouseY<=450)
      {
        fill (#BE2292);
        rect (300, 300, width-600, height-600);
        fill (#A8491F);
        text (" LA BOUTIQUE : Que voulez-vous acheter, étrangers ?", width/6, height-250);
        text ("Equipage :", width/12, height/10);
        if (Fen.B[0].Activ && Lune >= C[0][0] && E[0][0]<D[0][0])
        {
          Lune = Lune - C[0][0];
        }
        if (Fen.B[1].Aff && Lune>= C[1][0] && V.Missile.N<D[1][0] && (V.Missile.N + V.Carbu.N)<=30)
        {
          Lune = Lune - C[1][0];
          V.Missile.N++;
        }
        if (Fen.B[2].Activ && Lune>= C[1][1] && V.Carbu.N<D[1][1] && (V.Missile.N + V.Carbu.N)<=30)
        {
          Lune = Lune - C[1][1];
          V.Carbu.N++;
        }
        if (Fen.B[3].Activ && Lune>= C[1][2] && V.Pv.N<D[1][2] && V.Pv.N <= D[1][2])
        {
          Lune = Lune - C[1][2];
          V.Pv.N++;
        }
        if ((Fen.B[4].Activ && Lune>= C[2][0] && E[2][0]<D[2][0]))
        {
          Lune = Lune - C[2][0];
          V.MEquiper[1] = Miss.M[0][0];
        }
        if (Fen.B[5].Activ && Lune>= C[2][1] && E[2][1]<D[2][1])
        {
          Lune = Lune - C[2][1];
          V.MEquiper[1] = Miss.M[1][0];
        }
        for(int i=6; i<=13; i++) {
          if (Fen.B[i].Activ && E[3][i-6]<D[3][i-6])
          {
            Lune = Lune - C[3][0];
            C[3][0] = C[3][0] + 15;
            if (C[3][0] <= 15)
            {
              C[3][0] = C[3][0] - 15;
            }
            V.Salle[i-6].PV++;
          }
        }
      }
    }
  }

  void mouseReleased()
  {
    Fen.mouseReleased();
  }
}

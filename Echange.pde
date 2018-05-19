class Echange {
  int Lune=0;
  int[][] D = new int[4][8];
  int[][] E = new int[4][8];
  int[][] C = new int[4][8];
  Fenetre Fen;
  PImage Image;
  Bouton[] Bouton = new Bouton[14];
  //Homme
  //Ravitaillement : Missile, Carburant, PV
  //Arme :
  //Salle : Oxygene, Surveillance, Reserve, Hopital, Pilotage, Arme, Bouclier, Reacteur
  Echange() {

    D[0][0]= 6;                      //nb max de dispositfs
    D[1][2]= 30;
    D[2][0]= 5;
    D[3][0]= 3;
    D[3][1]= 3;
    D[3][2]= 3;
    D[3][3]= 3;
    D[3][4]= 3;
    D[3][5]= 4;
    D[3][6]= 3;
    D[3][7]= 22;

    E[0][0]= 2;
    E[1][0]= E[1][1]= 13;            //dispositifs au début du jeu
    E[1][2]= 20;
    E[2][0]= 1;
    E[3][0]= 1;
    E[3][1]= 1;
    E[3][2]= 1;
    E[3][3]= 1;
    E[3][4]= 1;
    E[3][5]= 2;
    E[3][6]= 1;
    E[3][7]= 10;

    C[0][0]= int(random(5))+42;    //coût
    C[1][0]= 4;
    //C[2][0] = voir classe missile
    C[3][0]= 15;

    Fen = new Fenetre(width/4, height/8, 13, 13);
    for (int i=0; i<=5; i++)
    {
      Fen.InitBouton(i, 200, 200+i*100, 50, 50);
      if (i==5) { 
        for (int j=6; j<=13; j++) {
          Fen.InitBouton(j, 100+j*100, 100+i*100, 50, 50);
          Fen.B[j].Def_Ch(V.Salle[j-6].Nom + str(C[0][0]));
          image(Tex.Ico[j-6], 100+j*100, 100+i*100, 50, 50);
        }
      }
    }
    Fen.B[0].Def_Ch("Hommes  :" + str(C[0][0])); //afficher le prix
    Fen.B[1].Def_Ch("Missile  :" + str(C[1][0]));
    Fen.B[2].Def_Ch("Carburant  :" + str(C[1][1]));
    Fen.B[3].Def_Ch("Points de Vie  :" + str(C[1][1]));
    Fen.B[4].Def_Ch("Arme tir coup par coup  :" + str(C[2][0]));
    Fen.B[5].Def_Ch("Arme tir en rafale  :" + str(C[2][0]));
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
        if (Fen.B[1].Aff && Lune>= C[1][0] && E[1][0]<D[1][0] && (V.Missile.N + V.Carbu.N)<=E[1][2])
        {
          Lune = Lune - C[1][0];
        }
        if (Fen.B[2].Activ && Lune>= C[1][1] && E[1][1]<D[1][1] && (V.Missile.N + V.Carbu.N)<=E[1][2])
        {
          Lune = Lune - C[1][1];
        }
        if (Fen.B[3].Activ && Lune>= C[1][2] && E[1][2]<D[1][2])
        {
          Lune = Lune - C[1][2];
        }
        if ((Fen.B[4].Activ && Lune>= Missile.M[0][4] && E[2][0]<D[2][0]))
        {
          Lune = Lune - Missile.M[0][4];
        }
        if (Fen.B[5].Activ && Lune>= Missile.M[1][3] && E[2][1]<D[2][1])
        {
          Lune = Lune - Missile.M[1][3];
        }
        if (Lune>= C[3][0] && ((Fen.B[6].Activ &&  E[3][0]<D[3][0]) || (Fen.B[7].Activ && E[3][1]<D[3][1]) || (Fen.B[8].Activ && E[3][2]<D[3][2]) || (Fen.B[9].Activ && Lune>= C[3][0])
          || (Fen.B[10].Activ && E[3][4]<D[3][4]) || (Fen.B[11].Activ && E[3][5]<D[3][5]) || (Fen.B[12].Activ && E[3][6]<D[3][6]) || (Fen.B[13].Activ && E[3][7]<D[3][7])))
        {
          Lune = Lune - C[3][0];
          C[3][0]= C[3][0] +15;
          if (C[3][0] <= 15)
          {
            C[3][0]= C[3][0] - 15;
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

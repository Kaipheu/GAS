class Echange {
  int Lune=0;
  int[][] D = new int[4][8];
  int[][] E = new int[4][8];
  int[][] C = new int[4][8];
  Fenetre Fen;
  PImage Image;
  //Bouton[] Bouton = new Bouton[13];
  //Homme
  //Ravitaillement : Missile, Carburant, PV
  //Arme
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

    C[0][0]= int(random(10))+42;    //coût
    C[1][0]= C[1][1]= 4;
    //C[1][2]= 3;
    C[3][0]=C[3][1]=C[3][2]=C[3][3]=C[3][4]=C[3][5]=C[3][6]=C[3][7]=15;
    Fen = new Fenetre(width/4, height/8, 13, 13);
    //Bouton[0] = new Bouton(200, 400, 200, 150, 0); //coordonnées long larg id
    for (int i=0; i<4; i++)
    {
      Fen.InitBouton(200, 400+i*150, 200, 150, 0);
      if (i==3) { 
        for (int j=3; j<12; j++) {
          Fen.InitBouton(200+200*j, 400+i*150, 200, 150, 0);
          Fen.B[2].Def_Ch(str(C[3][0]));
        }
      }
    }
    Fen.B[0].Def_Ch(str(C[0][0])); //aficher le prix
    Fen.B[1].Def_Ch(str(C[1][0]));
    Fen.B[2].Def_Ch(str(C[1][1]));
    Image = loadImage("Texture/PNG/IA.png");
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
        text ("Que voulez-vous acheter, étrangers ?", width/12, height/12);

        text ("Equipage :", width/12, height/10);
        PImage Homme;
        Homme = loadImage("laDefense.jpg");

        if (Fen.B[0].Activ && Lune >= C[0][0] && E[0][0]<D[0][0])
        {
          Lune = Lune - C[0][0];
        }

        text ("Ravitaillement :", width/12, height/8);
        PImage Carburant;
        Carburant = loadImage("laDefense.jpg");
        if (Fen.B[0].Aff && Lune>= C[1][0] && E[1][0]<D[1][0] && (V.Missile.N + V.Carbu.N)<=E[1][2])
        {
          Lune = Lune - C[1][0];
        }
        if (Fen.B[1].Activ && Lune>= C[1][1] && E[1][1]<D[1][1] && (V.NbMissile.N + V.Carbu.N)<=E[1][2])
        {
          Lune = Lune - C[1][1];
        }
        if (Fen.B[2].Activ && Lune>= C[1][2] && E[1][2]<D[1][2])
        {
          Lune = Lune - C[1][2];
        }

        text ("Armes :", width/12, height/6);
        PImage Missile0;
        if ((Fen.B[3].Activ && Lune>= Missile.M[0][4] && E[2][0]<D[2][0]))
        {
          Lune = Lune - Missile.M[0][4];
        }
        if (Fen.B[4].Activ && Lune>= Missile.M[1][4] && E[2][1]<D[2][1])
        {
          Lune = Lune - Missile.M[1][4];
        }

        text ("Amélioration :", width/12, height/4);
        PImage Salle;
        Salle = loadImage("laDefense.jpg");
        if (Lune>= C[3][0] && ((Fen.B[5].Activ &&  E[3][0]<D[3][0]) || (Fen.B[6].Activ && E[3][1]<D[3][1]) || (Fen.B[7].Activ && E[3][2]<D[3][2]) || (Fen.B[8].Activ && Lune>= C[3][0])
          || (Fen.B[9].Activ && E[3][4]<D[3][4]) || (Fen.B[10].Activ && E[3][5]<D[3][5]) || (Fen.B[11].Activ && E[3][6]<D[3][6]) || (Fen.B[12].Activ && E[3][7]<D[3][7])))
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

  void mouseMoved() {
    //text(mouseX, mouseY, "Dispositif actuelle et maximale : " D[0][0]);
  }
}
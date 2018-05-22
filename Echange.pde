/*
  Missile Carburant, PV
 M0; M1;
 Type :
 0 = bouclier
 1 = reacteur
 2 = Poste de Pilotage
 3 = Surveillance 
 4 = Oxygene
 5 = Soin
 6 = Reverve
 7 = Arme
 */

class Echange
{
  int Lune = 40;
  int[][] D = new int[4][8];
  int[][] C = new int[4][8];
  Fenetre Fen;
  PImage Image;
  boolean Affiche;

  Echange() {
    D[1][2]= 30;        //nb max de dispositfs
    D[2][0]= 2;
    for (int i=0; i<=7; i++) {
      D[3][i]= 3;
    }
    for (int i=0; i<=7; i++) {
      V.Salle[i].PV = 1;
    }

    C[1][0]=  4;         //coût de l'achat
    C[2][0] = 40;
    C[2][1] = 60;
    C[3][0] = 15;

    Fen = new Fenetre(0, 0, 15, 15);                              //afficher la fenêtre bouton
    Fen.Long= width - 200;
    Fen.Larg = height - 200;
    for (int i=1; i<=5; i++) {
      Fen.InitBouton(i, 200, i*100+200, 265, 50);                          //initialisation des boutons, du prix et nom de l'achat
      if (i==5) { 
        for (int j=6; j<=13; j++) {
          Fen.InitBouton(j, j*165-(width/4), (i+1)*100+200, 160, 50);
          Fen.B[j].Def_Ch(V.Salle[j-6].Nom + " "+ str(C[3][0]) + " Lunes");
        }
      }
    }
    Fen.InitBouton(0, (width/2)-90, 70, 180, 70);               // bouton pour accéder à l'échange
    Fen.InitBouton(14, width -200, height - 70, 180, 70);             // bouton pour continuer le jeu
    Fen.B[0].Def_Ch(" La cosmo boutique " );
    Fen.B[14].Def_Ch(" Passer au niveau suivant ");
    Fen.B[1].Def_Ch("Missile  : " + str(C[1][0]) + "  Lunes");         
    Fen.B[2].Def_Ch("Carburant  : " + str(C[1][0]) + "  Lunes");
    Fen.B[3].Def_Ch("Points de Vie  : " + str(C[1][0]) + "  Lunes");
    Fen.B[4].Def_Ch("Arme tir coup par coup  : " + str(C[2][0]) + "  Lunes");
    Fen.B[5].Def_Ch("Arme tir en rafale  : " + str(C[2][1]) + "  Lunes");
    for (int i=1; i<=13; i++) {
      Fen.B[i].C_Tx = color(255, 0, 0);                                    //couleur du texte dans les boutons
      Fen.B[i].C_Rp = color(122, 255, 50);                                 //couleur des boutons
    }
    Fen.B[0].C_Rp = color(#F09D9D);
    Fen.B[14].C_Rp = color(#BFB3B3);
  }

  void draw()
  {
    Fen.draw();
  }


  void mousePressed ()
  {
    for (Bouton B : Fen.B) {
      if (Fen.B[1].Aff && Lune>= C[1][0] && V.Missile.N<D[1][0] && (V.Missile.N + V.Carbu.N)<=30) {
        Lune = Lune - C[1][0];
        V.Missile.N++;
      }
      if (Fen.B[2].Activ && Lune>= C[1][1] && V.Carbu.N<D[1][1] && (V.Missile.N + V.Carbu.N)<=30) {
        Lune = Lune - C[1][1];
        V.Carbu.N++;
      }
      if (Fen.B[3].Activ && Lune>= C[1][2] && V.Pv.N<D[1][2] && V.Pv.N <= D[1][2]) {
        Lune = Lune - C[1][2];
        V.Pv.N++;
      }
      if (Fen.B[4].Activ && Lune>= C[2][0]) {
        Lune = Lune - C[2][0];
        V.MEquiper[1] = Miss.M[0][0];
      }
      if (Fen.B[5].Activ && Lune>= C[2][1]) {
        Lune = Lune - C[2][1];
        V.MEquiper[1] = Miss.M[1][0];
      }
      for (int i=6; i<=13; i++) {
        if (Fen.B[i].Activ && V.Salle[i-6].PV<D[3][i-6]) {
          Lune = Lune - C[3][0];
          C[3][0] = C[3][0] + 15;
          if (C[3][0] <= 15) {
            C[3][0] = C[3][0] - 15;
          }
          V.Salle[i-6].PV++;
        }
      }
      if (Fen.B[14].Activ) {
        // un nouvel ennemi apparaît;
        IA = new IA(100, 100);
      }
    }
  }

  void mouseReleased()
  {
    Fen.mouseReleased();
  }
}

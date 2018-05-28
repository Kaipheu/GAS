/*********************************************************************************************************
 Titre du Programme : Gestion d'Attaque Spatiale (GAS)
 **********************************************************************************************************
 Date de création du programme : 23/01/2018
 **********************************************************************************************************
 Auteurs : Berenger Florian, Said Djambae
 
 Lycée : Pierre Termier
 **********************************************************************************************************
 Nom du fichier : Echange
 *********************************************************************************************************/
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
  int Lune = 120;                   //argent du joueur
  int[][] D = new int[4][8];       //dispositifs maximales que le joueur peut acheter
  int[][] C = new int[4][8];       //coût des dispositifs d'amélioration ou d'achat du joueur
  Fenetre Fen;                     //fenêtre de l'échange
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

    Fen = new Fenetre(0, 0, 15, 15);                              //afficher la fenêtre avec les boutons
    Fen.Long= width - 200;
    Fen.Larg = height - 200;
    for (int i=1; i<=5; i++) {
      Fen.InitBouton(i, 200, i*100, 265, 50);                          //initialisation des boutons, du prix et nom de l'achat
      if (i==5) { 
        for (int j=6; j<=13; j++) {
          Fen.InitBouton(j, j*165-(width/2), (i+1)*100, 160, 50);
          Fen.B[j].Def_Ch(V.Salle[j-6].Nom + " "+ str(C[3][0]) + " Lunes");
        }
      }
    }
    Fen.InitBouton(0, (width/2)-90, 70, 180, 70);               // bouton pour accéder à l'échange
    Fen.InitBouton(14, width -200, height - 70, 180, 70);             // bouton pour continuer le jeu
    Fen.B[0].Def_Ch(" La cosmo boutique " );               //définition du texte & prix des boutons
    Fen.B[14].Def_Ch(" Passer au niveau suivant ");
    Fen.B[1].Def_Ch("Missile  : " + str(C[1][0]) + "  Lunes");         
    Fen.B[2].Def_Ch("Carburant  : " + str(C[1][0]) + "  Lunes");
    Fen.B[3].Def_Ch("Points de Vie  : " + str(C[1][0]) + "  Lunes");
    Fen.B[4].Def_Ch("Arme n°0  : " + str(C[2][0]) + "  Lunes");
    Fen.B[5].Def_Ch("Arme n°1  : " + str(C[2][1]) + "  Lunes");
    for (int i=1; i<=13; i++) {
      Fen.B[i].C_Tx = color(255, 0, 0);                                    //couleur du texte dans les boutons
      Fen.B[i].C_Rp = color(122, 255, 50);                                 //couleur des boutons
    }
    Fen.B[0].C_Rp = color(#F09D9D);
    Fen.B[14].C_Rp = color(#BFB3B3);
  }

  void draw()
  {
    Fen.draw();  //dessiner la fenêtre
  }


  void mousePressed ()
  {
    for ( Bouton B : Fen.B) {
      B.mousePressed();
    }
    if (Fen.B[1].Activ==true && Lune>= C[1][0] && (V.Missile.N + V.Carbu.N)<=30) {  //si le bouton 1 est activé, que le joueur a assez d'argent, que son nombre de missile et de carburant ne dépasse pas les 30
      if (Fen.B[1].Activ==true && Lune>= C[1][0]) {  //si le bouton 1 est activé, que le joueur a assez d'argent
        Lune = Lune - C[1][0];  //il pert l'argent dépenser
        V.Missile.N++;  //il gagne un missile
      }
      if (Fen.B[2].Activ==true && Lune>= C[1][1]) { //pareil pour le carburant
        Lune = Lune - C[1][1];
        V.Carbu.N++;
      }
      if (Fen.B[3].Activ==true && Lune>= C[1][2] && V.Pv.N<D[1][2] && V.Pv.N <= D[1][2]) { //si le bouton 1 est activé, que le joueur a assez d'argent, et que son nombre de point de vie ne dépasse pas le dispositif max
        Lune = Lune - C[1][2];         //il pert l'argent dépenser
        V.Pv.N++;                      //les PV du Joueur augmentent  
        V.PVmax++;                     //les PV max du Joueur augmentent
      }
      if (Fen.B[4].Activ==true && Lune>= C[2][0]) {
        Lune = Lune - C[2][0];        //il pert l'argent dépenser
        V.MEquiper = Miss.M[0][0];    //il s'équipe de l'arme 0
        V.MR = Miss.M[0][2];          //la recharge de son Missile change
      }
      if (Fen.B[5].Activ==true && Lune>= C[2][1]) {
        Lune = Lune - C[2][1];        //il pert l'argent dépenser
        V.MEquiper = Miss.M[1][0];    //il s'équipe de l'arme 1
        V.MR = Miss.M[1][2];          //la recharge de son Missile change
      }
      for (int i=6; i<=13; i++) {
        if (Fen.B[i].Activ==true && V.Salle[i-6].PV<D[3][i-6]) {
          Lune = Lune - C[3][0];      //il pert l'argent dépenser
          V.Salle[i-6].PV++;          //les PV de la Salle choisie augmentent
          V.Salle[i-6].PVMax++;       //les PV max de la Salle choisie augmentent
        }
      }
      if (Fen.B[14].Activ==true) {    //si le Joueur appuie sur e niveau suivant
        IA.Visible = true;
        Boutique[0].Activ=false;      //la boutique disparaît     
        E=null;
        Lune=int(random(20));        //le Joueur gagne de l'argent en passant au niveau suivant
      }
    }
  }
}

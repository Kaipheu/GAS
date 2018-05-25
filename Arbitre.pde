void combat()
{
  //PVector Pos = new PVector();  //initialisation
  //Pos.set(IA.VIA.AvPos(0));
  PImage imgMissile;
  imgMissile = Tex.Ico[15];

  if ((V.Pv.N >0) || (IA.VIA.PV > 0))     //si un des vaisseaux n'est pas encore détruit
  {

    for (int m=0; m<=1; m++) {      //pareil pour le Joueur  //////////////////////////////////////////////////////////////////////////////////////////////////
      if ((V.MEquiper == Miss.M[m][0]) && (V.MRTer== true)/* && (IA.VIA.Salle[0].Pos.x==7)*/) {
        V.MRTer = false;
        V.Missile.N--;
        imgMissile = Tex.Ico[15+m];
        Missile[0].Deplacement();
        image(imgMissile, Missile[0].Pos.x, Missile[0].Pos.y, 50, 50); //affichage de l'image 
        stroke(255);   
        noFill();
        //println(Missile[0].Pos.dist(IA.VIA.AvPos(Viser)));
        if (Missile[0].Pos.dist(IA.VIA.AvPos(Viser))<=(IA.VIA.Salle[Viser].Long) &&  !Missile[0].LO ) {
          Missile[0].Vst.set(0,0);
          Missile[0].LO =true;
          F[11] = frameCount;
          //Missile[0] = new Etoiles(V.Pos.x+500, V.Pos.y +250, 1, true);
        }
      }
    }

    for (int i=0; i<=1; i++) {                //pour les différents missiles appartenant à l'arme de l'IA //////////////////////////////////////////////////////
      if ((IA.MEquiper == Miss.M[i][0]) && (IA.MRTer== true) && (IA.Tir == true)) {          
        IA.MRTer = false;//et si un missile est équipé, que sa recharge est terminée, et qu'il est prêt à être tiré
        IA.Tir =false;                                   //le tir est maintenant non prêt
        imgMissile = Tex.Ico[15+i];
        Missile[1].Deplacement();
        
        image(imgMissile, Missile[1].Pos.x, Missile[1].Pos.y, 50, 50 ); //affichage de l'image 
        stroke(255);   
        noFill();
       
        if (Missile[1].Pos.dist(V.AvPos(Viser))<=(V.Salle[Viser].Long)) {
          Missile[1].LO =true;
          Missile[1] = new Etoiles(IA.VIA.Pos.x-500, IA.VIA.Pos.y +250, 1, true);
          F[11] = frameCount;
        }
      }
    }

    if (IA.VIA.PV <=0) {        //si les PV de l'IA sont inférieurs à 0
      fill(#BE2292);
      textSize(35);
      text("Vous avez réussi le niveau n°" + str(IA.NE), width/2, height/8);     //le joueur réussi le niveau
      //IA = null;       //l'IA disparaît
    }

    if (V.PV <=0) {            //si les PV du Joueur sont inférieur à0
      fill(#BE2292);
      textSize(35);
      text("Vous avez perdu ...", width/2, height/2);         //le joueur perd
      M.Aff=true;          //il revient donc au menu
    }

    if (IA.NE == 11) {        //si le joueur atteint le niveau 11 (soit après le boss de fin)
      fill(#BE2292);
      textSize(35);
      text("Vous avez réussi le jeu", width/2, height/2);           //il réussi le jeu
      M.Aff=true;        //il revient donc au menu
    }
  }
}



void animBoomV ()
{
  
    copy(Tex.Ico[14], 300*int(15*((frameCount - F[11]) / (frameRate))), 300, 300, 300, int(Missile[0].Pos.x), int(Missile[0].Pos.y), 30, 30); 
    stroke(255);
    noFill();
    IA.VIA.Salle[Viser].PV = IA.VIA.Salle[Viser].PV - Miss.M[1][1];     //ArrayIndexOutOFBoundsException : 9
    IA.VIA.PV = IA.VIA.PV - Miss.M[1][1];
    IA.VIA.Bouclier.N--;
    if (V.Michel.Salle(Viser)) {   //changer
      V.Equi.N = V.Equi.N - Miss.M[1][1];
      for (int j=0; j<=7; j++) {
        if (IA.VIA.Equi.N >=0 && IA.VIA.Michel.Salle == j) {
          if (int((F[11] - frameCount) / (frameRate)) == 8) {
            IA.VIA.Salle[j].PV++;
            F[11] = frameCount;
          
        }
      }
    }
  }
}

void animBoomIA ()
{
  for (int i=0; i<=1; i++) {
    copy(Tex.Ico[15+i], 300*int((frameCount - F[12]) / (frameRate *10000)), i*300, 300, 300, int( Missile[0].Pos.x), int( Missile[0].Pos.y), 30, 30); //copy(image, sourceXdsImage, sourceYdsImage, dimSourceX, dimSourceY, posEcranX, posEcranY, tailleX, tailleY);
    stroke(255);
    noFill();
    V.Salle[Viser].PV = V.Salle[Viser].PV - Miss.M[i][1];        //arrayIndexOutOFBoundsException : 9
    V.Pv.N = V.Pv.N - Miss.M[i][1];
    for (int j=0; j<=7; j++) {
      if (V.Equi.N >=0 && V.Michel.Salle == j) {
        if (((F[11] - frameCount) / (frameRate)) == 8) {
          V.Salle[j].PV++;
          F[11] = frameCount;
        }
      }
    }
    V.Bouclier.N--;
    V.Pv.N = V.Pv.N - Miss.M[i][1];
  }
}
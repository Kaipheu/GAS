void combat()
{
  PImage imgMissile;
  imgMissile = Tex.Ico[15];  //image du type de missile

  if (((V.Pv.N >0) || (IA.VIA.PV > 0)) && Viser<=7)     //si un des vaisseaux n'est pas encore détruit
  {
    for (int m=0; m<=1; m++) {      //pareil pour le Joueur  //////////////////////////////////////////////////////////////////////////////////////////////////
      if ((V.MEquiper == Miss.M[m][0]) && (V.MRTer== true)/* && (IA.VIA.Salle[0].Pos.x==7)*/) {
        V.MRTer = false;
        imgMissile = Tex.Ico[15+m];
        Missile[0].Deplacement();
        image(imgMissile, Missile[0].Pos.x, Missile[0].Pos.y, 50, 50); //affichage de l'image 
        stroke(255);   
        noFill();
        if (Missile[0].Pos.dist(PVector.add(IA.VIA.AvPos(Viser),new PVector(IA.VIA.Salle[Viser].Long/2,IA.VIA.Salle[Viser].Larg/2)))<=(IA.VIA.Salle[Viser].Long)/2 &&  !Missile[0].AnimVisible) {
          Missile[0].Vst.set(0,0);
          Missile[0].AnimVisible =true;
          F[11] = frameCount;
          IExplo =300*m;
        }
      }
    }

    for (int i=0; i<=1; i++) {                //pour les différents missiles appartenant à l'arme de l'IA //////////////////////////////////////////////////////
      if ((IA.MEquiper == Miss.M[i][0]) && (IA.MRTer== true) && (IA.Tir == true)) {               //si un missile est équipé, que sa recharge est terminée, et qu'il est prêt à être tiré   
        IA.MRTer = false;                                //sa recharge est maintenant non prête
        IA.Tir =false;                                   //le tir est maintenant non prêt
        imgMissile = Tex.Ico[15+i];                      //l'image prend la valeur du type de Missile
        Missile[1].Deplacement();                        //le Missile se déplace
        image(imgMissile, Missile[1].Pos.x, Missile[1].Pos.y, 50, 50 ); //affichage de l'image 
        stroke(255);   
        noFill();
        if (Missile[1].Pos.dist(V.AvPos(Viser))<=(V.Salle[Viser].Long+50) &&  !Missile[1].AnimVisible) {   //si la posiion du Missile est inférieur à celle de la Salle viser, et que l'animation du Missile n'est pas en cours
          Missile[1].AnimVisible =true;                                                                    //l'animation du Missile est visible
          IExplo =300*i;
        }
      }
    }

    if (IA.VIA.PV <=0) {        //si les PV de l'IA sont inférieurs à 0
      fill(#BE2292);
      textSize(35);
      text("Vous avez réussi le niveau n°" + str(IA.NE), width/2, height/8);     //le joueur réussi le niveau
      IA.Visible = false;
    }

    if (V.PV <=0) {            //si les PV du Joueur sont inférieurs à 0
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

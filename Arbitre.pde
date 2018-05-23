void combat()
{
  PVector Pos = new PVector();  //initialisation
  Pos.set(V.AvPos(0));
  PImage imgMissile;
  imgMissile = Tex.Ico[15];
  boolean ProbM = false;
  int ProbabM=int(random(100));
  PVector PosMissEn1 = new PVector();
  //float xMissinit=0, yMissinit=0;

  if ((V.Pv.N >0) || (IA.VIA.PV > 0))     //si un des vaisseaux n'est pas encore détruit
  {
    for (int j=0; j<=1; j++) {              //pour les différents emplacements d'armes du vaisseau
      for (int i=0; i<=1; i++) {                //pour les différents missiles appartenant aux armes
        if ((IA.MEquiper[j] == Miss.M[i][0]) && (IA.MRTer[i]== true) && (IA.Tir[i] == true)) {           //et si un missil est équipé, que sa recharge est terminé, et qu'il est prêt à être tiré 
          ProbabM = Miss.M[i][0]/(ProbabM+1);                   //vérification de la probabilité de toucher
          if (ProbabM <1) {                    
            ProbM=false;                                        //échec    
            IA.Tir[i] =false;                                   //le tir est maintenant non prêt
          } else if (ProbabM >= Miss.M[i][0]) { 
            ProbM=true;                                         //succés
            IA.Tir[i] =false;                                   //le tir est maintenant non prêt
            PosMissEn1.set(-409, 147*2.62*(i+1)).add(IA.VIA.Pos);
            xMissinit =-409;
            yMissinit=147*2.62*(i+1);
          }
        }
        if (i ==1) {                 //l'image rendu change si le missile équipé est le M[1][0]
          imgMissile = Tex.Ico[16];
        }
      }
    }
    for (int j=0; j<=1; j++) {       //pareil pour l'IA      
      for (int i=0; i<=1; i++) {
        if ((V.MEquiper[j] == Miss.M[i][0]) && (V.MRTer[i]== true) && (IA.VIA.ArrivMissile()<=7)) {
          ProbabM= Miss.M[i][0]/(ProbabM+1);
          if (ProbabM <= Miss.M[i][0]) {
            ProbM=false;
          } else if (ProbabM >= Miss.M[i][0]) {
            ProbM=true;
            PosMissEn1.set(-409, 147*2.62*(i+1)).add(V.Pos);
            xMissinit =-409;
            yMissinit=147*2.62*(i+1);
          }
        }
        if (i ==1) {
          imgMissile = Tex.Ico[16];
        }
      }
    }

    //T++;                    // vitesse du missile
    //PVector Traj = new PVector();
    //Traj = PosMissEn1.sub(Pos).setMag(T);                //calcul de la trajectoire EmplacementArme à Salleviser
    //image(imgMissile,xMissinit-V.Pos.x, yMissinit-V.Pos.y, 50, 50);         //affichage de l'image 
    //stroke(255);   
    //noFill();

    T++;                    // vitesse du missile
    PVector Traj = new PVector();
    Traj = PosMissEn1.sub(Pos).setMag(T);                //calcul de la trajectoire EmplacementArme à Salleviser
    image(imgMissile, -Traj.x, -Traj.y, 50, 50);         //affichage de l'image 
    stroke(255);   
    noFill();
    
    if (ProbM == true) {    //si la probabilité est un succès
      //animBoom();         //déclencher alors l'animation de l'explosion
    }
  }


  if (IA.VIA.PV <=0) {        //si les PV de l'IA sont inférieurs à 0
    fill(#BE2292);
    textSize(35);
    text("Vous avez réussi le niveau n°" + str(IA.NE), width/2, height/8);     //le joueur réussi le niveau
    IA = null;       //l'IA disparaît
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



//void animBoom ()
//{
//  for (int i=0; i<=1; i++) {
//    if (V.MEquiper[0] == Miss.M[i][0]/* && IA.VIA.ArrivMissile()<=7*/) {  //changer IA.VIA.ArrivMissile
//      copy(Tex.Ico[15+i], 300*int((frameCount - F[11]) / (frameRate *100)), i*300, 300, 300, 25, 50, 30, 30); //copy(image, sourceXdsImage, sourceYdsImage, dimSourceX, dimSourceY, posEcranX, posEcranY, tailleX, tailleY);
//      stroke(255);
//      noFill();
//      IA.Salle[IA.VIA.ArrivMissile()].PV = IA.Salle[IA.VIA.ArrivMissile()].PV - Miss.M[i][1];
//      IA.VIA.PV = IA.VIA.PV - Miss.M[i][1];
//      IA.VIA.Bouclier.N--;
//      V.Missile.N--;
//      IA.VIA.PV = IA.VIA.PV - Miss.M[i][1];
//      if (IA.VIA.ArrivMissile()== i) {   //changer
//        V.Equi.N = V.Equi.N - Miss.M[i][1];
//        for (int j=0; j<=7; j++) {
//          if (IA.VIA.Equi.N >=0 && IA.VIA.Michel.Salle == j) {
//            if (int((frameCount - F[11]) / (frameRate)) == 8) {
//              IA.Salle[j].PV++;
//              F[11] = frameCount;
//            }
//          }
//        }
//      }
//    }
//  }

//  for (int i=0; i<=1; i++) {
//    if (IA.MEquiper[1] == Miss.M[i][0] /*&& V.ArrivMissile()<=7*/) { //changer V.ArrivMissile
//      copy(Tex.Ico[15+i], 300*int((frameCount - F[12]) / (frameRate *100)), i*300, 300, 300, 25, 50, 30, 30); //copy(image, sourceXdsImage, sourceYdsImage, dimSourceX, dimSourceY, posEcranX, posEcranY, tailleX, tailleY);
//      stroke(255);
//      noFill();
//      V.Salle[V.ArrivMissile()].PV = V.Salle[V.ArrivMissile()].PV - Miss.M[i][1];        //arrayIndexOutOFBoundsException : 9
//      V.Pv.N = V.Pv.N - Miss.M[i][1];
//      for (int j=0; j<=7; j++) {
//        if (V.Equi.N >=0 && V.Michel.Salle == j) {
//          if (int((frameCount - F[11]) / (frameRate)) == 8) {
//            V.Salle[j].PV++;
//            F[11] = frameCount;
//          }
//        }
//      }
//    }
//    V.Bouclier.N--;
//    V.Pv.N = V.Pv.N - Miss.M[i][1];
//  }
//}

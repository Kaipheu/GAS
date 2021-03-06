/*********************************************************************************************************
 Titre du Programme : Gestion d'Attaque Spatiale (GAS)
 **********************************************************************************************************
 Date de création du programme : 23/01/2018
 **********************************************************************************************************
 Auteurs : Berenger Florian, Said Djambae
 
 Lycée : Pierre Termier
 **********************************************************************************************************
 Nom du fichier : Fonction_oo
 *********************************************************************************************************/
void dommage()
{
  if (V.Salle[0].PV<=0) {         //si la salle "Oxygène" est touchée
    V.Oxy.N = V.Oxy.N - int((frameCount - F[0])/(frameRate*10));   //une tempo commence
    if (V.Oxy.N==0) {  //si l'oxygène descend à 0
      F[0]=frameCount;
      V.Equi.N = 0;    //l'équipage du vaisseau meurt
    }
  }

  if (V.Salle[2].PV<=0) {
    V.Missile.N = int(random((V.Missile.N + V.Carbu.N)/2));    //diminuer le nb de missile dans la réserve
    V.Carbu.N = int(random((V.Missile.N + V.Carbu.N)/2));      //diminuer le nb de carburant dans la réserve
  }

  for (int i=0; i<=7; i++) { 
    if (V.Salle[i].PV<=0) {  //si les PV d'une salle du Joueur descendent en dessous de 0
      V.Salle[i].PV=0;       //ses PV reviennent à 0
    }
  }
  if (V.Equi.N <= 0) {       //si l'équipage n'est plus en vie
    fill(#BE2292);
    textSize(35);
    text("Vous avez perdu ... ", width/2, height/2-150);          //le joueur perd
    text("Vous n'avez plus d'homme!", width/2, height/2+150);     //pour la raison suivante
    // exit();
  }

  for (int i=0; i<=7; i++) {
    if (IA.VIA.Salle[i].PV<=0) {   //si les PV d'une salle descendent en dessous de 0
      IA.VIA.Salle[i].PV=0;        //ses PV reviennent à 0
    }
  }
}


void reparer()
{
  for (int i=0; i<=7; i++) {
    if (V.Equi.N >=0 && V.Michel.Salle == i && V.Salle[i].PV<= V.Salle[i].PVMax) {        //Si Michel est dans la Salle X, qu'il est en vie, et que la salle soit endommagée
      if (((frameCount - F[2]) / (frameRate)) == 8) { // si la tempo est > au temps pour réparer une salle
        F[2]=frameCount; 
        V.Salle[i].PV++;  //la salle gagne des PV
      }
    }
  }
  
  /*Preférence de salle à viser pour l'IA sur le Joueur*/
  if (IA.VIA.Salle[2].PV <= IA.VIA.Salle[2].PVMax || IA.VIA.Salle[5].PV <= IA.VIA.Salle[5].PVMax || IA.VIA.Salle[6].PV <= IA.VIA.Salle[6].PVMax)  //si une de ses salle nécessitent des réparations
  {
    if (((frameCount - F[2]) / (frameRate)) >= 8) {  //une tempo se fait pour cette ordre de priorité
      F[2]=frameCount;
      IA.VIA.Salle[2].PV++;                          //puis la salle regagne des PV
    } else if (((frameCount - F[2]) / (frameRate)) >= 8) {//pareil
      F[2]=frameCount;
      IA.VIA.Salle[5].PV++;
    } else if (((frameCount - F[2]) / (frameRate)) >= 8) {//pareil
      F[2]=frameCount;
      IA.VIA.Salle[6].PV++;
    }
  } else if (IA.VIA.Salle[0].PV <= IA.VIA.Salle[0].PVMax || IA.VIA.Salle[3].PV <= IA.VIA.Salle[3].PVMax) {   //si une de ses salles moins importantes nécessitent des réparations
    if (((frameCount - F[2]) / (frameRate)) >= 8) { //une tempo se fait pour cette ordre de priorité
      F[2]=frameCount;
      IA.VIA.Salle[0].PV++;                         //puis la salle regagne es PV
    } else if (((frameCount - F[2]) / (frameRate)) >= 8) {//pareil
      F[2]=frameCount;
      IA.VIA.Salle[3].PV++;
    }
  } else if (IA.VIA.Salle[1].PV <= IA.VIA.Salle[1].PVMax || IA.VIA.Salle[4].PV <= IA.VIA.Salle[4].PVMax || IA.VIA.Salle[7].PV <= IA.VIA.Salle[7].PVMax) { //etc
    if (((frameCount - F[2]) / (frameRate)) >= 8) {//pareil
      F[1]=frameCount;
      IA.VIA.Salle[2].PV++;
    } else if (((frameCount - F[2]) / (frameRate)) >= 8) {//pareil
      F[4]=frameCount;
      IA.VIA.Salle[5].PV++;
    } else if (((frameCount - F[2]) / (frameRate)) >= 8) {//pareil
      F[7]=frameCount;
      IA.VIA.Salle[2].PV++;
    }
  }
}


void recharger()
{
  if (V.Salle[6].PV>0) {
    if (V.Bouclier.N <= V.Boucliermax && V.Salle[6].PV>0) {      //si le bouclier est inférieur au bouclier maximal
      F[3]=0;
      if ((frameCount - F[3])/( frameRate) == 6) {               //la tempo commence
        V.Bouclier.N++;                                          //le bouclier se recharge de 1
        F[3]=frameCount;
      }
    }
  }

  for (int i=0; i<=1; i++) {                                                                      
    if (int((frameCount - F[4]) / (frameRate)) <= Miss.M[i][2] && V.MEquiper == Miss.M[i][0]) {  //si la recharge du missila est terminé et que le Joueur en est équipé alors
      F[4]=frameCount;
    V.MRTer = true;          //la recharge du missile est maintenant vraie
    }           //
  }  
  for (int i=0; i<=1; i++) {
    if (int((frameCount - F[11]) / (frameRate)) >= Miss.M[i][2] && IA.MEquiper == Miss.M[i][0]) {   //pareil pour l'IA
      F[11]=frameCount;
      IA.MRTer = true;
    }
  }
}


void actionIA()
{
  if (((frameCount - F[7])/( frameRate))>=Miss.M[0][2]) {  //si la tempo est supérieur à la recharge minimale du Missile
    for (int i =0; i<7; i++) {     //salle de préférence à viser
      if ((V.Salle[i+1].PV <= V.Salle[i].PVMax) && (IA.P[i+1] >= IA.P[i])) {//en fonction des priorités de destruction de salle, des PV de la salle
        IA.P[i] = IA.P[i+1];
        IA.Vise=i;     //la variable Vise prend la valeur de l'identifiant de la salle
      }
    }
    F[7]=frameCount;
  }
}

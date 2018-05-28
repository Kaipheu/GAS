/*********************************************************************************************************
 Titre du Programme : Gestion d'Attaque Spatiale (GAS)
 **********************************************************************************************************
 Date de création du programme : 23/01/2018
 **********************************************************************************************************
 Auteurs : Berenger Florian, Said Djambae
 
 Lycée : Pierre Termier
 **********************************************************************************************************
 Nom du fichier : Explosion
 *********************************************************************************************************/
void animBoomV () //animation de l'explosion du Vaisseau Joueur
{
  copy(Tex.Ico[14], 300*int(15*((frameCount - F[11]) / (frameRate))), IExplo*300, 300, 300, int(Missile[0].Pos.x), int(Missile[0].Pos.y), 50, 50);    //prendre l'image et la décaler
  stroke(255);  //contours blancs
  noFill();  //ne pas remplir
  if (300*int(15*((frameCount - F[11]) / (frameRate)))>=3000)            //si l'animation atteint la fin de l'image soit 3000 alors :
  {
    F[11]=frameCount;                                                    //tempo
    Missile[0].AnimVisible =false;                                       //l'animation du Missile n'est plus disponible
    if (Missile[0].AnimVisible ==false) {
      V.Missile.N--;                                             //le Joueur perd un Missile1
      if (IA.VIA.Bouclier.N>0) {                                             //si l'IA possède un bouclier
        IA.VIA.Bouclier.N--;                                                 //il perd ce dernier
      } else if (IA.VIA.Bouclier.N<=0) {                                     //sinon
        IA.VIA.Salle[Viser].PV = IA.VIA.Salle[Viser].PV - Miss.M[0][1];      //la salle perd des PV
        IA.VIA.PV -= Miss.M[0][1];                                           //l'IA perde des PV
      }
    }
  }
}

void animBoomIA ()   //pareil pour l'IA
{
  copy(Tex.Ico[14], 300*int(15*((frameCount - F[12]) / (frameRate))), IExplo*300, 300, 300, int(Missile[0].Pos.x), int(Missile[0].Pos.y), 50, 50); 
  stroke(255);
  noFill();
  if (300*int(15*((frameCount - F[12]) / (frameRate)))>=3000) {
    F[12]=frameCount;
    Missile[1].AnimVisible =false;
    if (V.Bouclier.N>0) {
      V.Bouclier.N--;
    } else if (V.Bouclier.N<=0) {
      V.Salle[Viser].PV = V.Salle[Viser].PV - Miss.M[IExplo][1];
      V.Pv.N = V.Pv.N - Miss.M[IExplo][1];
    }
  }
}

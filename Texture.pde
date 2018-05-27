class Texture {
  PImage Salle;
  PImage[] Ico = new PImage[18]; 
  //PImage[] Texture = new PImage[5];
  Texture() {
    Salle = requestImage("Texture/PNG/Salle.png");
  for (int i = 0; i<8;i++){
    Ico[i] = requestImage("Texture/PNG/Ico"+i+".png");
  }
  
    Ico[8] = requestImage("Texture/PNG/Couloir_.png");
    Ico[9] = requestImage("Texture/PNG/CouloirSPF_.png");
    Ico[10] = requestImage("Texture/PNG/CouloirSPO_.png");
    Ico[11] = requestImage("Texture/PNG/Couloir_.png");
    Ico[12] = requestImage("Texture/PNG/Sans air.png");
    Ico[13] = requestImage("Texture/PNG/Carburant.png");
    Ico[14] = requestImage("Texture/PNG/Assemblage_missile.png");
    Ico[15] = requestImage("Texture/PNG/Missile0.png");
    Ico[16] = requestImage("Texture/PNG/Missile1.png");
    Ico[17] = requestImage("Texture/PNG/Homme_1000x1000.png");
}
  void Texture(Bouton B){
    image(Ico[B.ID],B.Pos.x,B.Pos.y,B.Long,B.Larg);
  }
  void Texture(Salle Autre) {
    image(Salle, Autre.Pos.x, Autre.Pos.y,Autre.Long,Autre.Larg);
    image(Ico[Autre.Type],Autre.Pos.x,Autre.Pos.y,Autre.Long,Autre.Larg);
  }
  void Texture(UniteT U){
    Salle S = new Salle(U.Pos.x,U.Pos.y,U.Long,U.Larg);
    S.Type = U.Type;
    Texture(S);
  }
  void Texture(Homme Autre){
    image(Ico[17],Autre.Pos.x,Autre.Pos.y,Autre.Taille,Autre.Taille);
  }
}
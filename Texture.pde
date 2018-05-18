class Texture {
  PImage Salle;
  PImage[] Ico = new PImage[13]; 
  //PImage[] Texture = new PImage[5];
  Texture() {
    Salle = loadImage("Texture/PNG/Salle.png");
  for (int i = 0; i<8;i++){
    Ico[i] = loadImage("Texture/PNG/Ico"+i+".png");
  }
 
    Ico[8] = loadImage("Texture/PNG/Couloir_.png");
    Ico[9] = loadImage("Texture/PNG/CouloirSPF_.png");
    Ico[10] = loadImage("Texture/PNG/CouloirSPO_.png");
    Ico[11] = loadImage("Texture/PNG/Couloir_.png");
    Ico[12] = loadImage("Texture/PNG/Sans air.png");
}

  void Texture(Salle Autre) {
    image(Salle, Autre.Pos.x, Autre.Pos.y,Autre.Long,Autre.Larg);
    image(Ico[Autre.Type],Autre.Pos.x,Autre.Pos.y,Autre.Long,Autre.Larg);
  }
  void TexU(UniteT U){
    Salle S = new Salle(U.Pos.x,U.Pos.y,U.Long,U.Larg);
    S.Type = U.Type;
    Texture(S);
  }
}
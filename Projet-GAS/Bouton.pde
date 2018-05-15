class Bouton extends Unite {
  Boolean Activ = false, Aff = true;
  String Nom;
  color C_Tx = 255;
  Bouton(int x, int y, int Long, int Larg, int Id) {
    super(x,y,Long,Larg);
    Nom = str(Id);
    Ar=50;
  }


  void draw() {
     fill(C_Rp);
    stroke(C_Tr);
    rect(Pos.x, Pos.y, Long, Larg,Ar);
    textAlign(CENTER, CENTER);
    fill(C_Tx);
    text(Nom, Pos.x+Long/2, Pos.y+Larg/2);
    if(AuDessu()){
      fill(255,120);
      rect(Pos.x, Pos.y, Long, Larg,50);
    }
  }
    void Position(int x, int y) {
    Pos.set(x, y);
  }
  PVector Av_Position() {
    return Pos;
  }
  //int Av_T_Text() {
  //  return T_Tx;
  //}

  void Def_Ch(String Ch) {
    this.Nom = Ch;
  }
  void Def_CStroke(color Ch) {
    C_Tr = Ch;
  }
  void Def_CReplisage(color Ch) {
    C_Rp = Ch;
  }
  void Def_CTexte(color Ch) {
    C_Tx = Ch;
  }
  
  boolean AuDessu(){
    if (mouseX<=Pos.x+Long && mouseX>=Pos.x && mouseY<=Pos.y+Larg && mouseY>=Pos.y) {
  return true;
    }else{
    return false;
    }
  }
  
  void mousePressed() {
    if (AuDessu()) {
      if (!Activ) {
        this.Activ = true;
        
      } else {
        Activ = false;
      }
    } else {
      this.Activ= false;
    }
  }
}
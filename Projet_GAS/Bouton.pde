class Bouton {
  PVector Pos = new PVector();
  int Long, Larg, Id;
  Boolean Activ = false, Aff = true;
  color C_St= color(0, 0, 0), C_Rp=color(#B7B7B7), C_Tx=color(255);
  String Ch;
  Bouton(int x, int y, int Long, int Larg, int Id) {
    this.Pos.set(x, y);
    this.Long = Long;
    this.Larg = Larg;
    this.Id = Id;
    Ch = str(Id);
  }
  void Position(int x, int y) {
    Pos.set(x, y);
  }

  void draw() {
    
     fill(C_Rp);
    stroke(C_St);
    rect(Pos.x, Pos.y, Long, Larg,50);
    textAlign(CENTER, CENTER);
    fill(C_Tx);
    text(Ch, Pos.x+Long/2, Pos.y+Larg/2);
    if(AuDessu()){
      fill(255,120);
      rect(Pos.x, Pos.y, Long, Larg,50);
    }
  }
  PVector Av_Position() {
    return Pos;
  }
  //int Av_T_Text() {
  //  return T_Tx;
  //}

  void Def_Ch(String Ch) {
    this.Ch = Ch;
  }
  void Def_CStroke(color Ch) {
    C_St = Ch;
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
    if (mouseX<=Pos.x+Long && mouseX>=Pos.x && mouseY<=Pos.y+Larg && mouseY>=Pos.y) {
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
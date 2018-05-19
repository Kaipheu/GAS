class Etoiles {
  PVector Pos= new PVector(),Post = new PVector();
  PVector Vst = new PVector();
  PVector Acc = new PVector();
  int R=255, G=255, B=255, A=255;
  float Taille = 5;
  boolean E  = false;
  Etoiles(int x, int y, float T,Boolean Et) {
    Pos.set(x, y);
    Taille = T;
    E = Et;
  }
  void draw() {
    stroke(R, G, B, A);
    strokeWeight(1);
    if(!E)line(Pos.x,Pos.y,Post.x,Post.y);
    translate(Pos.x, Pos.y);
    strokeWeight(1);
    if(E){
    for (int i = 0; i<5; i++) {
      rotate((PI/4)*i);
      line(-Taille, 0, Taille, 0);
    }
    }
  }
  void DefAcc(float x, float y) {
    Acc.set(x, y);
  }
  void Acc() {
    Vst.add(Acc);
  }
  void Deplacement() {
    Post.set(Pos);
    Pos.add(Vst);
    Taille= norm(Vst.mag(),0,2.5);
  }
  void DefAcc() {
    Acc.set(Taille/10*random(0, 1), Taille*1/20*random(0, 1));
  }
  void AleAcc() {
    Acc.set(random(0, width/1000), random(-height/500, height/500));
  }
  void Pos() {
    if (Pos.x<=-1 ||Pos.x>=width+1 ||Pos.y<=-1 ||Pos.y>=height+1) { 
      Pos.set(width/2, height/2);
      Taille=1;
      Check();
    }
    Acc();
    
  }
  void Check() {
    Vst.set(0, 0);
    DefAcc(random(-1,1),random(-1,1));
    //if (Pos.x>=width/2 && Pos.y>=height/2) {
    //  DefAcc(1, 2);
    //  Acc();
    //} else if (Pos.x<=width/2 && Pos.y>=height/2) {
    //  DefAcc(-1, 2);
    //  Acc();
    //} else if (Pos.x>=width/2 && Pos.y<=height/2) {
    //  DefAcc(1, -2);
    //  Acc();
    //} else if (Pos.x<=width/2 && Pos.y<=height/2) {
    //  DefAcc(-1, -2);
    //  Acc();
    //}
  }
  void Ale() {
    Pos.set(int(random(0, width)), int(random(0, height)));
  }
}
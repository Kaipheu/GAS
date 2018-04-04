class Etoiles {
  PVector Pos= new PVector(),Vst = new PVector(),Acc = new PVector();
  int R=255,G=255,B=255,A=255;
  float Taille = 5;
  
  Etoiles(int x, int y, float T) {
    Pos.set(x, y);
     Taille = T;
    
  }
  //Etoiles(int x,int y,color c){
   
  //}

  void draw() {
    stroke(R,G,B,A);
    strokeWeight(1);
    translate(Pos.x, Pos.y);
    for (int i = 0; i<5; i++) {
      rotate((PI/4)*i);
      line(-Taille, 0, Taille, 0);
    }
  }
  void DefAcc(int x, int y){
   Acc.set(x,y);
  }
  void Acc(){
    Vst.add(Acc);
  }
  void Deplacement(){
    Pos.add(Vst);
  }
  void DefAcc(){
    Acc.set(Taille/10*random(0,1),Taille*1/20*random(0,1));
  }
  void AleAcc(){
  Acc.set(random(0,width/1000),random(-height/500,height/500));
  }
  void Pos(){
  if(Pos.x<=-1) Pos.x = width+1;
  if(Pos.x>=width+1) Pos.x = -1;
  if(Pos.y<=-1) Pos.y = height+1;
  if(Pos.y>=height+1) Pos.y = -1;
  //AleAcc();
  }
  void Ale(){
    Pos.set(int(random(0, width)), int(random(0, height)));
  }
}
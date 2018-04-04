Menu M; // Objet Menu 
Vaisseau V; // Objet vaisseaux Joueur et énemie

void settings () {
  fullScreen();
  //size(630,380);
}
void setup() {
  smooth(9);
  textSize(20);
  M = new Menu();// Créeation d'une instance Menu.
  V = new Vaisseau(100,100,width/15,1);// Instance Vaiseau Joueur
  //A = new Vaisseau(width-150,50,width/10,-1); // Instance Vaiseau Joueur
}

void draw() {
  background(120);
  if (M.Aff) {
    M.draw();
  }else{
   V.draw(); //<>//
   //A.draw();
  }
  
}

void mousePressed(){
  
  if (M.Aff) {
    M.mousePressed();
  }
}
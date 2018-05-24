class Menu {

  Bouton[] B = new Bouton[4];

  //Jeux J;
  boolean Aff = true;

  Menu() {
    for (int i = 0; i<B.length; i++) {
      // B[i] = new Bouton( width/2/*-50+int(textWidth("Quittez"))/2*/, height*1/10+100*i, 50+int(textWidth("Quittez")), 50, i);
      B[i] = new Bouton((width/2)-(50+int(textWidth("Quittez")))/2, height*1/10+100*i, 50+int(textWidth("Quittez")), 50, i);
      B[i].Def_CReplisage(color(0, 150, 150));
    }
    for (int i = 0; i<Et.length; i++) {
      Et[i] = new Etoiles(int(random(0, width)), int(random(0, height)), 1, false);
      if (Et[i].Pos.x>=width/2 && Et[i].Pos.y>=height/2) {
        Et[i].DefAcc(1, 2);
      } else if (Et[i].Pos.x<=width/2 && Et[i].Pos.y>=height/2) {
        Et[i].DefAcc(-1, 2);
      } else if (Et[i].Pos.x>=width/2 && Et[i].Pos.y<=height/2) {
        Et[i].DefAcc(1, -2);
      } else if (Et[i].Pos.x<=width/2 && Et[i].Pos.y<=height/2) {
        Et[i].DefAcc(-1, -2);
      }
      Et[i].Acc();
    }
    B[0].Def_Ch("Démarrer");
    B[1].Def_Ch("Option");
    B[2].Def_Ch("Crédit");
    B[3].Def_Ch("Quittez");
    //J = new  Jeux();
  }

  void draw() {
    background(0);

    for (Etoiles E : Et) {
      if (E.Vst.mag()>15) {
        pushMatrix();    
        E.draw();
        popMatrix();
      }
      E.Deplacement();
      E.Pos();
    }

    for ( Bouton B : B) {
      if (B.Aff) B.draw();
    }
  }
  void mousePressed() {
    for ( Bouton B : B) {
      B.mousePressed();
    }
    if (B[0].Activ) {
      Aff = false;
      for (Etoiles E : Et) {
        E.E = true;
        E.AleAcc();
      }
    } else if (B[0].Activ) {
    } else if (B[0].Activ) {
    } else if (B[1].Activ) {
    } else if (B[2].Activ) { 
      C = new Credit(); 
      C.Affiche = true; 
      B[2].Activ =false;
    } else if (B[3].Activ) { 
      exit();
    }
  }

  void keyPressed() {
    switch(key) {
      case('D'):
      case('d'):
      Aff = false;
      break;
    }
  }
}

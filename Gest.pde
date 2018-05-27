/*********************************************************************************************************
 Titre du Programme : Gestion d'Attaque Spatiale (GAS)
 **********************************************************************************************************
 Date de création du programme : 23/01/2018
 **********************************************************************************************************
 Auteurs : Berenger Florian, Said Djambae
 
 Lycée : Pierre Termier
 **********************************************************************************************************
 Nom du fichier : Gest
 *********************************************************************************************************/
class Geste {
  Salle U;
  PImage[] Texture = new PImage[14];
  XML Fichier;
  int CptClque = 0, ID = 0, Type = 0, Index= 0;
  Boolean Trace = false, Choix = false;
  Salle Temp;

  Geste() {
    Fichier = loadXML("data/Fichier.xml");
    ID = Fichier.getInt("Cpt");
    //println(Fichier.getChildCount());
    Texture[13] = loadImage("Texture/PNG/Salle.png");
    for (int i = 0; i<7; i++) {
      Texture[i] = loadImage("Texture/PNG/Ico"+i+".png");
    }
    Texture[8] = loadImage("Texture/PNG/Couloir_.png");
    Texture[9] = loadImage("Texture/PNG/CouloirSPF_.png");
    Texture[10] = loadImage("Texture/PNG/CouloirSPO_.png");
    Texture[11] = loadImage("Texture/PNG/Couloir_.png");
    Texture[12] = loadImage("Texture/PNG/Sans air.png");
    U = new Salle(0, 0, 10, 10);
  }
  void draw() {
    Affichage();
    U.draw();
    U.Pos.x = mouseX;
    U.Pos.y = mouseY;
  }
  void mousePressed() {
    boolean Modif = false;
    //println(KEY +" "+CptClque);
    if (Trace) {
      if (verif() && key != 'e') {
        Choix= !Choix;
        Temp = U;
        Modif = true;
      } else if (key =='e') {
        println("Dele");
        XML Img = Fichier.getChild("Img"+Index);
        Fichier.removeChild(Img);
        ID--;
        for (int i = Index-1; i<ID; i++) {
          Img = Fichier.addChild("Img"+i);
          XML Im = Fichier.getChild("Img"+i+1);
          XML Po = Im.getChild("Pos");
          XML Pos =Img.addChild("Pos");
          Pos.setInt("X",Po.getInt("X"));
          Pos.setInt("Y", Po.getInt("Y"));
          Img.setInt("Type", Im.getInt("X"));
        }
      }

      if (!Choix && CptClque == 1 && !Modif ) {
        ID++;
        XML Img = Fichier.addChild("Img"+ID);
        Fichier.setInt("Cpt", ID);
        XML Pos =Img.addChild("Pos");
        Pos.setInt("X", mouseX);
        Pos.setInt("Y", mouseY);
        Img.setInt("Type", Type);
      }
    }
    //if (CptClque == 2) {
    //  XML Img =Fichier.getChild("Img"+ID);
    //  Img.setInt("Long", mouseX-Img.getChild("Pos").getInt("X"));
    //  Img.setInt("Larg", mouseY-Img.getChild("Pos").getInt("Y"));
    //  CptClque =0;
    //  println(Fichier.getChildCount());
    //  saveXML(Fichier, "data/Fichier.xml");
    //}
    //println("Save Cli : "+CptClque);
    saveXML(Fichier, "data/Fichier.xml");
    if (!M.Aff && !Trace) {
      if (CptClque == 0) {
        for (int i= 0; i<V.Salle.length; i++) {
          if (V.Salle[i].AuDessu()) {
            Choix = !Choix;
            Index = i;
            break;
          } else {
            //println("Rein trouver");
          }
        }
      }
      if (CptClque == 1 && Choix) {
        V.Salle[Index].DefPos(mouseX, mouseY);
        Choix = !Choix;
      }
    }
    if (CptClque >=1) {
      CptClque = 0;
    } else {
      CptClque++;
    }
  }
  void Affichage() {
    for (int i = 1; i<=ID; i++) {
      XML Img = Fichier.getChild("Img"+i);
      U = new Salle(Img.getChild("Pos").getInt("X"),Img.getChild("Pos").getFloat("Y"), int(V.Salle[0].Larg), int(V.Salle[0].Larg));    
      //Img.getInt("Long"),
      //Img.getInt("Larg"));
      U.DefType(Img.getInt("Type"));
      U.Texture = true;
      U.draw();
      //println(Img.getInt("Type"));
    }
  }

  void Redef(int Index, int X, int Y) {
    XML Img = Fichier.getChild("Img"+Index);
    Img.getChild("Pos").setInt("X", X);
    Img.getChild("Pos").setInt("Y", Y);
  }
  void keyPressed() {
    switch(key) {
    case '0':
      Type = 0;
      break;
    case '1':
      Type = 1;
      break;
    case '2':
      Type = 2;
      break;
    case '3':
      Type = 3;
      break;
    case '4':
      Type = 4;
      break;
    case '5':
      Type = 5;
      break;
    case '6':
      Type = 6;
      break;
    case '7':
      Type = 7;
      break;
    case '8':
      Type = 8;
      break;
    case '9':
      Type =9;
      break;
    case 'a':
      Type = 10;
      break;
    case 'b':
      Type = 11;
      break;
    case 'c':
      Type = 12;
      break;
    case 'T':
      Trace = !Trace;
    }
  }
  Boolean verif() {
    for (int i = 1; i<=ID; i++) {
      XML Img = Fichier.getChild("Img"+i);
      U = new Salle(Img.getChild("Pos").getInt("X"), Img.getChild("Pos").getFloat("Y"), int(V.Salle[0].Larg), int(V.Salle[0].Larg));    
      //Img.getInt("Long"),
      //Img.getInt("Larg"));
      U.DefType(Img.getInt("Type"));
      U.Texture = true;
      //U.draw();
      if (U.AuDessu()) {
        Temp = U;
        Index = i;
        return true;
      }
    }
    return false;
  }
}
//class Fil extends Thread {
//  boolean active, b = true;
//  Fil() {    
//    active = false;
//  }

//  void start() {
//    active = true;
//    super.start();
//  }
//  void run() {
//    while (true) {
//      if (active) {
//        execute();
//      } else {
//        break;
//      }
//    }
//  }
//  void execute() {
//    if(b)delay(1000);b=false;
//    for ( Bouton B : B) {
//      B.Long++;
//      B.Larg++;
//    }
//  }

//  boolean isActive() {
//    return active;
//  }

//  void quit() {
//    active = false;
//    interrupt();
//  }
//}
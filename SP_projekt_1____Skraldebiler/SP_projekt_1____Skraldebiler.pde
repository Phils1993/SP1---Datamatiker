// beskrivelse af projekt SP1 på dansk:
// jeg har valgt at lave tre forskellige skraldebiler, som kører på hverdage via. keypressed 1-5
// bilerne gør ophold i 2 sekunder. (der går lidt længere tid end to sek, måske ti sek)
// Bilerne har forskellig farve og terminalen udskriver tekst til hvilken bil, samt når bilerne gør ophold.
// Jeg kom på ideen, fordi jeg bor i Københavns kommune og der er meget skraldesortering :-).

// kommentar til min proces på SP1:
// i starten af mit projekt lavede jeg alle klasserne enkeltvis, men det viste sig at når
// jeg skulle kører switchen mellem dagene startede pap og plast ikke efter opholdet, og kun bio kørte, fordi den var første klasse (er mit gæt).
// derfor googlede jeg mig til at lave under kategorier (subclass)
// jeg synes det har været svært at få alle emner med, da jeg også ville have noget visuelt.

// Håber I kan lide


// Arrays
BioSkraldebil[] skraldebilBio = new BioSkraldebil[1];
PapSkraldebil[] skraldebilPap = new PapSkraldebil[1];
PlastSkraldebil[] skraldebilPlast = new PlastSkraldebil[1];

int dag = 0; //  This can be changed for the starting day 1-2-3-4-5.


void setup () {
  size (800, 800);

  // Makes the objekt, via info from the constructor
  for (int b = 0; b < skraldebilBio.length; b ++ ) {
    skraldebilBio[b] = new BioSkraldebil(color(26, 250, 8), 100, 200, 50, 100, 1);
  }

  // Makes the objekt, via info from the constructor
  for (int p = 0; p < skraldebilBio.length; p ++ ) {
    skraldebilPap [p] = new PapSkraldebil (color (173, 135, 98), 100, 400, 50, 100, 1);
  }

  // Makes the objekt, from the constructor
  for (int s = 0; s < skraldebilPlast.length; s ++) {
    skraldebilPlast[s] = new PlastSkraldebil (color (0, 127, 163), 100, 600, 50, 100, 1);
  }
}

void draw() {
  background (255);

  // decides which car that are driving on a specifik day.

  switch (dag) {
  case 1: // mandag - bio bliver hentet
    for (int b = 0; b < skraldebilBio.length; b++) {
      skraldebilBio[b].display();
      skraldebilBio[b].move();

      println(" Det er mandag og der bliver hentet bio affald");
    }
    break;

  case 2: // tirsdag pap bliver hentet
    for (int p = 0; p < skraldebilPap.length; p++) {
      skraldebilPap[p].display();
      skraldebilPap[p].move();

      println(" Det er tirsdag og der bliver hentet pap affald til genbrug :-)");
    }
    break;

  case 3: // onsdag - der er pause for bilerne
    println("Intet affald bliver hentet idag, da bilerne skal lade op pga. de kører på el");
    break;

  case 4: // torsdag alle bilerne kommer i dag
    for (int b = 0; b < skraldebilBio.length; b++) {
      skraldebilBio[b].display();
      skraldebilBio[b].move();
      // mgl. tekst
    }
    for (int p = 0; p < skraldebilPap.length; p++) {
      skraldebilPap[p].display();
      skraldebilPap[p].move();
      // mgl. tekst
    }
    for (int s = 0; s < skraldebilPlast.length; s++) {
      skraldebilPlast[s].display();
      skraldebilPlast[s].move();

      println(" Torsdagen er dagen hvor alle bilerne kommer for at hente affald - jubii");
    }
    break;

  case 5: // fredag - bio bliver hentet igen inden weekenden
    for ( int b = 0; b < skraldebilBio.length; b++) {
      skraldebilBio[b].display();
      skraldebilBio[b].move();

      println(" Fredag, inden weekenden kommer bio igen, så ens bio affald ikke skal lugte en hel weekend");
    }

  default: // default helps for the weekend where no cars are driving. If you put the int Dag = 0 you will get the default.
    println( " Ingen biler kommer i dag, for det er weekend");
    break;
  }
}

// KeyPressed between 1-2-3-4-5 decides what day the cars are coming.
void keyPressed() {
  switch (key) {
  case '1': // Mandag bio kører:
    dag = 1; // mandag
    //println(" Mandag - Bioskraldebilen kommer og henter bio affald");

    break;

  case '2': // tirsdag - pap henter skrald
    dag = 2;
    //println(" tirsdag: Det er pap dag og pap bilen kommer og henter skrald");
    break;

  case '3': // onsdag - onsdag er fri dag for bilerne og den skal lade op da de er på el
    dag = 3;

    break;

  case '4': // tordsdag - kommer alle tre biler efter affald
    dag = 4;

    break;

  case '5': // fredag - kommer bio  skraldebil og henter affald
    dag = 5;
    break;

  default:
    //println( "ingen biler kører i dag, da det er weekend");
    break;
  }
}

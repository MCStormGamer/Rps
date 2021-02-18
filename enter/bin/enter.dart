import 'dart:math';

double randomDouble() {
  Random randomObject = Random();

  int randomInt = randomObject.nextInt(1000);

  return randomInt / 10;
}

void main() {
  List<String> osebe = ["mare", "ne-mare", "se-bolj-ne-mare"];
  print(osebe[0]);
  print(osebe[1]);
  print(osebe[2]);
  // 1. definiramo spremenljivko za trenutno sobno temepraturo
  // 2. definiramo spremenljivko za normalno sobno temperaturo
  // 3. if stavki, ki užigajo/ugašajo klimo po potrebi

  double trenutnaTemperatura = randomDouble();
  print("trenutna temperatura: " + trenutnaTemperatura.toString());
  int zeljenaTemperatura = 24;

  if (trenutnaTemperatura < zeljenaTemperatura) {
    print("vklopi gretje");
  }

  if (trenutnaTemperatura > zeljenaTemperatura) {
    print("vklopi hlajenje");
  }

  if (trenutnaTemperatura == zeljenaTemperatura) {
    print("alles gutt");
  }

  Oseba marko = Oseba(
      ime: "Marko",
      priimek: "Dončič",
      starost: 25,
      lmao: "LMAO",
      lol: 6478,
      test: "f");

  print(marko.toString());

  Raom asd = Raom(hehe: "hehe boi");

  print(asd.toString());
}

class Oseba {
  int starost;
  String ime;
  String priimek;
  String lmao;
  int lol;
  String test;

  Oseba({this.starost, this.ime, this.priimek, this.lmao, this.lol, this.test});

  String toString() {
    return "$ime $priimek, $starost let star $ime $ime $lol $starost $lmao $test";
  }
}

class Raom {
  String hehe;

  Raom({this.hehe});

  String toString() {
    return "$hehe boi boi";
  }
}

//UPRASANJA :
//

import 'dart:io';
import 'dart:math';

enum RPS {
  rock,
  paper,
  scissors,
  nah,
}
final String INPUT_PROMPT = 'Rock, paper, scissors - which will it be? (r/p/s) ';
final String WRONG_INPUT = 'Please use one of the given options!';

void main() async {
  int computerPoints = 0;
  int playerPoints = 0;
  final String y = 'You chose';
  final String x = 'and computer chose';
  final String w = 'You won.';
  final String l = 'You lost.';
  final String d = 'It\'s a draw.';
  while (computerPoints < 10 && playerPoints < 10) {
    RPS myChoice = RPS.nah;
    RPS computersChoice;
    String input;
    final int randomInt = Random().nextInt(3); //TODO:move this into getComputersChoice

    myChoice = getChoice();

    while (myChoice == RPS.nah) {
      print(WRONG_INPUT);
      stdout.write(INPUT_PROMPT);
      input = stdin.readLineSync() ?? '';

      if (input == 'r') {
        myChoice = RPS.rock;
      } else if (input == 'p') {
        myChoice = RPS.paper;
      } else if (input == 's') {
        myChoice = RPS.scissors;
      } else {
        myChoice = RPS.nah;
      }
    }
    computersChoice = getComputersChoice(randomInt);

    if (myChoice == RPS.scissors && computersChoice == RPS.paper) {
      print('$y scissors $x paper. $w');
      playerPoints = playerPoints + 1;
    }
    if (myChoice == RPS.rock && computersChoice == RPS.scissors) {
      print('$y rock $x scissors. $w');
      playerPoints = playerPoints + 1;
    }
    if (myChoice == RPS.paper && computersChoice == RPS.rock) {
      print('$y paper $x rock. $w');
      playerPoints = playerPoints + 1;
    }
    if (myChoice == RPS.rock && computersChoice == RPS.paper) {
      print('$y rock $x paper. $l');
      computerPoints = computerPoints + 1;
    }
    if (myChoice == RPS.paper && computersChoice == RPS.scissors) {
      print('$y paper $x scissors. $l');
      computerPoints = computerPoints + 1;
    }
    if (myChoice == RPS.scissors && computersChoice == RPS.rock) {
      print('$y scissors $x rock. $l');
      computerPoints = computerPoints + 1;
    }
    if (myChoice == RPS.rock && computersChoice == RPS.rock) {
      print('$y rock $x rock. ');
    }
    if (myChoice == RPS.paper && computersChoice == RPS.paper) {
      print('$y paper $x paper. $d');
    }
    if (myChoice == RPS.scissors && computersChoice == RPS.scissors) {
      print('$y scissors $x scissors. $d');
    }
    if (myChoice == RPS.nah) {
      print(WRONG_INPUT);
      stdout.write(INPUT_PROMPT);
      input = stdin.readLineSync() ?? '';
    }
    printPoints(computerPoints: computerPoints, playerPoints: playerPoints);
  }
}

RPS getComputersChoice(int randomInt) {
  RPS computersChoice;
  switch (randomInt) {
    case 0:
      computersChoice = RPS.rock;
      break;
    case 1:
      computersChoice = RPS.paper;
      break;
    case 2:
      computersChoice = RPS.scissors;
      break;
    default:
      computersChoice = RPS.nah;
  }

  return computersChoice;
}

RPS getUsersChoice(String choice) {
  RPS usersChoice;
  switch (choice) {
    case 'r':
      usersChoice = RPS.rock;
      break;
    case 'p':
      usersChoice = RPS.paper;
      break;
    case 's':
      usersChoice = RPS.scissors;
      break;
    default:
      usersChoice = RPS.nah;
  }

  return usersChoice;
}

void printPoints({required int computerPoints, required int playerPoints}) {
  print('computers points : $computerPoints');
  print('players points : $playerPoints');
}

RPS getChoice() {
  String input;
  RPS myChoice;
  stdout.write(INPUT_PROMPT);
  input = stdin.readLineSync() ?? '';

  if (input == 'r') {
    myChoice = RPS.rock;
  } else if (input == 'p') {
    myChoice = RPS.paper;
  } else if (input == 's') {
    myChoice = RPS.scissors;
  } else {
    myChoice = RPS.nah;
  }
  return myChoice;
}

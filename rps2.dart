import 'dart:io';
import 'dart:math';

import 'package:cli_util/cli_logging.dart';

enum RPS {
  rock,
  paper,
  scissors,
  nah,
}
enum Result {
  rockIrock,
  rockIpaper,
  rockIscissors,
  paperIrock,
  paperIpaper,
  paperIscissors,
  scissorsIrock,
  scissorsIpaper,
  scissorsIscissors,
  nah
}

void main() async {
  Logger logger = Logger.verbose();

  logger.stdout('Hello world!');
  logger.trace('message 1');
  await new Future.delayed(new Duration(milliseconds: 200));
  logger.trace('message 2');
  logger.trace('message 3');

  Progress progress = logger.progress('doing some work');
  await new Future.delayed(new Duration(seconds: 2));
  progress.finish(showTiming: true);

  logger.stdout('All ${logger.ansi.emphasized('done')}.');
  //TODO: end game when user has 10 points
  // A very important change
  int computerPoints = 0;
  int playerPoints = 0;
  while (computerPoints < 10 && playerPoints < 10) {
    RPS myChoice;
    RPS computersChoice;
    String input;
    final int randomInt = Random().nextInt(3);
    Result result;
    stdout.write('Rock, paper, scissors - which will it be? (r/p/s) ');
    input = stdin.readLineSync();
    print('input is $input');
    if (input != 'r' || input != 'p' || input != 's') print('Please use one of the given options!');
    stdout.write('Rock, paper, scissors - which will it be? (r/p/s) ');
    if (input == 'r') {
      myChoice = RPS.rock;
    } else if (input == 'p') {
      myChoice = RPS.paper;
    } else if (input == 's') {
      myChoice = RPS.scissors;
    } else {
      myChoice = RPS.nah;
      input = stdin.readLineSync();
    }

    computersChoice = getComputersChoice(randomInt);
    // switch (randomInt) {
    //   case 0:
    //     computersChoice = RPS.rock;
    //     break;
    //   case 1:
    //     computersChoice = RPS.paper;
    //     break;
    //   case 2:
    //     computersChoice = RPS.scissors;
    //     break;
    // }
    if (myChoice == RPS.rock && computersChoice == RPS.rock) {
      print('You chose rock and computer chose rock. It\'s a draw.');
      result = Result.rockIrock;
    }
    if (myChoice == RPS.rock && computersChoice == RPS.paper) {
      print('You chose rock and computer chose paper. You lost.');
      result = Result.rockIpaper;
      computerPoints = computerPoints + 1;
    }
    if (myChoice == RPS.rock && computersChoice == RPS.scissors) {
      print('You chose rock and computer chose scissors. You won.');
      result = Result.rockIscissors;
      playerPoints = playerPoints + 1;
    }
    if (myChoice == RPS.paper && computersChoice == RPS.rock) {
      print('You chose paper and computer chose rock. You won.');
      result = Result.paperIrock;
      playerPoints = playerPoints + 1;
    }
    if (myChoice == RPS.paper && computersChoice == RPS.paper) {
      print('You chose paper and computer chose paper. It\'s a draw.');
      result = Result.paperIpaper;
    }
    if (myChoice == RPS.paper && computersChoice == RPS.scissors) {
      print('You chose paper and computer chose scissors. You lost.');
      result = Result.paperIscissors;
      computerPoints = computerPoints + 1;
    }
    if (myChoice == RPS.scissors && computersChoice == RPS.rock) {
      print('You chose scissors and computer chose rock. You lost.');
      result = Result.scissorsIrock;
      computerPoints = computerPoints + 1;
    }
    if (myChoice == RPS.scissors && computersChoice == RPS.paper) {
      print('You chose scissors and computer chose paper. You won.');
      result = Result.scissorsIpaper;
      playerPoints = playerPoints + 1;
    }
    if (myChoice == RPS.scissors && computersChoice == RPS.scissors) {
      print('You chose scissors and computer chose scissors. It\'s a draw.');
      result = Result.scissorsIpaper;
    }
    if (myChoice == RPS.nah) {
      print('nope nope ');
      result = Result.nah;
    }
    print(result);
    print('computers points : $computerPoints');
    print('players points : $playerPoints');
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
  }

  return usersChoice;
}

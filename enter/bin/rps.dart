import 'dart:math';

enum RPS {
  rock,
  paper,
  scissors,
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
}

void main() {
  int computerPoints = 0;
  int playerPoints = 0;
  while (true) {
    final RPS myChoice = RPS.rock;
    RPS computersChoice;
    final int randomInt = Random().nextInt(3);
    Result result;

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
    print(result);
    print('computers points : $computerPoints');
    print('player points : $playerPoints');
  }
}

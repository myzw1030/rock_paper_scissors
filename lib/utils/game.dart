import 'dart:math';

class Game {
  static int score = 0;

  static List<String> choices = [
    'Rock',
    'Paper',
    'Scissors',
  ];
  static String? randomChoice() {
    // ignore: unnecessary_new
    Random random = new Random();
    int robotChoiceIndex = random.nextInt(3);
    return choices[robotChoiceIndex];
  }
}

class Choice {
  String? type = '';
  static var gameRule = {
    'Rock': {
      'Rock': 'It\'s a Draw',
      'Paper': 'You Lose',
      'Scissors': 'You Win',
    },
    'Paper': {
      'Rock': 'You Win',
      'Paper': 'It\'s a Draw',
      'Scissors': 'You Lose',
    },
    'Scissors': {
      'Rock': 'You Lose',
      'Paper': 'You Win',
      'Scissors': 'It\'s a Draw',
    },
  };
  Choice(this.type);
}

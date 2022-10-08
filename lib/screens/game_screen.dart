import 'package:flutter/material.dart';
import 'package:rock_paper_scissors/screens/main_screen.dart';
import 'package:rock_paper_scissors/utils/game.dart';
import 'package:rock_paper_scissors/widgets/game_button.dart';

class GameScreen extends StatefulWidget {
  GameScreen(this.gameChoice, {Key? key}) : super(key: key);
  Choice gameChoice;
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    double btnWidth = MediaQuery.of(context).size.width / 2 - 40;
    String? robotChoice = Game.randomChoice();
    String robotChoicePath = '';
    switch (robotChoice) {
      case 'Rock':
        robotChoicePath = 'images/rock_btn.png';
        break;
      case 'Paper':
        robotChoicePath = 'images/paper_btn.png';
        break;
      case 'Scissors':
        robotChoicePath = 'images/scissor_btn.png';
        break;
      default:
    }

    String? playerChoice;
    switch (widget.gameChoice.type) {
      case 'Rock':
        playerChoice = 'images/rock_btn.png';
        break;
      case 'Paper':
        playerChoice = 'images/paper_btn.png';
        break;
      case 'Scissors':
        playerChoice = 'images/scissor_btn.png';
        break;
      default:
    }

    if (Choice.gameRule[widget.gameChoice.type]![robotChoice] == 'You Win') {
      setState(() {
        Game.score++;
      });
    }

    return Scaffold(
      backgroundColor: const Color(0xff060a47),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 34.0,
          horizontal: 20.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                  width: 5.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text(
                    'SCORE',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${Game.score}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            // ignore: sized_box_for_whitespace
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 2,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Hero(
                      tag: '${widget.gameChoice.type}',
                      child: gameButton(null, playerChoice!, btnWidth),
                    ),
                    const Text(
                      'VS',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26.0,
                      ),
                    ),
                    gameButton(null, robotChoicePath, btnWidth),
                  ],
                ),
              ),
            ),
            Text(
              '${Choice.gameRule[widget.gameChoice.type]![robotChoice]}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 36.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: RawMaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MainScreen(),
                    ),
                  );
                },
                padding: const EdgeInsets.all(16.0),
                shape: const StadiumBorder(
                  side: BorderSide(
                    color: Colors.white,
                    width: 5.0,
                  ),
                ),
                child: const Text(
                  'Play Again',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: RawMaterialButton(
                onPressed: () {},
                padding: const EdgeInsets.all(16.0),
                shape: const StadiumBorder(
                  side: BorderSide(
                    color: Colors.white,
                    width: 5.0,
                  ),
                ),
                child: const Text(
                  'RULES',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

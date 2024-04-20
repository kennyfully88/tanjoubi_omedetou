import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:tanjoubi_omedetou/layers/game_layer/game_square/game_square.dart';
import 'package:tanjoubi_omedetou/providers/game_logic.dart';

class GameLayer extends StatelessWidget {
  const GameLayer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                height: 64.0,
                padding: const EdgeInsets.all(8.0),
                child: const FittedBox(
                  alignment: Alignment.centerLeft,
                  child: Text('誕生日おめでとう'),
                ),
              ),
            ),
            Container(
              width: 64.0,
              height: 64.0,
              padding: const EdgeInsets.all(8.0),
              child: AspectRatio(
                aspectRatio: 1 / 1,
                child: Image.asset(
                  'assets/images/bday_mail.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Container(
              width: 64.0,
              height: 64.0,
              padding: const EdgeInsets.all(8.0),
              child: FittedBox(
                alignment: Alignment.centerLeft,
                child: Text(
                  'x${context.watch<GameLogic>().mailsObtained}',
                  style: const TextStyle(
                    fontSize: 48.0,
                  ),
                ),
              ),
            ),
          ],
        ),
        Expanded(
          child: Center(
            child: AspectRatio(
              aspectRatio: 1 / 1,
              child: GridView.builder(
                padding: const EdgeInsets.all(8.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemCount: 9,
                itemBuilder: (BuildContext context, int index) {
                  return GameSquare(index: index);
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:tanjoubi_omedetou/providers/game_logic.dart';

class GameSquare extends StatefulWidget {
  const GameSquare({
    super.key,
    required this.index,
  });

  final int index;

  @override
  State<GameSquare> createState() => _GameSquareState();
}

class _GameSquareState extends State<GameSquare> {
  bool tappedItem = false;

  @override
  Widget build(BuildContext context) {
    GameStatus gameStatus = context.watch<GameLogic>().gameStatus;
    int item = context.watch<GameLogic>().gameItemsList[widget.index];

    if (gameStatus == GameStatus.beforeGame && tappedItem == true) {
      tappedItem = false;
    }

    return GestureDetector(
      onTap: () {
        if (tappedItem) return;

        setState(() {
          tappedItem = true;
          context.read<GameLogic>().checkGameSquare(widget.index);
        });
      },
      child: Container(
        margin: const EdgeInsets.all(8.0),
        child: tappedItem && item == 0
            ? Image.asset('assets/images/pepper.png')
            : tappedItem && item == 1
                ? Image.asset('assets/images/bday_mail.png')
                : Image.asset('assets/images/present_bag.png'),
      ),
    );
  }
}

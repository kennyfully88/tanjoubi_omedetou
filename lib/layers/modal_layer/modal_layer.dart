import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:tanjoubi_omedetou/layers/modal_layer/game_modal/game_modal.dart';
import 'package:tanjoubi_omedetou/layers/modal_layer/win_modal/win_modal.dart';
import 'package:tanjoubi_omedetou/providers/game_logic.dart';

class ModalLayer extends StatelessWidget {
  const ModalLayer({super.key});

  @override
  Widget build(BuildContext context) {
    GameStatus gameStatus = context.watch<GameLogic>().gameStatus;

    Widget renderModal() {
      if (gameStatus == GameStatus.beforeGame) {
        return GameModal(
            title: '遊び方',
            message:
                'プレゼント袋を開けてメールトークンを集めてください。メールトークンを３枚集めれば勝ちです。でもチリペッパーが出たら、負けです。',
            buttonText: 'はい',
            action: () {
              context.read<GameLogic>().resetGame();
              context.read<GameLogic>().setGameStatus(GameStatus.inGame);
            });
      }

      if (gameStatus == GameStatus.win) {
        return WinModal(
            title: '勝ち',
            message: 'キミは特別な人です！良い誕生日になりますように！そして、神様がキミにたくさんの誕生日で祝福しますように!',
            buttonText: 'もう一度プレイする',
            action: () {
              context.read<GameLogic>().resetGame();
              context.read<GameLogic>().setGameStatus(GameStatus.beforeGame);
            });
      }

      if (gameStatus == GameStatus.lose) {
        return GameModal(
            title: '負け',
            message: 'チリーペッパーは辛すぎるからいいプレゼントじゃないよ。',
            buttonText: 'はい',
            action: () {
              context.read<GameLogic>().setGameStatus(GameStatus.beforeGame);
            });
      }

      return Container();
    }

    return renderModal();
  }
}

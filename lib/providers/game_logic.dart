import 'dart:math';

import 'package:flutter/widgets.dart';

enum GameStatus { beforeGame, inGame, win, lose }

class GameLogic extends ChangeNotifier {
  List<int> _gameItemsList = [0, 0, 0, 0, 0, 0, 0, 0, 0];

  int _mailsObtained = 0;
  GameStatus _gameStatus = GameStatus.beforeGame;

  List<int> get gameItemsList => _gameItemsList;

  int get mailsObtained => _mailsObtained;
  GameStatus get gameStatus =>
      mailsObtained >= 3 ? GameStatus.win : _gameStatus;

  void setGameStatus(GameStatus selectedGameStatus) {
    if (_gameStatus == selectedGameStatus) return;
    _gameStatus = selectedGameStatus;
    notifyListeners();
  }

  void setGameItemsList() {
    _gameItemsList = [];
    int bdayMailSet = 0;

    for (int i = 0; i < 9; i++) {
      int rng = Random().nextInt(2);
      if (rng == 0) {
        _gameItemsList.add(0);
      }

      if (rng == 1) {
        _gameItemsList.add(1);
        bdayMailSet++;
      }
    }

    if (bdayMailSet < 3) {
      setGameItemsList();
    } else {
      notifyListeners();
    }
  }

  void resetGame() {
    _gameStatus = GameStatus.beforeGame;
    _mailsObtained = 0;
    setGameItemsList();
  }

  void checkGameSquare(int index) {
    if (gameItemsList[index] == 0) setGameStatus(GameStatus.lose);
    if (gameItemsList[index] == 1) _mailsObtained++;
    notifyListeners();
  }
}

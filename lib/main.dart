import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:tanjoubi_omedetou/layers/game_layer/game_layer.dart';
import 'package:tanjoubi_omedetou/layers/modal_layer/modal_layer.dart';
import 'package:tanjoubi_omedetou/providers/game_logic.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => GameLogic()),
      ],
      child: const TanjoubiOmedetouApp(),
    ),
  );
}

class TanjoubiOmedetouApp extends StatelessWidget {
  const TanjoubiOmedetouApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: DefaultTextStyle(
        style: const TextStyle(
          color: Color(0xFF000000),
          fontFamily: 'kosugi_maru',
        ),
        child: Container(
          color: const Color(0xFF00DFFF),
          child: SafeArea(
            child: Center(
              child: Container(
                color: const Color(0xFFB2E8FF),
                width: 720.0,
                child: const Stack(
                  children: [
                    GameLayer(),
                    ModalLayer(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

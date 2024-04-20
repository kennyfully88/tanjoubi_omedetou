import 'package:flutter/widgets.dart';
import 'package:tanjoubi_omedetou/components/standard_button/standard_button.dart';

class GameModal extends StatefulWidget {
  const GameModal({
    super.key,
    required this.title,
    required this.message,
    required this.buttonText,
    required this.action,
  });

  final String title;
  final String message;
  final String buttonText;
  final Function action;

  @override
  State<GameModal> createState() => _GameModalState();
}

class _GameModalState extends State<GameModal>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 500),
    vsync: this,
  )..forward();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      child: Container(
        color: const Color(0xC0000000),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFFFFFFFF),
              borderRadius: BorderRadius.circular(45.0),
            ),
            width: 384.0,
            height: 384.0,
            margin: const EdgeInsets.all(8.0),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 48.0,
                  child: FittedBox(
                    child: Text(widget.title),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      widget.message,
                      style: const TextStyle(fontSize: 28.0),
                    ),
                  ),
                ),
                StandardButton(
                  action: widget.action,
                  buttonText: widget.buttonText,
                ),
              ],
            ),
          ),
        ),
      ),
      builder: (BuildContext context, Widget? child) {
        return Opacity(
          opacity: _controller.value,
          child: child,
        );
      },
    );
  }
}

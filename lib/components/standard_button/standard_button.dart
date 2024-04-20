import 'package:flutter/widgets.dart';

class StandardButton extends StatefulWidget {
  const StandardButton({
    super.key,
    required this.action,
    required this.buttonText,
  });

  final Function action;
  final String buttonText;

  @override
  State<StandardButton> createState() => _StandardButtonState();
}

class _StandardButtonState extends State<StandardButton> {
  bool isPressing = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.action();
      },
      onTapDown: (tapDownDetails) {
        setState(() {
          isPressing = true;
        });
      },
      onTapUp: (tapUpDetails) {
        setState(() {
          isPressing = false;
        });
      },
      onTapCancel: () {
        setState(() {
          isPressing = false;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        decoration: BoxDecoration(
          color: isPressing ? const Color(0xFF000080) : const Color(0xFF0000FF),
          borderRadius: BorderRadius.circular(50.0),
        ),
        width: double.infinity,
        height: 64.0,
        padding:
            isPressing ? const EdgeInsets.all(10.0) : const EdgeInsets.all(8.0),
        child: FittedBox(
          child: Text(
            widget.buttonText,
            style: const TextStyle(
              color: Color(0xFFFFFFFF),
            ),
          ),
        ),
      ),
    );
  }
}

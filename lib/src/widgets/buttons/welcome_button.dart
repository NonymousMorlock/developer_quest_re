import '../../../src/style.dart';
import '../../widgets/buttons/wide_button.dart';
import 'package:flutter/material.dart';

/// A styled button that animates its accent color.
class WelcomeButton extends StatefulWidget {
  final Widget? child;
  final Color background;
  final IconData? icon;
  final String label;
  final double fontSize;
  final VoidCallback onPressed;
  const WelcomeButton({
    Key? key,
    this.child,
    required this.onPressed,
    required this.background,
    this.icon,
    required this.label,
    this.fontSize = 16,
  }) : super(key: key);

  @override
  State<WelcomeButton> createState() => _WelcomeButtonState();
}

class _WelcomeButtonState extends State<WelcomeButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Color?> _colorTween;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3100),
    );
    _colorTween = ColorTween(begin: widget.background, end: widget.background)
        .animate(_animationController);
    super.initState();
  }

  @override
  void didUpdateWidget(WelcomeButton oldWidget) {
    setState(() {
      _colorTween = ColorTween(begin: _colorTween.value, end: widget.background)
          .animate(_animationController);
      _animationController.reset();
      _animationController.forward();
    });
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) => WideButton(
            onPressed: widget.onPressed,
            background: _colorTween.value!,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Padding(
                          padding: const EdgeInsets.only(right: 13),
                          child: Icon(
                            widget.icon,
                            size: widget.fontSize,
                            color: Colors.white.withOpacity(0.5),
                          ),
                        ),
                  Text(widget.label.toUpperCase(),
                      style: buttonTextStyle.apply(
                          color: Colors.white,
                          fontSizeDelta:
                              widget.fontSize - buttonTextStyle.fontSize!))
                ],
              ),
            ),
          ),
    );
  }
}

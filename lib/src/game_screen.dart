import '../../../src/rpg_layout_builder.dart';
import 'package:flutter/material.dart';
import 'game_screen_slim.dart';
import 'game_screen_wide.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RpgLayoutBuilder(
      builder: (context, layout) =>
          layout == RpgLayout.slim ? const GameScreenSlim() : const GameScreenWide(),
    );
  }
}

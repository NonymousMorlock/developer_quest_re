import '../../../src/shared_state/game/skill.dart';
import '../../../src/style.dart';
import '../../../flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class SkillIcon extends StatelessWidget {
  final double width;
  final double height;
  final Skill skill;
  final double opacity;
  final Color color;
  const SkillIcon(this.skill,
      {this.width = 19,
      this.height = 16,
      this.opacity = 1,
      this.color = Colors.white,
      super.key,});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: FlareActor(skillFlareIcon[skill],
          color: color.withOpacity(opacity),
          alignment: Alignment.topCenter,
          shouldClip: false,
          fit: BoxFit.contain,
          animation: 'idle'),
    );
  }
}

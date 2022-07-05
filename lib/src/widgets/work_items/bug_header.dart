import '../../../src/shared_state/game/bug.dart';
import '../../../src/shared_state/game/skill.dart';
import '../../../src/style.dart';
import '../../../src/widgets/work_items/skill_dot.dart';
import 'package:flutter/material.dart';

/// Indicator for bug list items. Shows skills necessary to fix the bug.
class BugHeader extends StatelessWidget {
  final Bug bug;

  const BugHeader(this.bug, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.bug_report, color: bugColor),
        Expanded(child: Container()),
        for (Skill skill in bug.skillsNeeded) SkillDot(skill)
      ],
    );
  }
}

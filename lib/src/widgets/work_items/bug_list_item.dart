import '../../../src/shared_state/game/bug.dart';
import '../../../src/shared_state/game/work_item.dart';
import '../../../src/style.dart';
import '../../../src/widgets/work_items/bug_header.dart';
import '../../../src/widgets/work_items/work_list_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Displays a [Bug] that can be tapped on to assign it to a team.
class BugListItem extends StatelessWidget {
  const BugListItem({super.key});
  @override
  Widget build(BuildContext context) {
    var bug = Provider.of<WorkItem>(context) as Bug;

    return WorkListItem(
      workItem: bug,
      isExpanded: bug.isBeingWorkedOn,
      progressColor: bugColor,
      heading: !bug.isComplete
          ? BugHeader(bug)
          : const Icon(Icons.bug_report, color: disabledColor),
    );
  }
}

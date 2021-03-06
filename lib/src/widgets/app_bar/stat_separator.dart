import 'package:flutter/material.dart';

import '../../style.dart';

/// A widget to place between [StatBadge] widgets to show clear
/// separation between them.
class StatSeparator extends StatelessWidget {
  const StatSeparator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1,
      color: statsSeparatorColor,
    );
  }
}

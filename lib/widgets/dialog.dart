import 'dart:math';

import 'package:flutter/material.dart';

/// AlertDialog.content に指定する
/// SizedBox で横幅を良い感じに調整したウィジェット。
class CommonAlertDialogContent extends StatelessWidget {
  const CommonAlertDialogContent({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: min(
        MediaQuery.of(context).size.width,
        300,
      ),
      child: child,
    );
  }
}

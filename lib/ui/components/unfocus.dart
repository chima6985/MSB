import 'package:flutter/material.dart';

/// {@template b_unfocus}
/// A widget that unfocus everything when tapped.
///
/// This implements the 'Unfocus when tapping in empty space'
/// behavior for the entire application.
/// {@endtemplate}
class Unfocus extends StatelessWidget {
  /// {@macro b_unfocus}
  const Unfocus({
    super.key,
    required this.child,
  });

  /// Child widget.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: child,
    );
  }
}

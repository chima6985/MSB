import 'package:flutter/material.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';

class GameLivesWidget extends StatelessWidget {
  const GameLivesWidget({
    super.key,
    required this.totalLives,
    required this.livesRemaining,
  });

  final int totalLives, livesRemaining;

  @override
  Widget build(BuildContext context) {
    final lives = <Widget>[];

    for (var i = 0; i < totalLives - livesRemaining; i++) {
      lives.add(
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: AppAssets.images.svgs.heartSlash.svg(),
        ),
      );
    }

    for (var i = 0; i < livesRemaining; i++) {
      lives.add(
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: AppAssets.images.svgs.heart.svg(),
        ),
      );
    }

    return Row(
      children: lives,
    );
  }
}

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:masoyinbo_mobile/extension/extension.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';

class DecoratedContainer extends StatefulWidget {
  const DecoratedContainer({
    super.key,
    required this.child,
    this.enablePadding = false,
    this.isAnimate = false,
    this.canPop = true,
  });

  final Widget child;
  final bool enablePadding;
  final bool isAnimate;
  final bool canPop;

  @override
  State<DecoratedContainer> createState() => _DecoratedContainerState();
}

class _DecoratedContainerState extends State<DecoratedContainer>
    with TickerProviderStateMixin {
  final rX = Random().nextDouble();
  final rY = Random().nextDouble();

  late AnimationController _controller;
  late Animation<double> _randomTweenAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _randomTweenAnimation = Tween<double>(begin: 1 * rX, end: 0 * rY).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.fastEaseInToSlowEaseOut,
      ),
    );

    if (widget.isAnimate) {
      Future.delayed(1.5.seconds, () {
        SchedulerBinding.instance.addPostFrameCallback((_) {
          _controller.repeat(reverse: true);
        });
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mqr = MediaQuery.of(context).size;
    return PopScope(
      canPop: widget.canPop,
      child: Material(
        child: AnimatedBuilder(
          animation: _randomTweenAnimation,
          builder: (context, child) {
            return Stack(
              children: [
                Opacity(
                  opacity: context.isTablet ? 0.4 : 1,
                  child: Container(
                    width: mqr.width,
                    height: mqr.height,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AppAssets.images.jpegs.bgPattern.provider(),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                if (widget.isAnimate) ...[
                  Positioned(
                    bottom: 300.h,
                    right: -100.w * _randomTweenAnimation.value,
                    child: Container(
                      width: 220.w,
                      height: 220.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.green62.withValues(alpha: 0.3),
                            blurRadius: 120,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 230.h,
                    left: -50.w * _randomTweenAnimation.value,
                    child: Container(
                      width: 197.w,
                      height: 197.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.lilacD2.withValues(alpha: 0.8),
                            blurRadius: 120,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -250.h * _randomTweenAnimation.value,
                    left: 1.w,
                    child: Container(
                      width: 400.w,
                      height: 400.w,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.blue12,
                            blurRadius: 330,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
                Padding(
                  padding: widget.enablePadding
                      ? EdgeInsets.symmetric(horizontal: 23.w)
                      : EdgeInsets.zero,
                  child: widget.child,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

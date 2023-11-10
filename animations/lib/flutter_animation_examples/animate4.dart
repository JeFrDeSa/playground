import 'dart:async';

import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';

/// Implements the Flutter animation example: animation4
/// https://docs.flutter.dev/ui/animations/tutorial
///
/// Every time the Animation generates a new value, the build() method of the
/// transition widget will be called. The AnimationBuilder defines the actual
/// transition and acts in between the child and its parent widget. It allows
/// to separate the animation logic from the child widget that will be animated.
class FlutterAnimationExample4 extends StatefulWidget {
  /// Creates a [_ClickAbleContainer], which increases and decreases its size.
  /// A Text information is indicating the upcoming resp. current container state.
  const FlutterAnimationExample4({super.key});

  @override
  State<FlutterAnimationExample4> createState() =>
      _FlutterAnimationExample4State();
}

class _FlutterAnimationExample4State extends State<FlutterAnimationExample4>
    with TickerProviderStateMixin {
  bool _isExpanded = false;

  // region Layout 1
  final _smallHeight = 200.0;

  // endregion

  // region Layout 2
  final _bigHeight = 300.0;

  // endregion

  late Animation<double> _containerAnimation;
  late AnimationController _containerAnimationController;

  late Animation<double> _containerStateIndicatorAnimation;
  late AnimationController _indicatorAnimationController;

  @override
  void initState() {
    super.initState();
    _initContainerAnimation();
    _initContainerStateIndicatorAnimation();
  }

  @override
  void dispose() {
    _indicatorAnimationController.dispose();
    _containerAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 24),
        Text(
          "Flutter animation4 example.",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 24),
        Expanded(
          child: Container(
            alignment: Alignment.center,
            child: GrowTransition(
              animation: _containerAnimation,
              child: _createClickAbleContainer(
                color: Colors.grey,
                onTap: () {
                  if (_isExpanded) {
                    _indicatorAnimationController.reverse();
                  } else {
                    _indicatorAnimationController.forward();
                  }
                },
                child: Align(
                  alignment: Alignment.center,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      OpacityTransition(
                        animation: _containerStateIndicatorAnimation,
                        isInverted: true,
                        child: SizedBox(
                          child: Text(
                            "M I N",
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                      ),
                      OpacityTransition(
                        animation: _containerStateIndicatorAnimation,
                        child: SizedBox(
                          child: Text(
                            "M A X",
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // region Helper

  void _initContainerAnimation() {
    _containerAnimationController = AnimationController(
      duration: 500.milliseconds,
      vsync: this,
    );
    _containerAnimation = Tween<double>(begin: _smallHeight, end: _bigHeight)
        .animate(_containerAnimationController);
  }

  void _initContainerStateIndicatorAnimation() {
    _indicatorAnimationController = AnimationController(
      duration: 250.milliseconds,
      vsync: this,
    );
    _containerStateIndicatorAnimation = Tween<double>(begin: 0.0, end: 1.0)
        .animate(_indicatorAnimationController);

    _containerStateIndicatorAnimation.addStatusListener((status) async {
      final finalStates = [
        AnimationStatus.dismissed,
        AnimationStatus.completed,
      ];

      if (finalStates.contains(status)) {
        await Future<void>.delayed(
          250.milliseconds,
          () {
            if (_isExpanded) {
              _containerAnimationController.reverse();
            } else {
              _containerAnimationController.forward();
            }
          },
        );

        _isExpanded = !_isExpanded;
      }
    });
  }

  Widget _createClickAbleContainer({
    required void Function()? onTap,
    Color? color,
    Widget? child,
  }) {
    return Container(
      color: color,
      child: InkWell(
        onTap: onTap,
        child: child,
      ),
    );
  }

// endregion
}

class GrowTransition extends StatelessWidget {
  final Animation<double> animation;
  final Widget child;

  const GrowTransition({
    required this.animation,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return SizedBox(
          height: animation.value,
          width: animation.value * 0.5,
          child: child,
        );
      },
      child: child,
    );
  }
}

class OpacityTransition extends StatelessWidget {
  final Animation<double> animation;
  final Widget child;
  final bool isInverted;

  const OpacityTransition({
    required this.animation,
    required this.child,
    this.isInverted = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Opacity(
          opacity: isInverted ? 1 - animation.value : animation.value,
          child: child,
        );
      },
      child: child,
    );
  }
}

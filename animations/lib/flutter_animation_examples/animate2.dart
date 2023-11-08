import 'dart:async';

import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';

/// Implements the Flutter animation example: animation2
/// https://docs.flutter.dev/ui/animations/tutorial
///
/// The AnimatedWidget base class allows to separate the core widget logic from
/// the animation logic. The Animation status listener provides the state change
/// notification to indicate a completed state change.
class FlutterAnimationExample2 extends StatefulWidget {
  /// Creates a [_ClickAbleContainer], which increases and decreases its size.
  const FlutterAnimationExample2({super.key});

  @override
  State<FlutterAnimationExample2> createState() =>
      _FlutterAnimationExample2State();
}

class _FlutterAnimationExample2State extends State<FlutterAnimationExample2>
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
          "Flutter animation2 example.",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 24),
        Expanded(
          child: Container(
            alignment: Alignment.center,
            child: _ClickAbleContainer(
              animation: _containerAnimation,
              color: Colors.indigoAccent,
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
                    _OpacityContainer(
                      animation: _containerStateIndicatorAnimation,
                      isInverted: true,
                      child: SizedBox(
                        child: Text(
                          "MIN",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                    ),
                    _OpacityContainer(
                      animation: _containerStateIndicatorAnimation,
                      child: SizedBox(
                        child: Text(
                          "MAX",
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

// endregion
}

class _ClickAbleContainer extends AnimatedWidget {
  final void Function()? onTap;
  final Color? color;
  final Widget? child;

  const _ClickAbleContainer({
    required Animation<double> animation,
    this.onTap,
    this.color,
    this.child,
    Key? key,
  }) : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Container(
      width: animation.value * 0.5,
      height: animation.value,
      color: color,
      child: InkWell(
        onTap: onTap,
        child: child,
      ),
    );
  }
}

class _OpacityContainer extends AnimatedWidget {
  final Widget? child;
  final bool isInverted;

  const _OpacityContainer({
    required Animation<double> animation,
    this.isInverted = false,
    this.child,
    Key? key,
  }) : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Opacity(
      opacity: isInverted ? 1 - animation.value : animation.value,
      child: child,
    );
  }
}

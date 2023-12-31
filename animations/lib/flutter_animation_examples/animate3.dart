import 'dart:async';

import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';

/// Implements the Flutter animation example: animation3
/// https://docs.flutter.dev/ui/animations/tutorial
///
/// Every time the Animation generates a new value, the build() method of the
/// child widget with base class AnimatedWidget will be called. The Animation
/// status listener provides the state change notification to indicate a
/// completed state change.
class FlutterAnimationExample3 extends StatefulWidget {
  /// Creates a [_ClickAbleContainer], which increases and decreases its size.
  /// A Text information is indicating the upcoming resp. current container state.
  const FlutterAnimationExample3({super.key});

  @override
  State<FlutterAnimationExample3> createState() =>
      _FlutterAnimationExample3State();
}

class _FlutterAnimationExample3State extends State<FlutterAnimationExample3>
    with TickerProviderStateMixin {
  bool _isExpanded = false;

  // region Layout 1
  final _smallHeight = 50.0;

  // endregion

  // region Layout 2
  final _bigHeight = 150.0;

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
      children: [
        const SizedBox(height: 24),
        Text(
          "Animation 3",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 24),
        Container(
          height: _bigHeight,
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
                        "M I N",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                  ),
                  _OpacityContainer(
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
      height: animation.value,
      width: animation.value,
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

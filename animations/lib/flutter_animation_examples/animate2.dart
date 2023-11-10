import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';

/// Implements the Flutter animation example: animation2
/// https://docs.flutter.dev/ui/animations/tutorial
///
/// Every time the Animation generates a new value, the build() method of the
/// child widget with base class AnimatedWidget will be called. This allows to
/// remove the addListener() and setState() during the Animation initialisation
/// and the separating of the child widget and its animation logic from the
/// parent widget.
class FlutterAnimationExample2 extends StatefulWidget {
  /// Creates a [_ClickAbleContainer], which increases and decreases its size.
  const FlutterAnimationExample2({super.key});

  @override
  State<FlutterAnimationExample2> createState() =>
      _FlutterAnimationExample2State();
}

class _FlutterAnimationExample2State extends State<FlutterAnimationExample2>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = false;

  // region Layout 1
  final _smallHeight = 200.0;

  // endregion

  // region Layout 2
  final _bigHeight = 300.0;

  // endregion

  late Animation<double> _containerAnimation;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      duration: 500.milliseconds,
      vsync: this,
    );
    _containerAnimation = Tween<double>(begin: _smallHeight, end: _bigHeight)
        .animate(animationController);
  }

  @override
  void dispose() {
    animationController.dispose();
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
              color: Colors.red,
              onTap: () {
                if (_isExpanded) {
                  animationController.reverse();
                  _isExpanded = false;
                } else {
                  animationController.forward();
                  _isExpanded = true;
                }
              },
              child: const SizedBox(),
            ),
          ),
        ),
      ],
    );
  }
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

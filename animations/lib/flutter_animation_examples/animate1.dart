import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';

/// Implements the Flutter animation example: animation1
/// https://docs.flutter.dev/ui/animations/tutorial
///
/// The AnimatedWidget base class allows to separate the core widget logic from
/// the animation logic.
class FlutterAnimationExample1 extends StatefulWidget {
  /// Creates a clickable container, which increases and decreases its size.
  const FlutterAnimationExample1({super.key});

  @override
  State<FlutterAnimationExample1> createState() =>
      _FlutterAnimationExample1State();
}

class _FlutterAnimationExample1State extends State<FlutterAnimationExample1>
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
          "Flutter animation1 example.",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 24),
        Expanded(
          child: Container(
            alignment: Alignment.center,
            child: ClickAbleContainer(
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
            ),
          ),
        ),
      ],
    );
  }
}

class ClickAbleContainer extends AnimatedWidget {
  final void Function()? onTap;
  final Color? color;
  final Widget? child;

  const ClickAbleContainer({
    required Animation<double> animation,
    this.onTap,
    this.color,
    this.child,
    super.key,
  }) : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Container(
      width: animation.value * 0.5,
      height: animation.value,
      color: color,
      child: InkWell(
        onTap: onTap,
        child: const SizedBox(),
      ),
    );
  }
}

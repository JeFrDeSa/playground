import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';

/// Implements the Flutter animation example: animation5
/// https://docs.flutter.dev/ui/animations/tutorial
///
/// Every time the Animation generates a new value, the build() method of the
/// transition widget will be called. It uses the animation value to determine
/// the locale defined Tween value for the related widget attribute. This allows
/// to animate various widget attributes based on different Tween values.
class FlutterAnimationExample5 extends StatefulWidget {
  /// Creates a [_ClickAbleContainer], which increases and decreases its size.
  /// A Text information is indicating the upcoming resp. current container state.
  const FlutterAnimationExample5({super.key});

  @override
  State<FlutterAnimationExample5> createState() =>
      _FlutterAnimationExample5State();
}

class _FlutterAnimationExample5State extends State<FlutterAnimationExample5>
    with TickerProviderStateMixin {
  bool _isExpanded = false;

  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: 500.milliseconds,
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.linear,
    )..addStatusListener((state) {
        final finalStates = [
          AnimationStatus.dismissed,
          AnimationStatus.completed,
        ];
        if (finalStates.contains(state)) {
          // This is used to animated the container content. The method
          // setState() is actually not required for the animation of the
          // container size and opacity as described in the original tutorial.
          setState(() {
            _isExpanded = !_isExpanded;
          });
        }
      });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 24),
        Text(
          "Flutter animation5 example.",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 24),
        Container(
          alignment: Alignment.center,
          child: TransitionAnimation(
            animation: _animation,
            child: _createClickAbleContainer(
              color: Colors.teal,
              onTap: () {
                if (_isExpanded) {
                  _animationController.reverse();
                } else {
                  _animationController.forward();
                }
              },
              child: Align(
                alignment: Alignment.center,
                child: AnimatedCrossFade(
                  crossFadeState: _isExpanded
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  duration: 250.milliseconds,
                  firstChild: SizedBox(
                    child: Text(
                      "${DateTime.now().hour.toString()}:${DateTime.now().minute.toString()}",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  secondChild: Text(
                    "--:--",
                    style: Theme.of(context).textTheme.bodyLarge,
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

class TransitionAnimation extends StatelessWidget {
  final Animation<double> animation;
  final Widget child;

  const TransitionAnimation({
    required this.animation,
    required this.child,
    super.key,
  });

  static final _sizeTween = Tween<double>(begin: 75.0, end: 100.0);
  static final _opacityTween = Tween<double>(begin: 0.25, end: 1.0);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return SizedBox(
          height: _sizeTween.evaluate(animation) * 0.5,
          width: _sizeTween.evaluate(animation),
          child: Opacity(
            opacity: (_opacityTween.evaluate(animation).abs()),
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}

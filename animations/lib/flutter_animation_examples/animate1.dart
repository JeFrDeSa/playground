import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';

/// Implements the Flutter animation example: animation1
/// https://docs.flutter.dev/ui/animations/tutorial
///
/// Every time the Animation generates a new value, the addListener() function
/// calls setState(), which marks the current frame dirty and forces build() to
/// be called again.
class FlutterAnimationExample1 extends StatefulWidget {
  /// Creates a clickable container, which increases and decreases its size.
  const FlutterAnimationExample1({super.key});

  @override
  State<FlutterAnimationExample1> createState() =>
      _FlutterAnimationExample1State();
}

/// Use [SingleTickerProviderStateMixin] because ...
/// "When creating an AnimationController, you pass it a vsync argument. The
/// presence of vsync prevents offscreen animations from consuming unnecessary
/// resources. You can use your stateful object as the vsync by adding
/// SingleTickerProviderStateMixin to the class definition."
class _FlutterAnimationExample1State extends State<FlutterAnimationExample1>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = false;

  // region Layout 1
  final _smallHeight = 50.0;

  // endregion

  // region Layout 2
  final _bigHeight = 150.0;

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
        .animate(animationController)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 24),
        Text(
          "Animation 1",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 24),
        Container(
          height: _bigHeight,
          alignment: Alignment.center,
          child: Container(
            width: _containerAnimation.value * 0.75,
            height: _containerAnimation.value,
            color: Colors.green,
            child: InkWell(
              child: const SizedBox(),
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

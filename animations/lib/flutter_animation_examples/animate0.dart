import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';

/// Implements the Flutter animation example: animation0
/// https://docs.flutter.dev/ui/animations/tutorial
///
/// Every time the Animation generates a new value, the addListener() function
/// calls setState(), which marks the current frame dirty and forces build() to
/// be called again.
class FlutterAnimationExample0 extends StatefulWidget {
  /// Creates a clickable container, which increases and decreases its size.
  const FlutterAnimationExample0({super.key});

  @override
  State<FlutterAnimationExample0> createState() =>
      _FlutterAnimationExample0State();
}

/// Use [SingleTickerProviderStateMixin] because ...
/// "When creating an AnimationController, you pass it a vsync argument. The
/// presence of vsync prevents offscreen animations from consuming unnecessary
/// resources. You can use your stateful object as the vsync by adding
/// SingleTickerProviderStateMixin to the class definition."
class _FlutterAnimationExample0State extends State<FlutterAnimationExample0>
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
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 24),
        Text(
          "Flutter animation0 example.",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 24),
        Expanded(
          child: Container(
            alignment: Alignment.center,
            child: Container(
              width: _containerAnimation.value * 0.5,
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
        ),
      ],
    );
  }
}

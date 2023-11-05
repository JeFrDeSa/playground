import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';

enum Layout { one, two }

/// Implements the Flutter animation example: animation0
/// https://docs.flutter.dev/ui/animations/tutorial
class FlutterAnimationExample0 extends StatefulWidget {
  /// Creates several separated spaces that will be animated during the
  /// different tutorial steps (animation0 - animation5).
  const FlutterAnimationExample0({super.key});

  @override
  State<FlutterAnimationExample0> createState() =>
      _FlutterAnimationExample0State();
}

class _FlutterAnimationExample0State extends State<FlutterAnimationExample0>
    with SingleTickerProviderStateMixin {
  Layout _currentLayout = Layout.one;

  final _layoutPadding = 10.0;

  // region Layout 1
  final _playBarHeightLayout1 = 0.225;

  // endregion

  // region Layout 2
  final _playBarHeightLayout2 = 0.35;

  // endregion

  late double _topLayoutHeight;
  late double _bottomLayoutHeight;

  late double _titleImageSize;
  late double _titleInformationWidth;

  late double _titleListHeight;
  late double _titleListWidth;
  late double _settingsButtonSize;
  late double _favouriteDirectoriesListHeight;
  late double _favouriteDirectoriesListWidth;
  late double _playBarHeight;
  late double _playBarWidth;

  late Animation<double> playBarHeightAnimation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(duration: 500.milliseconds, vsync: this);
    playBarHeightAnimation =
        Tween<double>(begin: _playBarHeightLayout1, end: _playBarHeightLayout2)
            .animate(controller)
          ..addListener(() {
            setState(() {});
          });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: LayoutBuilder(
        builder: (context, constraints) {
          _setupLayoutSpace1(
            maxHeight: constraints.maxHeight,
            maxWidth: constraints.maxWidth,
          );
          _setupTopLayout1(
            maxHeight: constraints.maxHeight,
            maxWidth: constraints.maxWidth,
          );

          return Column(
            children: [
              SizedBox(
                height: _topLayoutHeight,
                width: constraints.maxWidth,
                child: Flex(
                  direction: Axis.horizontal,
                  children: [
                    Container(
                      height: _titleImageSize,
                      width: _titleImageSize,
                      color: Colors.blueGrey,
                    ),
                    Container(
                      height: _topLayoutHeight,
                      width: _titleInformationWidth,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
              SizedBox(height: _layoutPadding),
              SizedBox(
                height: _bottomLayoutHeight,
                width: constraints.maxWidth,
                child: LayoutBuilder(builder: (context, constraints) {
                  _setupBottomLayout1(
                    maxHeight: constraints.maxHeight,
                    maxWidth: constraints.maxWidth,
                  );

                  return Stack(
                    children: [
                      _positionedContainer(
                        left: 0,
                        top: 0,
                        height: _titleListHeight,
                        width: _titleListWidth,
                        color: Colors.blue,
                      ),
                      _positionedContainer(
                        right: 0,
                        top: 0,
                        height: _settingsButtonSize,
                        width: _settingsButtonSize,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_currentLayout == Layout.one) {
                              controller.forward();
                              _currentLayout = Layout.two;
                            } else {
                              controller.reverse();
                              _currentLayout = Layout.one;
                            }
                          },
                          child: Icon(
                            _currentLayout == Layout.one
                                ? Icons.keyboard_double_arrow_up_rounded
                                : Icons.keyboard_double_arrow_down_rounded,
                          ),
                        ),
                      ),
                      _positionedContainer(
                        right: 0,
                        top: _settingsButtonSize + _layoutPadding,
                        height: _favouriteDirectoriesListHeight,
                        width: _favouriteDirectoriesListWidth,
                        color: Colors.green,
                      ),
                      _positionedContainer(
                        left: 0,
                        bottom: 0,
                        height: _playBarHeight,
                        width: _playBarWidth,
                        color: Colors.amber,
                      ),
                    ],
                  );
                }),
              ),
            ],
          );
        },
      ),
    );
  }

  /// Setup the general height for the top and bottom layout one.
  _setupLayoutSpace1({required double maxHeight, required double maxWidth}) {
    _topLayoutHeight = maxHeight * 0.2;
    _bottomLayoutHeight = maxHeight - _topLayoutHeight - _layoutPadding;
  }

  /// Setup the title image and title information space of layout one.
  void _setupTopLayout1({
    required double maxHeight,
    required double maxWidth,
  }) {
    // The title image is square sized as big as the title layout.
    _titleImageSize = _topLayoutHeight;
    // The remaining title layout space is preserved for the title information.
    _titleInformationWidth = maxWidth - _titleImageSize;
  }

  /// Setup the bottom space for the title list, play bar and settings of layout
  /// one.
  void _setupBottomLayout1({
    required double maxHeight,
    required double maxWidth,
  }) {
    _titleListHeight = maxHeight * 0.75;
    _titleListWidth = maxWidth * 0.75;

    _settingsButtonSize = maxWidth * 0.225;

    _favouriteDirectoriesListHeight =
        maxHeight - _settingsButtonSize - _layoutPadding;
    _favouriteDirectoriesListWidth = maxWidth * 0.225;

    _playBarHeight = maxHeight * playBarHeightAnimation.value;
    _playBarWidth = _titleListWidth;
  }

  Widget _positionedContainer({
    required double height,
    required double width,
    Color? color,
    Widget? child,
    double? left,
    double? top,
    double? right,
    double? bottom,
  }) {
    return Positioned(
      left: left,
      top: top,
      right: right,
      bottom: bottom,
      child: Container(
        width: width,
        height: height,
        color: color,
        child: child,
      ),
    );
  }
}

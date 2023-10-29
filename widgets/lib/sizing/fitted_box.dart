import 'package:flutter/material.dart';

/// "Constraints go down. Sizes go up. Parent sets position."
/// https://docs.flutter.dev/ui/layout/constraints
///
/// However, since the parent tells its children the constraints, which are the
/// minimum and maximum size each child can have, the child cannot have any size
/// it wants. It must be within those constraints.
///
/// If the parent tells a child it can have a minimum and a maximum of 10 pixels,
/// the parent is telling the child its size, as the only answer a child can give
/// is 10 pixels. This is called a "tight" constraint (e.g. [Expands])
///
/// A [Flexible] widget tells the child to have at maximum the same size as
/// itself, but the minimum will be set to 0. This is called a "loose" constraint.
class LooseAndTightConstraintWidget extends StatelessWidget {
  /// Creates several [FittedBox] and [Flexible] widgets to
  /// illustrate the behaviour of different fit configurations.
  const LooseAndTightConstraintWidget({super.key});

  final randomText = "12345";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _boxFitNone(context),
          const SizedBox(height: 40),
          _boxFitFitWidthLong(context),
          const SizedBox(height: 20),
          _boxFitFitWidthShort(context),
          const SizedBox(height: 40),
          _boxFitLoose(context),
          const SizedBox(height: 40),
          _boxFitTight(context),
        ],
      ),
    );
  }

  // With none fitting the child will force its size by ignoring the
  // actual parent boundary.
  Widget _boxFitNone(BuildContext context) {
    return FittedBox(
      fit: BoxFit.none,
      child: _testObject(
        context,
        Colors.lightBlue,
        "$randomText - FittedBox(BoxFit.none) - $randomText",
      ),
    );
  }

  // With fitWidth fitting the child is forced to stay within the parent
  // width boundary by ignoring its actual size.
  Widget _boxFitFitWidthLong(BuildContext context) {
    return FittedBox(
      fit: BoxFit.fitWidth,
      child: _testObject(
        context,
        Colors.lightBlue,
        "FittedBox(BoxFit.fitWidth): $randomText",
      ),
    );
  }

  // With fitWidth fitting the child can have its actual size if enough
  // space is provided by the parent.
  Widget _boxFitFitWidthShort(BuildContext context) {
    return FittedBox(
      fit: BoxFit.fitWidth,
      child: _testObject(
        context,
        Colors.lightBlue,
        "FittedBox(BoxFit.fitWidth)",
      ),
    );
  }

  // FlexFit.loose allows the children to use only the space in the
  // parents flex direction that is required.
  Widget _boxFitLoose(BuildContext context) {
    return Flexible(
      fit: FlexFit.loose,
      child: _testObject(
        context,
        Colors.lightGreen,
        "Flexible(FlexFit.loose): $randomText",
      ),
    );
  }

  // FlexFit.tight will force the children to use the entire space in
  // the parents flex direction that is available.
  Widget _boxFitTight(BuildContext context) {
    return Flexible(
      fit: FlexFit.tight,
      child: _testObject(
        context,
        Colors.lightGreen,
        "Flexible(FlexFit.tight): $randomText",
      ),
    );
  }

  Widget _testObject(BuildContext context, Color background, String message) {
    return Container(
      color: background,
      child: Text(
        message,
        style: Theme.of(context).textTheme.headlineLarge,
      ),
    );
  }
}

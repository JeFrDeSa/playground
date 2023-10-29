import 'package:flutter/material.dart';
import 'package:state_management/bloc/bloc.dart';

/// A custom implementation of the BLoC provider logic.
/// Provides the bloc attribute to to all widgets that
/// are related to the provider.
class BlocProvider<T extends Bloc<Object>> extends InheritedWidget {
  final T bloc;

  /// Creates a BlocProvider for the given BLoC and [Widget].
  const BlocProvider({
    super.key,
    required this.bloc,
    required Widget child,
  }) : super(child: child);

  /// Returns the related BLoC of the BlocProvider.
  static T of<T extends Bloc<Object>>(BuildContext context) {
    final BlocProvider<T>? result =
        context.dependOnInheritedWidgetOfExactType<BlocProvider<T>>();
    assert(result != null, 'No ${T.toString()} found in the given context');
    return result!.bloc;
  }

  @override
  bool updateShouldNotify(BlocProvider oldWidget) {
    return bloc != oldWidget.bloc;
  }
}

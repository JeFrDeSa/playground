import 'dart:async';

/// A custom implementation of the BLoC state management logic.
/// Allows to [emit] a given state to all listeners of the [stateStream]. Can
/// intercept and manipulate states by a given mapper function via [select].
abstract class Bloc<T> {
  Bloc(this._state);

  late final _streamController = StreamController<T>.broadcast();

  T _state;

  /// Provides the current state of the BLoC
  T get state => _state;

  /// Sets the current state of the BLoC to the given state argument. Emits the
  /// state to all listeners of the [stateStream] of the BLoC.
  void emit(T state) {
    _state = state;
    _streamController.add(state);
  }

  /// Provides the distinct state stream of the BLoC
  Stream<T> get stateStream => _streamController.stream.distinct();

  /// Transforms the events of the [stateStream] based on the given mapper
  /// function. Returns a new distinct state stream.
  Stream<R> select<R>(R Function(T) mapper) =>
      stateStream.map(mapper).distinct();
}

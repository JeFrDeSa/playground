import 'package:state_management/bloc/bloc.dart';

class CounterBloc extends Bloc<int> {
  CounterBloc() : super(0);

  void increment() => emit(state + 1);

  void decrement() => emit(state - 1);
}

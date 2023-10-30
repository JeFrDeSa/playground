import 'package:flutter/material.dart';
import 'package:state_management/bloc/bloc_provider.dart';
import 'package:state_management/bloc_implementation/counter_bloc.dart';

class _CounterBlocPageKeys {
  const _CounterBlocPageKeys._();

  final pageKey = const ValueKey("counter-bloc-page");
}

class CounterBlocPage extends StatefulWidget {
  static const keys = _CounterBlocPageKeys._();

  const CounterBlocPage({super.key});

  @override
  State<CounterBlocPage> createState() => _CounterBlocPageState();
}

class _CounterBlocPageState extends State<CounterBlocPage> {
  @override
  Widget build(BuildContext context) {
    final counterBloc = BlocProvider.of<CounterBloc>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        StreamBuilder(
          stream: counterBloc.stateStream,
          builder: (context, snapshot) => Text(
            "CounterBLoC state #${counterBloc.state}",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        const SizedBox(height: 64),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                counterBloc.decrement();
              },
              child: const Icon(Icons.remove),
            ),
            const SizedBox(width: 24),
            ElevatedButton(
              onPressed: () {
                counterBloc.increment();
              },
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ],
    );
  }
}

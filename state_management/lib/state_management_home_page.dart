import 'package:app/widgets/home_page.dart';
import 'package:flutter/material.dart';
import 'package:state_management/bloc/bloc_provider.dart';
import 'package:state_management/bloc_implementation/counter_bloc.dart';
import 'package:state_management/pages/counter_bloc_page.dart';

class _StateManagementHomePageKeys {
  const _StateManagementHomePageKeys._();

  final pageKey = const ValueKey("state-management-home-page");
  final counterBlocPageKey = const ValueKey("counter-bloc-page");
}

class StateManagementHomePage extends StatefulWidget {
  static const keys = _StateManagementHomePageKeys._();

  final pages = [
    BlocProvider(
      key: keys.counterBlocPageKey,
      bloc: CounterBloc(),
      child: CounterBlocPage(key: CounterBlocPage.keys.pageKey),
    ),
    const Placeholder(color: Colors.red),
    const Placeholder(color: Colors.green),
    const Placeholder(color: Colors.blue),
  ];

  StateManagementHomePage({Key? key}) : super(key: key);

  @override
  State<StateManagementHomePage> createState() =>
      _StateManagementHomePageState();
}

class _StateManagementHomePageState extends State<StateManagementHomePage> {
  @override
  Widget build(BuildContext context) {
    return HomePage(
      subPageTitle: 'State Management',
      pages: widget.pages,
    );
  }
}

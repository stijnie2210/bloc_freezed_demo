import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linting_test/bloc/counter_bloc.dart';
import 'package:linting_test/injection.dart';

void main() {
  configureDependencies();
  runApp(const TestApp());
}

class TestApp extends StatefulWidget {
  const TestApp({super.key});

  @override
  State<TestApp> createState() => _TestAppState();
}

class _TestAppState extends State<TestApp> {
  final bloc = di<CounterBloc>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test app',
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CounterBloc, CounterState>(
              bloc: bloc,
              builder: (context, state) {
                return Text('counter: ${state.counter}');
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () => bloc.add(const CounterEvent.decrement()),
                  child: const Text('Decrement'),
                ),
                TextButton(
                  onPressed: () => bloc.add(const CounterEvent.increment()),
                  child: const Text('Increment'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

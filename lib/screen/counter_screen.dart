import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_learn/provider/counter_async_notifier.dart';
// import 'package:riverpod_learn/provider/counter_notifier_provider.dart';
// import 'package:riverpod_learn/provider/counter_state_provider.dart';

class CounterScreen extends ConsumerStatefulWidget {
  const CounterScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CounterScreenState();
}

class _CounterScreenState extends ConsumerState<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    // final counter = ref.watch(counterStateProvider);
    // final counter = ref.watch(counterNotifierProvider);
    final counterAsync = ref.watch(counterAsyncNotifier);

    return Scaffold(
      appBar: AppBar(
        title: Text("Counter Screen"),
      ),
      body: Column(
        children: [
          counterAsync.when(
            data: (data) =>
                Text("You have pushed the button this many times: $data"),
            error: (error, stackTrace) => Text("$error"),
            loading: () => CircularProgressIndicator(),
          ),
          // Text("You have pushed the button this many times: ${counter}"),
          // Text(
          //   "$counter",
          //   style: Theme.of(context).textTheme.bodyMedium,
          // )
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            onPressed: () {
              // ref.read(counterStateProvider.notifier).state++;
              // ref.read(counterNotifierProvider.notifier).increment();
              ref.read(counterAsyncNotifier.notifier).increment();
            },
            tooltip: "Increment",
            child: Icon(Icons.add),
          ),
          SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            onPressed: () {
              // ref.read(counterStateProvider.notifier).state--;
              // ref.read(counterNotifierProvider.notifier).decrement();
              ref.read(counterAsyncNotifier.notifier).decrement();
            },
            tooltip: "Decrement",
            child: Icon(Icons.horizontal_rule),
          ),
          SizedBox(
            width: 10,
          ),
          SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            onPressed: () {
              // ref.read(counterStateProvider.notifier).state--;
              // ref.read(counterNotifierProvider.notifier).reset();
              ref.read(counterAsyncNotifier.notifier).reset();
            },
            tooltip: "Reset",
            child: Icon(Icons.restore),
          ),
        ],
      ),
    );
  }
}

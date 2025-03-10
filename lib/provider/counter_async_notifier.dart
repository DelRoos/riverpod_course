import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterAsyncNotifier =
    AsyncNotifierProvider<CounterAsyncNotifier, int>(CounterAsyncNotifier.new);

class CounterAsyncNotifier extends AsyncNotifier<int> {
  @override
  FutureOr<int> build() async {
    final value = await Future.delayed(Duration(seconds: 2), () => 0);
    return value;
  }

  Future<void> increment() async {
    state = const AsyncLoading();
    final value =
        await Future.delayed(Duration(seconds: 2), () => state.value) ?? 0;

    state = AsyncValue.data(value + 1);
  }

  Future<void> decrement() async {
    state = AsyncLoading();
    final value =
        await Future.delayed(Duration(seconds: 3), () => state.value) ?? 0;
    state = AsyncValue.data(value - 1);
  }

  Future<void> reset() async {
    state = AsyncLoading();

    // final value = await Future.delayed(Duration(seconds: 2), () => 0);
    state = await AsyncValue.guard(() async {
      return Future.error(Exception("Failed to reset data"));
      // return Future.delayed(Duration(seconds: 2), () => 0);
    });
  }
}

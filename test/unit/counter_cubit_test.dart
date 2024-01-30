import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_counter_cubit/data/counter_cubit_implementation.dart';

void main() {
  group("counter cubit", () {
    blocTest<CounterCubitImplementation, int>("emits [1] when incremented",
        build: () => CounterCubitImplementation(),
        act: (counter) => counter.increment(),
        expect: () => [1]);

    blocTest<CounterCubitImplementation, int>(
      "emits [-1] when decremented",
      build: () => CounterCubitImplementation(),
      act: (counter) => counter.decrement(),
      expect: () => [-1],
    );
  });
}

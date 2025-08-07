import 'package:bloc_test/bloc_test.dart';
import 'package:bloc_tut/cubit/counter_cubit.dart';
import 'package:flutter_test/flutter_test.dart';



void main() {
  group('CounterCubit', () {
    late CounterCubit counterCubit;

    setUp(() {
      counterCubit = CounterCubit();
    });

    test('the initial state of the CounterCubit is CounterState(counterValue: 0)', () {
      expect(counterCubit.state.counterValue, 0);
    });

    blocTest<CounterCubit, CounterState>(
      'emits CounterState(counterValue: 1) when increment is called',
      build: () => counterCubit,
      act: (cubit) => cubit.increment(),
      expect: () => [CounterState(counterValue: 1, wasIncremented: true)],
    );

    blocTest<CounterCubit, CounterState>(
      'emits CounterState(counterValue: -1) when decrement is called',
      build: () => counterCubit,
      act: (cubit) => cubit.decrement(),
      expect: () => [CounterState(counterValue: -1, wasIncremented: false)],
    );
  });
}
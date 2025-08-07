part of 'counter_cubit.dart';

// ignore: must_be_immutable
class CounterState extends Equatable {
  ///here we define  what we want to emit and in this case we want to emit the counter value
  final int counterValue;
  bool wasIncremented;

  CounterState({required this.counterValue, required this.wasIncremented});

  @override
  List<Object?> get props => [counterValue, wasIncremented];
}

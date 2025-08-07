// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  /// Initialize the counter with a default value of 0
  /// This is the constructor for the CounterCubit class, which extends Cubit with CounterState
  CounterCubit() : super(CounterState(counterValue: 0, wasIncremented: false));

///here we define the methods that will be used to change the state of the counter
void increment()=> emit(CounterState(counterValue: state.counterValue+1, wasIncremented: true));
void decrement() => emit(CounterState(counterValue: state.counterValue-1, wasIncremented: false));

}

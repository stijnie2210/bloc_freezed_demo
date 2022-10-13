import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'counter_event.dart';
part 'counter_state.dart';
part 'counter_bloc.freezed.dart';

@injectable
class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState(counter: 0)) {
    on<_Increment>((event, emit) {
      emit(state.copyWith(counter: state.counter + 1));
    });
    on<_Decrement>((event, emit) {
      emit(state.copyWith(counter: state.counter - 1));
    });
  }
}

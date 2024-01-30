
import 'package:flutter_bloc/flutter_bloc.dart';

import '../domain/counter_cubit.dart';

class CounterCubitImplementation extends Cubit<int> implements CounterCubit {
  CounterCubitImplementation() : super(0);

  @override
  void increment() => emit(state + 1);
  @override
  void decrement() => emit(state - 1);
}

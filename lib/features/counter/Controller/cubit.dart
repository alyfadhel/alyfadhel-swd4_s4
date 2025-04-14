import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swd4_s4/features/counter/Controller/state.dart';

class CounterCubit extends Cubit<CounterStates>
{
  CounterCubit():super(CounterInitialState());

  static CounterCubit get(context)=>BlocProvider.of(context);

  int count = 0;

  void increaseCount()
  {
    count ++;
    emit(CounterIncreaseState(count));
  }

  void decreaseCount()
  {
    count --;
    emit(CounterDecreaseState(count));
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swd4_s4/features/counter/Controller/cubit.dart';
import 'package:swd4_s4/features/counter/Controller/state.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=> CounterCubit(),
      child: BlocConsumer<CounterCubit,CounterStates>(
        listener: (context, state) {
          if(state is CounterIncreaseState) {
            print(state.count);
          }

          if(state is CounterDecreaseState) {
            print(state.count);
          }
        },
        builder: (context, state) {
          var cubit = CounterCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blue,
              toolbarHeight: 80.0,
              title: Text(
                'Counter App',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            body: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      cubit.decreaseCount();
                    },
                    icon: Icon(
                      Icons.remove,
                      size: 50.0,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Text(
                    cubit.count.toString(),
                    style: TextStyle(
                      fontSize: 100.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  IconButton(
                    onPressed: ()
                    {
                      cubit.increaseCount();
                    },
                    icon: Icon(
                      Icons.add,
                      size: 50.0,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

}


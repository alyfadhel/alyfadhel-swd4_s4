import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swd4_s4/core/layout/todo_layout/controller/cubit.dart';
import 'package:swd4_s4/core/layout/todo_layout/controller/state.dart';
import 'package:swd4_s4/core/shared/widgets/todo_widgets/build_task_item.dart';
import 'package:swd4_s4/core/shared/widgets/todo_widgets/build_tasks.dart';


class NewScreen extends StatelessWidget {
  const NewScreen({super.key});

  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        var tasks = AppCubit.get(context).newTasks;
        return BuildTasks(tasks: tasks);
      },
    );

  }
}



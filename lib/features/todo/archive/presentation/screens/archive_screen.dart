import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swd4_s4/core/layout/todo_layout/controller/cubit.dart';
import 'package:swd4_s4/core/layout/todo_layout/controller/state.dart';
import 'package:swd4_s4/core/shared/widgets/todo_widgets/build_tasks.dart';


class ArchiveScreen extends StatelessWidget {
  const ArchiveScreen({super.key});

  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        var tasks = AppCubit.get(context).archiveTasks;
        return BuildTasks(tasks: tasks);
      },
    );

  }
}



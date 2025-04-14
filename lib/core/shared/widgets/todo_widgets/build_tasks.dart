import 'package:flutter/material.dart';
import 'package:swd4_s4/core/shared/widgets/todo_widgets/build_task_item.dart';

class BuildTasks extends StatelessWidget
{
  final List<dynamic> tasks;

  const BuildTasks({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    if (tasks.isNotEmpty) {
      return ListView.separated(
        itemBuilder: (context, index) => BuildTaskItem(model: tasks[index]),
        separatorBuilder:
            (context, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Divider(height: 1.0, color: Colors.grey, thickness: 1.5),
            ),
        itemCount: tasks.length,
      );
    } else
    {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'No Tasks Yet',
              style: TextStyle(
                fontSize: 50.0,
                fontWeight: FontWeight.bold,
                color: Colors.grey[300],
              ),
            ),
            Icon(Icons.menu, size: 100.0, color: Colors.grey[300]),
          ],
        ),
      );
    }
  }
}

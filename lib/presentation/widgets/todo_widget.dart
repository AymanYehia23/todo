import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/core/strings.dart';
import 'package:todo/logic/todos_provider.dart';
import 'package:todo/presentation/widgets/snack_bar_widget.dart';

import '../../data/models/todo.dart';

class TodoWidget extends ConsumerWidget {
  const TodoWidget({
    super.key,
    required this.task,
    required this.index,
  });
  final Todo task;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void updateTask() async {
      String msg =
          await ref.read(todosProvider.notifier).updateTodo(task, index);
      if (task.isLocal && context.mounted) {
        showSnackBar(
          context,
          msg: 'Updated Local Task',
        );
      }
      if (msg != Strings.succeeded && context.mounted) {
        showSnackBar(context, msg: msg);
      }
    }

    void deleteTask() async {
      String msg = await ref.read(todosProvider.notifier).deleteTodo(
            todo: task,
            index: index,
          );
      if (task.isLocal && context.mounted) {
        showSnackBar(
          context,
          msg: 'Deleted Local Task',
        );
      }
      if (msg != Strings.succeeded && context.mounted) {
        showSnackBar(context, msg: msg);
      }
    }

    return CheckboxListTile(
      secondary: IconButton(
        onPressed: deleteTask,
        icon: CircleAvatar(
          backgroundColor: Colors.redAccent.withOpacity(0.1),
          radius: 16.r,
          child: const Icon(
            Icons.delete_outline,
            color: Colors.redAccent,
          ),
        ),
      ),
      title: Text(
        task.todo,
        style: TextStyle(
          color: Colors.black,
          fontSize: 16.sp,
          decoration:
              task.completed ? TextDecoration.lineThrough : TextDecoration.none,
        ),
      ),
      value: task.completed,
      onChanged: (_) => updateTask(),
    );
  }
}

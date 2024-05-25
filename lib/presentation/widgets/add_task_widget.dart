import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/core/strings.dart';
import 'package:todo/logic/todos_provider.dart';
import 'package:todo/presentation/widgets/snack_bar_widget.dart';

class AddTaskWidget extends ConsumerStatefulWidget {
  const AddTaskWidget({super.key});

  @override
  ConsumerState<AddTaskWidget> createState() => _AddTaskWidgetState();
}

class _AddTaskWidgetState extends ConsumerState<AddTaskWidget> {
  @override
  void initState() {
    super.initState();
    taskInputController.clear();
  }

  @override
  void dispose() {
    taskInputController.dispose();
    super.dispose();
  }

  void addTask() async {
    String taskInput = taskInputController.text;
    taskInputController.clear();
    isEmptyField = true;
    FocusScope.of(context).unfocus();
    String msg = await ref.read(todosProvider.notifier).addTodo(taskInput);
    if (msg != Strings.succeeded && mounted) {
      showSnackBar(context, msg: msg);
    }
  }
  var taskInputController = TextEditingController();
  bool isEmptyField = true;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Column(
        children: [
          SizedBox(
            height: 50.h,
            child: TextField(
              controller: taskInputController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Add new task...',
              ),
              //check if there is a string to add
              onChanged: (value) {
                if (value.isEmpty) {
                  setState(() {
                    isEmptyField = true;
                  });
                } else {
                  setState(() {
                    isEmptyField = false;
                  });
                }
              },
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          InkWell(
            onTap: isEmptyField ? null : addTask,
            child: Container(
              height: 50.h,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: isEmptyField ? Colors.grey.shade600 : Colors.deepPurple,
              ),
              alignment: Alignment.center,
              child: const Text(
                'ADD TASK',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

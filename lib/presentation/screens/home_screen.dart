import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/logic/todos_provider.dart';

import '../../core/strings.dart';
import '../widgets/add_task_widget.dart';
import '../widgets/empty_tasks_list_widget.dart';
import '../widgets/todo_widget.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  late Future<String> _todosData;
  @override
  void initState() {
    super.initState();
    _todosData = ref.read(todosProvider.notifier).getAllTodos();
  }

  @override
  Widget build(BuildContext context) {
    final todos = ref.watch(todosProvider);
    //check if the keyboard is opened
    bool isKeyboard = MediaQuery.of(context).viewInsets.bottom > 0;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          Strings.appBarTitle,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Center(
              child: FutureBuilder(
                future: _todosData,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  //check if the request didn't succeed
                  //and show the error message
                  if (snapshot.data != Strings.succeeded) {
                    return Center(
                      child: Text(
                        snapshot.data!,
                        style: TextStyle(
                          fontSize: 16.sp,
                        ),
                      ),
                    );
                  }
                  if (todos.isEmpty) {
                    return const EmptyTasksListWidget();
                  }
                  return ListView.builder(
                    itemCount: todos.length,
                    itemBuilder: (ctx, index) => TodoWidget(
                      task: todos[index],
                      index: index,
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          const Divider(),
          Expanded(
            flex: isKeyboard ? 2 : 1,
            child: const AddTaskWidget(),
          ),
        ],
      ),
    );
  }
}

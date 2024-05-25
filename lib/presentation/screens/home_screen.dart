import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:todo/logic/todos_provider.dart';

import '../../core/strings.dart';
import '../../data/models/todo.dart';
import '../widgets/add_task_widget.dart';
import '../widgets/empty_tasks_list_widget.dart';
import '../widgets/todo_widget.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  List<Todo> todos = [];
  String msg = '';
  bool isLoading = false;
  final scrollController = ScrollController();

  Future<void> getTodos() async {
    setState(() {
      isLoading = true;
    });
    msg = await ref.read(todosProvider.notifier).getTodos();
    setState(() {
      isLoading = false;
      todos = ref.read(todosProvider);
    });
  }

  void loadMoreData() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      getTodos();
    }
  }

  @override
  void initState() {
    super.initState();
    scrollController.addListener(loadMoreData);
    getTodos();
  }

  @override
  Widget build(BuildContext context) {
    //check if the keyboard is opened
    todos = ref.watch(todosProvider);
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
            child: Builder(
              builder: (context) {
                if (todos.isEmpty && isLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (msg != Strings.succeeded) {
                  return Center(
                    child: Text(
                      msg,
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
                  physics: const AlwaysScrollableScrollPhysics(),
                  shrinkWrap: false,
                  controller: scrollController,
                  itemCount: todos.length,
                  itemBuilder: (ctx, index) {
                    if (todos.length < 10) {
                      ref.read(todosProvider.notifier).getTodos();
                    }
                    return Column(
                      children: [
                        TodoWidget(
                          task: todos[index],
                          index: index,
                        ),
                        if (index == todos.length - 1 && isLoading)
                          
                          const Padding(
                            padding: EdgeInsets.all(10),
                            child: SpinKitThreeBounce(
                              color: Colors.deepPurple,
                              size: 40,
                            ),
                          ),
                      ],
                    );
                  },
                );
              },
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

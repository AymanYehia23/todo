import 'package:todo/core/strings.dart';
import 'package:todo/data/http/http_service.dart';
import 'package:todo/data/models/todo.dart';

import '../repositories/todo_repos.dart';

class AddTodoApi implements AddTodoRepo {
  @override
  Future<Todo> addTodo({required Todo newTodo}) async {
    final res = await HttpService.postRequest(
      endPoint: Strings.addTodo,
      data: newTodo.toMap(),
    );
    return Todo.fromJson(res.data);
  }
}

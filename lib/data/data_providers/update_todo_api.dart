import 'package:todo/core/strings.dart';
import 'package:todo/data/http/http_service.dart';
import 'package:todo/data/models/todo.dart';
import '../repositories/todo_repos.dart';

class UpdateTodoApi implements UpdateTodoRepo {
  @override
  Future<Todo> updateTodo({required int id, required bool completed}) async {
    final res = await HttpService.putRequest(
      endPoint: Strings.updateDeleteTodo(id),
      data: {
        'completed': completed,
      },
    );
    return Todo.fromJson(res.data);
  }
}

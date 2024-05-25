import 'package:todo/core/strings.dart';
import 'package:todo/data/http/http_service.dart';
import 'package:todo/data/models/todo.dart';
import '../repositories/todo_repos.dart';

class GetTodosApi implements GetTodosRepo {
  @override
  Future<List<Todo>> getAllTodos() async {
    List<Todo> todos = [];
    final response = await HttpService.getRequest(endPoint: Strings.getAllTodos);
    response.data['todos'].forEach((todo) {
      todos.add(Todo.fromJson(todo));
    });
    
    return todos;
  }
}

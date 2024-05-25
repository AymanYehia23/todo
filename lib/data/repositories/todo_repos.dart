import '../models/todo.dart';

abstract class GetTodosRepo {
  Future<dynamic> getTodos({int skip});
}

abstract class AddTodoRepo {
  Future<Todo> addTodo({required Todo newTodo});
}

abstract class UpdateTodoRepo {
  Future<Todo> updateTodo({required int id, required bool completed});
}

abstract class DeleteTodoRepo {
  Future<bool> deleteTodo({required int id});
}

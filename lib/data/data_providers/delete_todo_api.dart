import 'package:todo/core/strings.dart';
import 'package:todo/data/http/http_service.dart';

import '../repositories/todo_repos.dart';

class DeleteTodoApi implements DeleteTodoRepo {
  @override
  Future<bool> deleteTodo({required int id}) async {
    final res = await HttpService.deleteRequest(
      endPoint: Strings.updateDeleteTodo(id),
    );
    return res.data['isDeleted'];
  }
}

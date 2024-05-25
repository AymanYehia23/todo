import 'package:todo/core/strings.dart';
import 'package:todo/data/http/http_service.dart';
import '../repositories/todo_repos.dart';

class GetTodosApi implements GetTodosRepo {
  @override
  Future<dynamic> getTodos({int skip = 0}) async {
    final response =
        await HttpService.getRequest(endPoint: Strings.getTodos(skip));
    return response;
  }
}

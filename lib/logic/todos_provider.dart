import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/data/data_providers/add_todo_api.dart';
import 'package:todo/data/data_providers/delete_todo_api.dart';
import 'package:todo/data/data_providers/get_todos_api.dart';
import 'package:todo/data/data_providers/update_todo_api.dart';
import 'package:todo/data/models/todo.dart';

import '../core/strings.dart';
import '../data/repositories/todo_repos.dart';

class TodosNotifier extends StateNotifier<List<Todo>> {
  TodosNotifier(
    this._getTodosRepo,
    this._addTodoRepo,
    this._updateTodoRepo,
    this._deleteTodoRepo,
  ) : super([]);
  final GetTodosRepo _getTodosRepo;
  final AddTodoRepo _addTodoRepo;
  final UpdateTodoRepo _updateTodoRepo;
  final DeleteTodoRepo _deleteTodoRepo;

  Future<String> getAllTodos() async {
    String msg = Strings.succeeded;
    try {
      state = await _getTodosRepo.getAllTodos();
    } on DioException catch (error) {
      if (error.response == null) {
        msg = Strings.noInternetErrorMessage;
      } else {
        if (error.response != null) {
          msg = error.response!.data.toString();
        } else {
          msg = Strings.defaultErrorMessage;
        }
      }
    }
    return msg;
  }

  Future<String> addTodo(String todo) async {
    String msg = Strings.succeeded;
    try {
      Todo res = await _addTodoRepo.addTodo(
        newTodo: Todo(todo: todo, completed: false, id: 1),
      );
      //Mark the Todo as local
      res.isLocal = true;
      state = [res, ...state];
    } on DioException catch (error) {
      if (error.response == null) {
        msg = Strings.noInternetErrorMessage;
      } else {
        if (error.response != null) {
          msg = error.response!.data.toString();
        } else {
          msg = Strings.defaultErrorMessage;
        }
      }
    }
    return msg;
  }

  Future<String> updateTodo(Todo todo, int index) async {
    String msg = Strings.succeeded;
    state[index].completed = !todo.completed;
    state = [...state];
    if (!todo.isLocal) {
      try {
        await _updateTodoRepo.updateTodo(
          id: todo.id,
          completed: !todo.completed,
        );
      } on DioException catch (error) {
        state[index].completed = !todo.completed;
        state = [...state];
        if (error.response == null) {
          msg = Strings.noInternetErrorMessage;
        } else {
          if (error.response != null) {
            msg = error.response!.data.toString();
          } else {
            msg = Strings.defaultErrorMessage;
          }
        }
      }
    }
    return msg;
  }

  Future<String> deleteTodo({required Todo todo, required int index}) async {
    String msg = Strings.succeeded;
    state.removeAt(index);
    state = [...state];
    if (!todo.isLocal) {
      try {
        await _deleteTodoRepo.deleteTodo(id: todo.id);
      } on DioException catch (error) {
        state.insert(index, todo);
        state = [...state];
        if (error.response == null) {
          msg = Strings.noInternetErrorMessage;
        } else {
          if (error.response != null) {
            msg = error.response!.data.toString();
          } else {
            msg = Strings.defaultErrorMessage;
          }
        }
      }
    }
    return msg;
  }
}

final todosProvider = StateNotifierProvider<TodosNotifier, List<Todo>>(
  (ref) {
    return TodosNotifier(
      (),GetTodosApi
      AddTodoApi(),
      UpdateTodoApi(),
      DeleteTodoApi(),
    );
  },
);

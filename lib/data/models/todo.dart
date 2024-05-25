class Todo {
  Todo({
    required this.id,
    required this.todo,
    required this.completed,
  });
  int id = 0;
  String todo = '';
  bool completed = false;
  bool isLocal = false;
  Todo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    todo = json['todo'];
    completed = json['completed'];
  }
  Map<String, dynamic> toMap() {
    return {
      'todo': todo,
      'completed': completed,
      'userId': id,
    };
  }
}

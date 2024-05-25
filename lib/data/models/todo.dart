class Todo {
  Todo({
    this.id,
    this.todo,
    this.completed,
  });
  int? id;
  String? todo;
  bool? completed;
  bool? isLocal = false;

  Todo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    todo = json['todo'];
    completed = json['completed'];
  }
  Map<String, dynamic> toJson() {
    return {
      'todo': todo,
      'completed': completed,
      'userId': id,
    };
  }
}

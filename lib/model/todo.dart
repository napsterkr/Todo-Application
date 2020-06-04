class Todo {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  Todo(this.userId, this.id, this.title, this.completed);

  factory Todo.fromJson(Map<String, dynamic>map){
    return Todo(map["userId"], map["id"], map["title"], map["completed"]);
  }
}

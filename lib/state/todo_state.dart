import 'package:todoapp/contstants/app_constants.dart';
import 'package:todoapp/model/todo.dart';

class TodoState {
  List<Todo> todoList;
  bool isLoading;
  bool showError;

  TodoState(
      {this.todoList = AppConstants.list,
      this.showError = false,
      this.isLoading = false});
}

import 'dart:async';
import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:todoapp/contstants/app_constants.dart';
import 'package:todoapp/model/todo.dart';
import 'package:todoapp/state/todo_state.dart';

class TodoBloc extends Bloc<int, TodoState> {
  @override
  TodoState get initialState => TodoState();

  @override
  Stream<TodoState> mapEventToState(int event) async* {
    if (event == AppConstants.showLoader)
      yield TodoState(isLoading: true);
    else if (event == AppConstants.showError)
      yield TodoState(showError: true);
    else if (event == AppConstants.showList)
      yield TodoState(todoList: state.todoList);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(AppConstants.showError);
    super.onError(error, stackTrace);
  }

  void loadData() {
    add(AppConstants.showLoader);
    http
        .get(AppConstants.base_url + "todos")
        .then((value) => json.decode(value.body) as List)
        .then(
            (value) => value.map<Todo>((data) => Todo.fromJson(data)).toList())
        .then((value) {
      state.todoList = value;
      add(AppConstants.showList);
    }).catchError(onError);
  }
}

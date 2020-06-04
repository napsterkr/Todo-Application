import 'package:todoapp/model/todo.dart';

class AppConstants {
  AppConstants._();

  static const List<Todo> list = [];
  static const String base_url = "http://jsonplaceholder.typicode.com/";

  static const showLoader = 1;
  static const showError = 2;
  static const showList = 3;
}

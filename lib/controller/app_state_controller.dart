import 'package:dio/dio.dart' as dio;

import 'package:get/get.dart';

import '../model/json_data.dart';
import '../model/todo_data.dart';

class AppState extends GetxController {
  List<JsonData> jsonData = [];
  List<TodoData> todoData = [];

  @override
  void onInit() {
    fetchJsonData();
    fetchTodoData();
    super.onInit();
  }

  @override
  void onReady() {
    // called after the widget is rendered on screen
//    showIntroDialog();
    Get.defaultDialog();
    super.onReady();
  }

  fetchJsonData() async {
    dio.Response res =
        await dio.Dio().get('https://jsonplaceholder.typicode.com/posts');
    for (Map<String, dynamic> r in res.data) {
      jsonData.add(JsonData.fromJson(r));
    }
  }

  fetchTodoData() async {
    dio.Response res =
        await dio.Dio().get('https://jsonplaceholder.typicode.com/todos');
    print(res.data);
    for (Map<String, dynamic> r in res.data) {
      todoData.add(TodoData.fromJson(r));
    }
  }
}

import 'package:flutter_getx/controller/app_state_controller.dart';
import 'package:flutter_getx/controller/post_controller.dart';
import 'package:flutter_getx/controller/user_controller.dart';
import 'package:get/get.dart';

class MyBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<AppState>(AppState());
    Get.lazyPut<UserController>(() => UserController(), fenix: true);
    Get.lazyPut<PostController>(() => PostController(), fenix: true);
    //lazyPut call when you write Get.find().
  }
}

import 'package:dio/dio.dart' as dio;
import 'package:flutter_getx/model/user_model.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  //with obs
//  var userModel=List<UserModel>().obs;
  List<UserModel> userModel = [];
  var isLoading = true.obs;
  @override
  void onInit() {
    fetchUserData();
    super.onInit();
  }

  @override
  void onReady() {
    // called after the widget is rendered on screen
//    showIntroDialog();
    super.onReady();
  }

  fetchUserData() async {
    print("loading");
    isLoading(true);
    dio.Response res =
        await dio.Dio().get('https://jsonplaceholder.typicode.com/users');
    print(res.data);
    for (Map<String, dynamic> r in res.data) {
      userModel.add(UserModel.fromJson(r));
    }
    isLoading(false);
  }
  @override
  void onClose() {
    super.onClose();
  }
}

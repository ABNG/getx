import 'package:flutter/material.dart';
import 'package:flutter_getx/controller/user_controller.dart';
import 'package:get/get.dart';

class NewUserScreen extends StatelessWidget {
  final model = Get.find<UserController>();
  final int index = Get.arguments["id"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New User Screen"),
      ),
      body: InkResponse(
          onTap: () => Get.back(),
          child: Center(
            child: Text(model.userModel[index].name),
          )),
    );
  }
}

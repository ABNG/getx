import 'package:flutter/material.dart';
import 'package:flutter_getx/controller/app_state_controller.dart';
import 'package:flutter_getx/user_screen.dart';
import 'package:get/get.dart';

class UserProfile extends StatelessWidget {
  final data = Get.find<AppState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Get.parameters['user']),
      ),
      body: Container(
        child: Center(
            child: InkResponse(
                onTap: () {
//                  Get.offAllNamed("/first");
//                  Get.toNamed("/user");
                  Get.toNamed("/post");
                },
                child: Text(data.todoData[0].title))),
      ),
    );
  }
}

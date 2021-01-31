import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_getx/controller/app_state_controller.dart';
import 'package:get/get.dart';

class MySecondScreen extends StatelessWidget {
  final data = Get.find<AppState>();

  @override
  Widget build(BuildContext context) {
    // try {
    //   final data = Get.find<FetchTodo>();
    // } catch (e) {
    //   print(e.toString());
    // }
    print(Get.parameters['device']);
    print(Get.parameters['id']);
    print(Get.parameters['name']);
    return Scaffold(
      appBar: AppBar(
        title: Text("Second"),
      ),
      body: Container(
        child: Center(
            child: InkResponse(
                onTap: () {
                  Timer(Duration(seconds: 5), () {
                    Get.toNamed("/profile/1");
                  });

                  Get.offNamed("/third", arguments: {"name": "OK"});
                },
                child: Text(data.jsonData[0].title))),
      ),
    );
  }
}

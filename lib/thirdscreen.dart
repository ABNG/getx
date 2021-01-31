import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThirdScreen extends StatelessWidget {
  final String value = Get.arguments["name"];

  @override
  Widget build(BuildContext context) {
    // Get.snackbar("Hi", "You are on second route", instantInit: false);
    if (!Get.isSnackbarOpen) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        //you can also use  SchedulerBinding.instance.addPostFrameCallback
        Get.defaultDialog();
      });
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(value),
      ),
      body: Container(
        child: Center(
            child: InkResponse(
                onTap: () {
                  Get.toNamed("/profile/1");
                },
                child: Text("SeconThirdd"))),
      ),
    );
  }
}

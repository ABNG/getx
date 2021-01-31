import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
            child: InkResponse(
                onTap: () {
                  Get.toNamed("/second?device=phone&id=354&name=Enzo");
                },
                child: Text("First"))),
      ),
    );
  }
}

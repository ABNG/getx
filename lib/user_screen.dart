import 'package:flutter/material.dart';
import 'package:flutter_getx/model/user_model.dart';
import 'package:flutter_getx/new_user_Screen.dart';
import 'package:get/get.dart';

import 'controller/user_controller.dart';

class UserScreen extends StatelessWidget {
  final model = Get.find<UserController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Screen"),
      ),
      body: Obx(
        () => model.isLoading.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: model.userModel.length,
                itemBuilder: (context, index) => ListTile(
                      onTap: () {
                        model.userModel.add(UserModel(
                            id: 2000,
                            name: "hello",
                            username: "no",
                            email: "iui",
                            address: null,
                            company: null,
                            phone: "jj",
                            website: "oioi"));
                        Get.toNamed("/new/user", arguments: {
                          "id": index,
                        });
                      },
                      title: Text(
                        "${model.userModel[index].name}",
                        textScaleFactor: 1.5,
                      ),
                      subtitle: Text(
                        "${model.userModel[index].name}",
                        textScaleFactor: 1.5,
                      ),
                    )),
      ),
    );
  }
}

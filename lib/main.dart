import 'package:flutter/material.dart';
import 'package:flutter_getx/bindings/app_state_Binding.dart';
import 'package:flutter_getx/new_user_Screen.dart';
import 'package:flutter_getx/post_screen/post_screen.dart';
import 'package:flutter_getx/second_screen.dart';
import 'package:flutter_getx/thirdscreen.dart';
import 'package:flutter_getx/user_screen.dart';
import 'package:get/get.dart';

import 'UserProfile.dart';
import 'first_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialBinding: MyBinding(),
      routingCallback: (routing) {
        print(routing.current);

        if (routing.current == '/third') {
          // if (!Get.isSnackbarOpen) {   //this will run multiple times
          //   Get.snackbar("Hi", "You are on second route",
          //       instantInit:
          //           false); //instantInit make it to run before initState.
          // }
        }
      },
      unknownRoute: GetPage(name: "/notfound", page: () => MyHomePage()),
      initialRoute: "/first",
      getPages: [
        GetPage(name: "/first", page: () => MyHomePage()),
        GetPage(
          name: "/second",
          page: () => MySecondScreen(),
          transition: Transition.zoom,
        ),
        GetPage(name: "/third", page: () => ThirdScreen()),
        GetPage(
          name: '/profile/:user',
          page: () => UserProfile(),
        ),
        GetPage(
          name: '/user',
          page: () => UserScreen(),
        ),
        GetPage(
          name: '/new/user',
          page: () => NewUserScreen(),
        ),
        GetPage(
          name: '/post',
          page: () => PostScreen(),
        ),
      ],
    );
  }
}

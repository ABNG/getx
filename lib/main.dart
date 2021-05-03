import 'package:flutter/material.dart';
import 'package:flutter_getx/bindings/app_state_Binding.dart';
import 'package:flutter_getx/routes/app_pages.dart';
import 'package:get/get.dart';

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
      unknownRoute: AppPages.UNKNOWNPAGE,
      initialRoute: AppPages.INITIALPAGE,
      getPages: AppPages.ROUTES,
    );
  }
}

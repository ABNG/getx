import 'package:flutter_getx/post_screen/post_screen.dart';
import 'package:get/get.dart';

import '../UserProfile.dart';
import '../first_screen.dart';
import '../new_user_Screen.dart';
import '../second_screen.dart';
import '../thirdscreen.dart';
import '../user_screen.dart';

class AppPages {
  static final String INITIALPAGE = "/first";
  static final GetPage UNKNOWNPAGE =
      GetPage(name: "/notfound", page: () => MyHomePage());
  static List<GetPage> get ROUTES => [
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
      ];
}

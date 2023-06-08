import 'package:flutter/material.dart';

import '../../utils/app_strings.dart';

class Routes {
  static const String initialRoute = '/';
  static const String SettingScreenRoute = '/Setting';
  static const String HomeScreenRoute = '/Home';


}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      // case Routes.initialRoute:
      //   return MaterialPageRoute(builder: (context) {
      //     return HomeContainerPage();
      //   });
      // case Routes.HomeScreenRoute:
      //   return MaterialPageRoute(builder: ((context) {
      //     return HomeScreen();
      //   }));
      // case Routes.SettingScreenRoute:
      //   return MaterialPageRoute(builder: ((context) {
      //     return SettingScreen(onMenuTap: (){});
      //   }));


      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
        builder: ((context) => const Scaffold(
              body: Center(
                child: Text(AppStrings.noRouteFound),
              ),
            )));
  }
}

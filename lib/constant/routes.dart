import 'package:get/get.dart';
import 'package:weatherly/constant/routes_name.dart';
import 'package:weatherly/view/screens/bn_screen.dart';

import '../view/screens/stopwatch_screen.dart';
import '../view/screens/timer_screen.dart';
import '../view/screens/home_screen.dart';
import '../view/screens/list_screen.dart';

class AppRoutes {
  static appRoutes() => [

        GetPage(
          name: RoutesName.homeScreen,
          page: () => const HomeScreen(),
          transition: Transition.downToUp,
       
          
        ),
        GetPage(name: RoutesName.bnScreen, page: () => const BnScreen()),
        GetPage(name: RoutesName.listScreen, page: () => const ListScreen()),
 
        GetPage(
            name: RoutesName.timerScreen,
            page: () =>  TimerScreen()),
        GetPage(
            name: RoutesName.stopwatchScreen,
            page: () =>  StopwatchScreen()),
      ];
}

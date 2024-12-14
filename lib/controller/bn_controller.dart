import 'package:get/get.dart';
import '../model/bn_screen_model.dart';
import '../view/screens/home_screen.dart';
import '../view/screens/list_screen.dart';

class BnController extends GetxController {
  RxInt currentIndex = 0.obs;

   RxBool isDarkMode = false.obs;
   RxBool isFhrihiteFormat = false.obs;


  final List<BnScreenModel> screens = <BnScreenModel>[
    BnScreenModel(  const HomeScreen(), 'Weather'),
    BnScreenModel(  const ListScreen(), 'List')
  ];
}

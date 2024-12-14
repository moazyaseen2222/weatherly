import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class ListController extends GetxController {

  late SharedPreferences sharedPreferences;
  RxInt temp = 0.obs;
  RxString main = 'main'.obs;
  RxString description = 'description'.obs;
  RxString icon = 'icon'.obs;
  RxInt tempMax = 0.obs;
  RxInt tempMin = 0.obs;
  RxDouble windSpeed = 0.0.obs;
  RxInt windDeg = 0.obs;


  Future<dynamic> getCityWeather(String cityName) async {

    String url =
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=4226910c384a338acc7c7cfe6a86d4b0';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      temp.value = jsonData['main']['temp'] / 10 ~/ 1;
      tempMax.value = jsonData['main']['temp_max'] / 10 ~/ 1;
      tempMin.value = jsonData['main']['temp_min'] / 10 ~/ 1;
      main.value = jsonData['weather'][0]['main'];
      description.value = jsonData['weather'][0]['description'];
      icon.value = jsonData['weather'][0]['icon'];
      windSpeed.value = jsonData['wind']['speed'];
      windDeg.value = jsonData['wind']['deg'];
      return jsonData;
    } else {
      return {};
    }
  }

}

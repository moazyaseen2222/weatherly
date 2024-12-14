import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weatherly/controller/list_controller.dart';

class HomeController extends GetxController {
  TextEditingController searchCityController = TextEditingController();

  static ListController listController = Get.put(ListController());

  @override
  void onInit() {
    searchCityController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    searchCityController.dispose();
    super.onClose();
  }

  RxString cityName = 'Search city'.obs;

  RxString saveButtonText = 'Save'.obs;

  RxInt temp = 0.obs;
  RxString main = 'main'.obs;
  RxString description = 'description'.obs;
  RxString icon = 'icon'.obs;
  RxString iconName = 'images/hot.png'.obs;
  RxInt tempMax = 0.obs;
  RxInt tempMin = 0.obs;
  RxInt humidity = 0.obs;
  RxInt pressure = 0.obs;
  RxDouble windSpeed = 0.0.obs;
  RxInt windDeg = 0.obs;
  RxDouble lat = 0.0.obs;
  RxDouble lon = 0.0.obs;

  void iconStatus() {
    if (main.value == 'Clear') {
      iconName.value = 'images/sun.png';
    } else if (main.value == 'Clouds') {
      iconName.value = 'images/cloudy.png';
    } else if (main.value == 'Rain') {
      iconName.value = 'images/rain.png';
    } else {
      iconName.value = 'images/logo.png';
    }
  }

  Future<dynamic> getCityWeather() async {
    String url =
        'https://api.openweathermap.org/data/2.5/weather?q=${searchCityController.text}&appid=4226910c384a338acc7c7cfe6a86d4b0';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      temp.value = jsonData['main']['temp'] / 10 ~/ 1;
      tempMax.value = jsonData['main']['temp_max'] / 10 ~/ 1;
      tempMin.value = jsonData['main']['temp_min'] / 10 ~/ 1;
      humidity.value = jsonData['main']['humidity'];
      pressure.value = jsonData['main']['pressure'];
      windSpeed.value = jsonData['wind']['speed'];
      windDeg.value = jsonData['wind']['deg'];
      //cityName.value = jsonData['name'];
      main.value = jsonData['weather'][0]['main'];
      lon.value = jsonData['coord']['lon'];
      lat.value = jsonData['coord']['lat'];
      description.value = jsonData['weather'][0]['description'];
      icon.value = jsonData['weather'][0]['icon'];
      return jsonData;
    } else {
      return {};
    }
  }

  List<String> items = [];

  void addItem(String cityName) async {
    if (cityName == 'Search city') {
      Fluttertoast.showToast(msg: 'Search city first');
    }

    final prefs = await SharedPreferences.getInstance();

    List<String> existingItems = prefs.getStringList('items') ?? [];

    existingItems.add(cityName);
    Fluttertoast.showToast(msg: 'City added to the list');

    await prefs.setStringList('items', existingItems);

    items = existingItems;
  }
}

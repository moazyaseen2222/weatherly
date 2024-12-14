import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constant/app_fonts.dart';
import '../../../controller/home_controller.dart';

class BuildSearchCityTextFiled extends StatelessWidget {
  const BuildSearchCityTextFiled({super.key, required this.homeController});

  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.black,
      controller: homeController.searchCityController,
      onSubmitted: (value) async {
        homeController.cityName.value =
            homeController.searchCityController.text == ''
                ? 'Search city'
                : homeController.searchCityController.text.toUpperCase();

        final prefs = await SharedPreferences.getInstance();
        List<String> items = prefs.getStringList('items') ?? [];
        if (items.contains(homeController.cityName.value)) {
          homeController.saveButtonText.value = 'Saved';
        } else {
          homeController.saveButtonText.value = 'Save';
        }

        await homeController.getCityWeather();

        homeController.iconStatus();
      },
      decoration: InputDecoration(
          prefixIconColor: Colors.black,
          labelStyle: const TextStyle(color: Colors.black),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black)),
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(15.r)),
          label: const Text(
            'Search city',
            style: TextStyle(fontFamily: AppFonts.play),
          )),
    );
  }
}

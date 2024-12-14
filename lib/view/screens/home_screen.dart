import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controller/home_controller.dart';
import '../widgets/home_widgets/build_search_city_text_filed.dart';
import '../widgets/home_widgets/build_searched_city_label.dart';
import '../widgets/home_widgets/build_weather_info_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: 10.0.h,
            left: 20.w,
            right: 20.w,
          ),
          child: Column(
            children: [
              SizedBox(
                height: 20.h,
              ),

              // **** Search Filed ****
              BuildSearchCityTextFiled(
                homeController: homeController,
              ),
              SizedBox(height: 10.h),

              // **** Searched City Label ****
              BuildSearchedCityLabel(homeController: homeController),
              SizedBox(
                height: 10.h,
              ),

              // *** Weather City Info ****
              BuildWeatherInfoContainer(
                homeController: homeController,
              ),
            ],
          ),
        ),
      ],
    ));
  }
}

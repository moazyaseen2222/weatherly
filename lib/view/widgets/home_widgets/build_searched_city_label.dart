import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../constant/app_colors.dart';
import '../../../constant/app_text_styles.dart';
import '../../../controller/home_controller.dart';

class BuildSearchedCityLabel extends StatelessWidget {
  const BuildSearchedCityLabel({
    super.key,
    required this.homeController,
  });

  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity.w,
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: AppColors.lightermainColor, blurRadius: 1, spreadRadius: 1)
        ],
        gradient: LinearGradient(colors: [
          AppColors.lightIceBlue,
          Colors.white,
          AppColors.lightIceBlue,
        ]),
      ),
      child: Center(
        child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Obx(() {
              return Text(
                homeController.cityName.value,
                style: AppTextStyles.font28MainColor,
              );
            })),
      ),
    );
  }
}

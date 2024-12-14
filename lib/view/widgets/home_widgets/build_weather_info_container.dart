import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../constant/app_colors.dart';
import '../../../constant/app_text_styles.dart';
import '../../../constant/app_utils.dart';
import '../../../controller/home_controller.dart';
import 'build_save_button_widget.dart';

class BuildWeatherInfoContainer extends StatelessWidget {
  const BuildWeatherInfoContainer({
    super.key,
    required this.homeController,
  });

  final HomeController homeController;

  @override
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
      future: HomeController().getCityWeather(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Padding(
              padding: EdgeInsets.only(top: 200.h),
              child: const CircularProgressIndicator(
                color: AppColors.mainColor,
              ));
        } else if (snapshot.hasData) {
          return Obx(() {
            return Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.white, blurRadius: 1, spreadRadius: 1)
                    ],
                    gradient: LinearGradient(colors: [
                      Colors.indigo.shade100,
                      Colors.indigo.shade200,
                      const Color(0xffBAD7E9),
                    ]),
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  height: 210.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// Temp
                          Row(
                            children: [
                              Text('${homeController.temp.value}' /*🌡*/,
                                  style: AppTextStyles.font50BoldWhite),
                              Text('℃' /*🌡*/,
                                  style: AppTextStyles.font20White
                                      .copyWith(fontWeight: FontWeight.bold)),
                            ],
                          ),

                          Visibility(
                            visible: homeController.temp.value == 0? false:true, 
                            child: Row(
                              children: [
                                Text(
                                    '${(homeController.temp.value * 9 / 5) + 32}' /*🌡*/,
                                    style: AppTextStyles.font18BoldWhite),
                                Text(
                                  ' F' /*🌡*/,
                                  style: AppTextStyles.font14BoldWhite,
                                ),
                              ],
                            ),
                          ),

                          /// Status
                          Text(homeController.main.value,
                              style: AppTextStyles.font25White),

                          /// Description
                          Text(homeController.description.value,
                              style: AppTextStyles.font20White),
                        ],
                      ),
                      SizedBox(width: 23.w),

                      ///Main Icon

                      Obx(() {
                        return Image(
                            image: AssetImage(homeController.iconName.value),
                            width: 130.w,
                            height: 130.h,
                            fit: BoxFit.cover);
                      }),
                    ],
                  ),
                ),
                SizedBox(height: 15.h),
                Container(
                  width: 400.w,
                  height: 250.h,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.white, blurRadius: 1, spreadRadius: 1)
                    ],
                    gradient: LinearGradient(colors: [
                      Colors.red.shade100,
                      Colors.blue.shade100,
                      Colors.orange.shade100
                    ]),
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Min Temp :${homeController.tempMin.value} C',
                              style: AppTextStyles.font20Black,
                            ),
                            Text(
                              'Max Temp :${homeController.tempMax.value} C',
                              style: AppTextStyles.font20Black,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Humidity :${homeController.humidity.value}%',
                              style: AppTextStyles.font20Black,
                            ),
                            Text(
                              'Pressure :${homeController.pressure.value}',
                              style: AppTextStyles.font20Black,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'W.Speed :${homeController.windSpeed.value}m/s',
                              style: AppTextStyles.font20Black,
                            ),
                            Text(
                              'W.Deg :${homeController.windDeg.value}',
                              style: AppTextStyles.font20Black,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20.h),
                // **** Save Button ****
                BuildSaveButtonWidget(
                  homeController: homeController,
                ),
              ],
            );
          });
        } else {
          return Padding(
            padding: EdgeInsets.only(top: 100.0.h),
            child: Utils.noInternet,
          );
        }
      },
    );
  }
}

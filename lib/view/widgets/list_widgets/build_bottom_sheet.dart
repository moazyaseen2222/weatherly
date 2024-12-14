import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constant/app_colors.dart';
import '../../../constant/app_text_styles.dart';
import '../../../constant/spaces.dart';
import '../../../controller/list_controller.dart';
import 'weather_list_container.dart';

class BuildBottomSheet extends StatelessWidget {
  const BuildBottomSheet(
      {super.key, required this.addrees, required this.listController});

  final String addrees;
  final ListController listController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r), topRight: Radius.circular(20.r)),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
            padding: EdgeInsets.only(top: 30.0.h, left: 20.w, right: 20.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Address
                Center(
                  child: Text(addrees, style: AppTextStyles.font20BoldBlack),
                ),
                verticalSpace(5),

                Divider(
                  color: AppColors.mainColor,
                  height: 2.h,
                  endIndent: 30.w,
                  indent: 30.w,
                ),
                verticalSpace(30),

                WeatherListContainer(
                  listController: listController,
                  type: 'Temp',
                  data:
                      '${listController.temp.value}℃ - ${(listController.temp.value * 6 / 5) + 32}F',
                ),
                verticalSpace(10),
                WeatherListContainer(
                  listController: listController,
                  type: 'Main',
                  data: listController.main.value,
                ),
                verticalSpace(10),
                WeatherListContainer(
                  listController: listController,
                  type: 'Desc',
                  data: listController.description.value,
                ),
                verticalSpace(10),

                verticalSpace(10),
                WeatherListContainer(
                  listController: listController,
                  type: 'Max Temp',
                  data: '${listController.tempMax.value}℃',
                ),
                verticalSpace(10),
                WeatherListContainer(
                  listController: listController,
                  type: 'Min Temp',
                  data: '${listController.tempMin.value}℃',
                ),
                verticalSpace(10),
                WeatherListContainer(
                  listController: listController,
                  type: 'W.Speed',
                  data: '${listController.windSpeed.value}',
                ),

                verticalSpace(10),
                WeatherListContainer(
                  listController: listController,
                  type: 'W.Degree',
                  data: '${listController.windDeg.value}',
                ),
                verticalSpace(10),
              ],
            )),
      ),
    );
  }
}

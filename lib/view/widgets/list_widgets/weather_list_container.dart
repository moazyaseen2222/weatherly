import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constant/app_colors.dart';
import '../../../constant/app_text_styles.dart';
import '../../../controller/list_controller.dart';

class WeatherListContainer extends StatelessWidget {
  const WeatherListContainer({
    super.key,
    required this.listController,
    required this.type,
    required this.data,
  });

  final ListController listController;

  final String type;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 70.h,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color: AppColors.blue,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 20.0.w),
          child: Text('$type :  $data', style: AppTextStyles.font20Black),
        ),
      ),
    );
  }
}

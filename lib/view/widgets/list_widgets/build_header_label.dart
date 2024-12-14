import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constant/app_text_styles.dart';

class BuildHeaderLabel extends StatelessWidget {
  const BuildHeaderLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 30.0.h, right: 290.w),
          child: Text('My List', style: AppTextStyles.font20BoldBlack),
        ),
        SizedBox(height: 10.h),
        const Divider(
          endIndent: 30,
          indent: 30,
          color: Colors.black,
        ),
        SizedBox(height: 10.h),
      ],
    );
  }
}

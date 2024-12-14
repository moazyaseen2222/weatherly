import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../constant/app_text_styles.dart';

class BuildSavedButton extends StatelessWidget {
  const BuildSavedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey,
          minimumSize: Size(150.w, 50.h),
        ),
        onPressed: () {
          Fluttertoast.showToast(msg: 'City already in the list');
        },
        child: Text('Saved', style: AppTextStyles.whitefont));
  }
}

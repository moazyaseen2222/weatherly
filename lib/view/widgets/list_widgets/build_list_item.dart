import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constant/app_colors.dart';
import '../../../constant/app_text_styles.dart';

class BuildListItem extends StatefulWidget {
  const BuildListItem(
      {super.key,
      required this.index,
      required this.name,
      required this.removeItem});

  final int index;

  final String name;

  final VoidCallback removeItem;

  @override
  State<BuildListItem> createState() => _BuildListItemState();
}

class _BuildListItemState extends State<BuildListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.h,
      width: 280.w,
      decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(color: Colors.white, blurRadius: 1, spreadRadius: 1)
          ],
          borderRadius: BorderRadius.circular(15.r),
          // ignore: unrelated_type_equality_checks
          color: ThemeMode == ThemeData.dark
              ? Colors.white
              : AppColors.lightmainColor),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image(
              height: 50.h,
              width: 50.w,
              image: const AssetImage('images/logo.png'),
            ),
            Padding(
              padding: EdgeInsets.only(top: 60.h),
              child: Column(
                children: [
                  Text(widget.name, style: AppTextStyles.font20Black),
                ],
              ),
            ),
            IconButton(
              onPressed: () {
                widget.removeItem();
              },
              icon: const Icon(
                Icons.cancel_outlined,
                color: AppColors.mainColor,
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

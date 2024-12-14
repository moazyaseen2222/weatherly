import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../constant/app_text_styles.dart';
import '../../../constant/spaces.dart';

class BuildContactCard extends StatelessWidget {
  const BuildContactCard({
    super.key,
    required this.title,
    required this.imagePath,
    required this.url,
  });

  final String title;
  final String imagePath;
  final Uri url;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        launchUrl(url);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 10.0.h),
        child: SizedBox(
          height: 70.h,
          width: 400.w,
          child: Card(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 8.0.h),
              child: Row(
                children: [
                  Image(
                    image: AssetImage(imagePath),
                    height: 30.h,
                  ),
                  horiznetlSpace(10),
                  Text(
                    title,
                    style: AppTextStyles.font14RegularBlack,
                  ),
                  const Spacer(),
                  const Icon(Icons.arrow_forward_ios_outlined)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

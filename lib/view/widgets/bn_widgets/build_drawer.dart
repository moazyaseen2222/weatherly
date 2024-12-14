import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../constant/app_colors.dart';
import '../../../constant/app_links.dart';
import '../../../constant/app_text_styles.dart';
import '../../../constant/spaces.dart';
import '../../../controller/bn_controller.dart';
import '../../screens/about_the_app.dart';
import '../../screens/about_the_developer.dart';
import '../../screens/stopwatch_screen.dart';
import '../../screens/timer_screen.dart';
import 'build_drawer_list_tile.dart';

class BuildDrawer extends StatelessWidget {
  BuildDrawer({super.key});

  final BnController bnController = Get.put(BnController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        backgroundColor: AppColors.lightIceBlue,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              height: 80.h,
              color: AppColors.mainColor,
              child: Center(
                  child: Text(
                'Menu',
                style: AppTextStyles.font18BoldWhite,
              )),
            ),
            verticalSpace(30),
            BuildDrawerListTile(
                title: 'Stopwatch',
                subtitle: 'Stopwatch Counter',
                leadingIcon: const Icon(Icons.timer),
                trailingIcon: const Icon(Icons.arrow_forward_ios),
                onTap: () => Get.to(() => StopwatchScreen())),
            verticalSpace(30),
            BuildDrawerListTile(
                title: 'Timer',
                subtitle: 'Timer Counter',
                leadingIcon: const Icon(Icons.timer),
                trailingIcon: const Icon(Icons.arrow_forward_ios),
                onTap: () => Get.to(() => TimerScreen())),
            verticalSpace(30),
            BuildDrawerListTile(
                title: 'Weather Wave',
                subtitle: 'About The App',
                leadingIcon: const Icon(Icons.description_rounded),
                trailingIcon: const Icon(Icons.arrow_forward_ios),
                onTap: () => Get.to(() => const AboutTheApp())),
            verticalSpace(30),
            BuildDrawerListTile(
                title: 'Me',
                subtitle: 'About The Developer',
                leadingIcon: const Icon(Icons.person),
                trailingIcon: const Icon(Icons.arrow_forward_ios),
                onTap: () => Get.to(() => const AboutTheDeveloper())),
            verticalSpace(340),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(children: [
                TextSpan(
                  text: 'Weather Data from ',
                  style: AppTextStyles.font12RegularBlack,
                ),
                TextSpan(
                    text: 'Open Weather Map',
                    style: AppTextStyles.font12RegularBlack
                        .copyWith(color: Colors.blue),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        launchUrl(AppLinks.openweathermap);
                      })
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

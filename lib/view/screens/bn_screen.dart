import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../constant/app_colors.dart';
import '../../constant/app_fonts.dart';
import '../../controller/bn_controller.dart';
import '../widgets/bn_widgets/build_drawer.dart';

class BnScreen extends StatefulWidget {
  const BnScreen({super.key});

  @override
  State<BnScreen> createState() => _BnScreenState();
}

class _BnScreenState extends State<BnScreen> {
  BnController bnController = Get.put(BnController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() {
          return Text(
              bnController.screens[bnController.currentIndex.value].title);
        }),
      ),
      drawer: BuildDrawer(),
      body: Obx(() {
        return bnController.screens[bnController.currentIndex.value].widget;
      }),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 20.0.h),
        child: Obx(() {
          return BottomNavigationBar(
            fixedColor: AppColors.mainColor,
            backgroundColor: Colors.transparent,
            onTap: (int index) {
              bnController.currentIndex.value = index;
            },
            currentIndex: bnController.currentIndex.value,
            elevation: 0,
            selectedLabelStyle: const TextStyle(
              fontFamily: AppFonts.play,
            ),
            unselectedLabelStyle: const TextStyle(
              fontFamily: AppFonts.play,
            ),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.cloud_sharp,
                  size: 30,
                ),
                label: 'Weahter',
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.list,
                    size: 30,
                  ),
                  label: 'List'),
            ],
          );
        }),
      ),
    );
  }
}

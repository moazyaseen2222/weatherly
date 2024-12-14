import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../constant/app_colors.dart';
import '../../constant/app_text_styles.dart';
import '../../controller/stopwatch_contoller.dart';

class StopwatchScreen extends StatelessWidget {
   StopwatchScreen({super.key});

 final StopwatchContoller stopwatchContoller =
      Get.put(StopwatchContoller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Stopwatch')),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50.0.w,vertical: 50.0.h),
              child: Container(
                height: 300.h,
                width: 300.w,
                decoration: BoxDecoration(
                    color: AppColors.mainColor,
                    borderRadius: BorderRadius.circular(15.r)),
                child: Center(child: Obx(() {
                  return Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 10.0.w,vertical: 10.0.h),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Stopwatch',
                              style:  AppTextStyles.font40White,
                            ),
                            SizedBox(width: 7.w),
                            const Icon(
                              Icons.timer_sharp,
                              color: Colors.white,
                              size: 30,
                            )
                          ],
                        ),
                       // SizedBox(height: 50.h),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                stopwatchContoller.meniutCounter.value
                                    .toString(),
                                style: AppTextStyles.font50BoldWhite
                              ),
                              Text(
                                ' : ',
                                style: AppTextStyles.font50White

                                
                              ),
                              Text(
                                stopwatchContoller.secondCounter.value
                                    .toString(),
                                 style: AppTextStyles.font50BoldWhite
                              ),
                               Text(
                                '.',
                                 style: AppTextStyles.font50BoldWhite
                              ),
                              Padding(
                                padding:  EdgeInsets.only(top: 15.0.h),
                                child: Text(
                                  stopwatchContoller.milliSeconds.value
                                      .toString(),
                                  style: AppTextStyles.font30BoldWhite,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                })),
              ),
            ),
          const Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0.w,vertical: 30.0.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(onTap: () {
                    if (stopwatchContoller.isZeroingTaped.value ==
                        false) {
                      stopwatchContoller.zeroingCounter();
                      Fluttertoast.showToast(
                          msg: 'Counter Zeroing',
                          backgroundColor: AppColors.mainColor,
                          fontSize: 15.sp,
                          textColor: Colors.white,
                          gravity: ToastGravity.CENTER_LEFT);
                      stopwatchContoller.isZeroingTaped.value = true;
                      stopwatchContoller.isStopTaped.value = false;
                      stopwatchContoller.isStartTaped.value = false;
                    } else {
                      Fluttertoast.showToast(
                          msg: 'Timer already Zero',
                          backgroundColor: AppColors.mainColor,
                          fontSize: 15.sp,
                          textColor: Colors.white,
                          gravity: ToastGravity.CENTER_LEFT);
                    }
                  }, child: Obx(() {
                    return Container(
                      height: 80.h,
                      width: 80.w,
                      decoration: BoxDecoration(
                        color: stopwatchContoller.isZeroingTaped.value
                            ? Colors.white
                            : AppColors.mainColor,
                        borderRadius: BorderRadius.circular(40.r),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade400,
                              blurRadius: stopwatchContoller
                                      .isZeroingTaped.value
                                  ? 15
                                  : 5,
                              spreadRadius: 1,
                              blurStyle: BlurStyle.outer
                              ),
                        ],
                      ),
                      child: Center(
                          child: Icon(
                        Icons.restart_alt_sharp,
                        color: stopwatchContoller.isZeroingTaped.value
                            ? AppColors.mainColor
                            : Colors.white,
                        size: 35,
                      )),
                    );
                  })),
                  GestureDetector(onTap: () {
                    if (stopwatchContoller.isStartTaped.value ==
                        false) {
                      stopwatchContoller.startCounting();
                      Fluttertoast.showToast(
                          msg: 'Counter Stating',
                          backgroundColor: AppColors.mainColor,
                          fontSize: 15.sp,
                          textColor: Colors.white,
                          gravity: ToastGravity.CENTER_LEFT);
                      stopwatchContoller.isStartTaped.value = true;
                      stopwatchContoller.isStopTaped.value = false;
                      stopwatchContoller.isZeroingTaped.value = false;
                    } else {
                      Fluttertoast.showToast(
                          msg: 'Timer already counting',
                          backgroundColor: AppColors.mainColor,
                          fontSize: 15.sp,
                          textColor: Colors.white,
                          gravity: ToastGravity.CENTER_LEFT);
                    }
                  }, child: Obx(() {
                    return Container(
                      height: 80.h,
                      width: 80.w,
                      decoration: BoxDecoration(
                        color: stopwatchContoller.isStartTaped.value
                            ? Colors.white
                            : AppColors.mainColor,
                        borderRadius: BorderRadius.circular(40.r),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius:
                                  stopwatchContoller.isStartTaped.value
                                      ? 15
                                      : 5,
                              spreadRadius: 1,
                              blurStyle: BlurStyle.outer

                              ),
                        ],
                      ),
                      child: Center(
                          child: Icon(
                        Icons.play_arrow,
                        color: stopwatchContoller.isStartTaped.value
                            ? AppColors.mainColor
                            : Colors.white,
                        size: 35,
                      )),
                    );
                  })),
                  GestureDetector(onTap: () {
                    if (stopwatchContoller.isStopTaped.value) {
                      Fluttertoast.showToast(
                          msg: 'Timer already stopped',
                          backgroundColor: AppColors.mainColor,
                          fontSize: 15.sp,
                          textColor: Colors.white,
                          gravity: ToastGravity.CENTER_LEFT);
                    } else {
                      stopwatchContoller.stopCounting();
                      Fluttertoast.showToast(
                          msg: 'Counter Stopped',
                          backgroundColor: AppColors.mainColor,
                          fontSize: 15.sp,
                          textColor: Colors.white,
                          gravity: ToastGravity.CENTER_LEFT);
                      stopwatchContoller.isStopTaped.value = true;
                      stopwatchContoller.isStartTaped.value = false;
                      stopwatchContoller.isZeroingTaped.value = false;
                    }
                  }, child: Obx(() {
                    return Container(
                        height: 80.h,
                        width: 80.w,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius:
                                  stopwatchContoller.isStopTaped.value
                                      ? 15
                                      : 5,
                              spreadRadius: 1,
                              blurStyle: BlurStyle.outer,

                            ),
                          ],
                          color: stopwatchContoller.isStopTaped.value
                              ? Colors.white
                              : AppColors.mainColor,
                          borderRadius: BorderRadius.circular(40.r),
                        ),
                        child: const Center(
                            child: Icon(
                          Icons.stop,
                          color: Colors.red,
                          size: 35,
                        )));
                  })),
                ],
              ),
            )
          ],
        ));
  }
}

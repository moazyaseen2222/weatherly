import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';


import '../../constant/app_colors.dart';
import '../../constant/app_fonts.dart';
import '../../constant/app_text_styles.dart';
import '../../constant/spaces.dart';
import '../../controller/timer_controller.dart';

class TimerScreen extends StatelessWidget {
   TimerScreen({super.key});

 final TimerController timerController = Get.put(TimerController());

 final Color numberColor =  Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Timer')),
        body: ListView(
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 50.0.w,
                    vertical: 50.0.h
                      ),
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
                            //verticalSpace(30),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Timer',
                                  style:AppTextStyles.font40White
                                   
                                ),
                                horiznetlSpace(7),
                                const Icon(
                                  Icons.timer_sharp,
                                  color: Colors.white,
                                  size: 30,
                                )
                              ],
                            ),
                            //verticalSpace(50),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    timerController.minuteCounter.value
                                        .toString(),
                                    style:AppTextStyles.font50BoldWhite
                                    .copyWith( color: timerController.minuteCounter.value == 0? Colors.red : numberColor,)
                                     
                                  ),
                                  Text(
                                    ':',
                                    style: AppTextStyles.font50White
                                  ),
                                  Text(
                                    timerController.secondCounter.value
                                        .toString(),
                                    style:AppTextStyles.font50BoldWhite
                                    .copyWith(color: timerController.secondCounter.value == 0? Colors.red : numberColor,)
                              
                                  ),
                                  Text(
                                    '.',
                                    style: AppTextStyles.font50White
                                
                                  ),
                                  Padding(
                                    padding:  EdgeInsets.only(top: 15.0.h),
                                    child: Text(
                                      timerController.milliSecondsCounter.value
                                          .toString(),
                                      style: AppTextStyles.font30BoldWhite
                                      .copyWith(color: timerController.milliSecondsCounter.value == 0? Colors.red : numberColor,)
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
                verticalSpace(10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: timerController.minutesTextController,
                    onSubmitted: (value) {
                      int newValue = int.parse(value);
                      timerController.minuteCounter.value = newValue;
                    },
                    decoration: InputDecoration(
                        label: const Text(
                          'Enter Minutes',
                          style: TextStyle(fontFamily: AppFonts.play),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.r),
                        )),
                  ),
                ),
                verticalSpace(10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: timerController.secondsTextController,
                    onSubmitted: (value) {
                      int newValue = int.parse(value);
                      timerController.secondCounter.value = newValue;
                    },
                    decoration: InputDecoration(
                        label: const Text(
                          'Enter Seconds',
                          style: TextStyle(fontFamily: AppFonts.play),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.r),
                        )),
                  ),
                ),
                verticalSpace(150),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                        if (timerController.isZeroingTaped.value == false) {
                          timerController.zeroingCounter();
                          Fluttertoast.showToast(
                              msg: 'Counter Zeroing',
                              backgroundColor: AppColors.mainColor,
                              fontSize: 15.sp,
                              textColor: Colors.white,
                              gravity: ToastGravity.CENTER_LEFT);
                          timerController.isZeroingTaped.value = true;
                          timerController.isStopTaped.value = false;
                          timerController.isStartTaped.value = false;
                        } else {
                          Fluttertoast.showToast(
                              msg: 'Timer already Zero',
                              backgroundColor: AppColors.mainColor,
                              fontSize: 15.sp,
                              textColor: Colors.white,
                              gravity: ToastGravity.CENTER_LEFT);
                        }
                      }, 
                      child: Obx(() {
                        return Container(
                          height: 80.h,
                          width: 80.w,
                          decoration: BoxDecoration(
                            color: timerController.isZeroingTaped.value
                                ? Colors.white
                                : AppColors.mainColor,
                            borderRadius: BorderRadius.circular(40.r),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.shade400,
                                  blurRadius:
                                      timerController.isZeroingTaped.value
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
                            color: timerController.isZeroingTaped.value
                                ? AppColors.mainColor
                                : Colors.white,
                            
                            size: 35,
                          )),
                        );
                      })),
                      GestureDetector(onTap: () {
                        if (timerController.isStartTaped.value == false) {
                          timerController.minutesTextController.clear();
                          timerController.secondsTextController.clear();
                          
                         bool isCounting =  timerController.startDown();
                          
                          timerController.isStartTaped.value = isCounting;
                          timerController.isStopTaped.value = false;
                          timerController.isZeroingTaped.value = false;
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
                            color: timerController.isStartTaped.value
                                ? Colors.white
                                : AppColors.mainColor,
                            borderRadius: BorderRadius.circular(40.r),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius:
                                      timerController.isStartTaped.value
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
                            color: timerController.isStartTaped.value
                                ? AppColors.mainColor
                                : Colors.white,
                            size: 35,
                          )),
                        );
                      })),
                      GestureDetector(onTap: () {
                        timerController.stopCounting();
                        Fluttertoast.showToast(
                            msg: 'Counter Stopped',
                            backgroundColor: AppColors.mainColor,
                            fontSize: 15.sp,
                            textColor: Colors.white,
                            gravity: ToastGravity.CENTER_LEFT);
                        timerController.isStopTaped.value = true;
                        timerController.isStartTaped.value = false;
                        timerController.isZeroingTaped.value = false;
                      }, child: Obx(() {
                        return Container(
                            height: 80.h,
                            width: 80.w,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius:
                                      timerController.isStopTaped.value
                                          ? 15
                                          : 5,
                                  spreadRadius: 1,
                                  blurStyle: BlurStyle.outer,

                                ),
                              ],
                              color: timerController.isStopTaped.value
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
                ),
                SizedBox(height: 30.h),
              ],
            ),
          ],
        ));
  }
}

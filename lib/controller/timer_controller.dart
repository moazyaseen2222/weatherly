import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../constant/app_colors.dart';

class TimerController extends GetxController {
  RxInt secondCounter = 00.obs;
  RxInt minuteCounter = 0.obs;
  RxInt milliSecondsCounter = 0.obs;
  late Timer timer;
  RxBool isStartTaped = false.obs;
  RxBool isStopTaped = false.obs;
  RxBool isZeroingTaped = false.obs;




  TextEditingController minutesTextController = TextEditingController();
  TextEditingController secondsTextController = TextEditingController();

  @override
  void onInit() async {
    minutesTextController = TextEditingController();
    secondsTextController = TextEditingController();
    super.onInit();
  }

  bool startDown() {

    if(secondCounter.value ==0 && minuteCounter.value ==0){
      
              Fluttertoast.showToast(
                              msg: 'At least add 1 second!',
                              backgroundColor: AppColors.mainColor,
                              fontSize: 15.sp,
                              textColor: Colors.white,
                              gravity: ToastGravity.CENTER_LEFT);
                              return false;
    }else{
      Fluttertoast.showToast(
                              msg: 'Counter Starting',
                              backgroundColor: AppColors.mainColor,
                              fontSize: 15.sp,
                              textColor: Colors.white,
                              gravity: ToastGravity.CENTER_LEFT);
      if(minuteCounter.value !=0 && secondCounter.value ==0){
            minuteCounter.value--;
             secondCounter.value = 60;
      milliSecondsCounter.value = 100;
   
      }else if(secondCounter.value !=0 && minuteCounter.value ==0){
            
             secondCounter.value--;
      milliSecondsCounter.value = 100;
      }
       milliSecondsCounter.value = 100;
      timer = Timer.periodic(const Duration(milliseconds: 10), (timer) {

                  milliSecondsCounter --;

                  
              if (milliSecondsCounter.value == 0 && secondCounter.value !=0) {
                   
                  secondCounter.value--;
                  milliSecondsCounter.value = 100;

                  if(secondCounter.value==0){
                    if(minuteCounter.value ==0){



                      // TIME OUT

                      stopCounting();
                      minutesTextController.clear();
                      secondsTextController.clear();
                      milliSecondsCounter.value = 0;

                       Fluttertoast.showToast(
                              msg: 'Time Out',
                              backgroundColor: AppColors.mainColor,
                              fontSize: 15.sp,
                              textColor: Colors.white,
                              gravity: ToastGravity.CENTER_LEFT);

                              isStartTaped.value = false;
                              
                    }
                 if(minuteCounter.value !=0){
                  minuteCounter.value--;
                 secondCounter.value = 60;
                 }

               }
               }
               

    });
    return true;
    }
    
  }

  void stopCounting() {
    timer.cancel();
  }

  void zeroingCounter() {
    timer.cancel();
    secondCounter.value = 0;
    minuteCounter.value = 0;
    milliSecondsCounter.value = 0;
  }

// void _playSound() async {
//   await audioPlayer.play('sounds/time_out.mp3');
// }
}

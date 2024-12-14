import 'dart:async';

import 'package:get/get.dart';

class StopwatchContoller extends GetxController {
  RxInt secondCounter = 0.obs;
  RxInt meniutCounter = 0.obs;
  RxInt milliSeconds = 00.obs;
  late Timer timer;
  RxBool isStartTaped = false.obs;
  RxBool isStopTaped = false.obs;
  RxBool isZeroingTaped = false.obs;

  void startCounting() {
    timer = Timer.periodic(const Duration(milliseconds: 10), (timer) {
        milliSeconds ++;
      if (milliSeconds.value == 100) {
        secondCounter.value++;
        milliSeconds.value = 00;
        if(secondCounter.value == 60){
          meniutCounter.value++;
          secondCounter.value = 0;
        }
      }
    });
  }

  void stopCounting() {
    timer.cancel();
  }

  void zeroingCounter() {
    timer.cancel();
    secondCounter.value = 0;
    meniutCounter.value = 0;
    milliSeconds.value = 00;
  }
}

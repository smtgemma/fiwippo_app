import 'dart:async';

import 'package:get/get.dart';

class OTPVerifyController extends GetxController {
  var secondsLeft = 30.obs;
  var canResend = false.obs;
  Timer? timer;
  bool isFromForgotPassword = false;

  @override
  void onInit() {
    startTimer();
    final args = Get.arguments;
    if (args != null && args['isFromForgotPassword'] == true) {
      isFromForgotPassword = true;
    }
    super.onInit();
  }

  void startTimer() {
    canResend.value = false;
    secondsLeft.value = 30;

    timer?.cancel();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (secondsLeft.value > 0) {
        secondsLeft.value--;
      } else {
        canResend.value = true;
        timer.cancel();
      }
    });
  }

  void resendOtp(String phone) {
    startTimer();
    // send otp again
  }

  void verifyOtp(String pin) {
    // verify logic
  }

  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }
}

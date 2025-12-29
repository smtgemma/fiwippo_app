import 'package:fiwippo_ecommerce_app/app/routes/app_pages.dart';
import 'package:fiwippo_ecommerce_app/core/constants/app_appbar.dart';
import 'package:fiwippo_ecommerce_app/core/constants/custom_text_style.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../controllers/o_t_p_verify_controller.dart';

class OTPVerifyView extends GetView<OTPVerifyController> {
  const OTPVerifyView({super.key});
  @override
  Widget build(BuildContext context) {
    final phone = Get.arguments?['phone'];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              AppAppbar(),
              SizedBox(height: 30.h),

              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Verify Your Email ',
                    style: CustomTextStyles.t22(weight: FontWeight.w600),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    'Enter the 6-digit code sent to your email',
                    style: CustomTextStyles.t16(weight: FontWeight.w400),
                  ),
                  SizedBox(height: 15.h),
                  Pinput(
                    length: 6,
                    showCursor: true,
                    onCompleted: (pin) {
                      controller.verifyOtp(pin);
                    },
                    defaultPinTheme: PinTheme(
                      width: 50,
                      height: 56,
                      textStyle: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xffE9E9E9),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    focusedPinTheme: PinTheme(
                      width: 50,
                      height: 56,
                      textStyle: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.blue, width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20),

              Obx(
                () => RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: "Didn't receive OTP?\n",
                    style: CustomTextStyles.t16(color: Colors.black54),
                    children: [
                      controller.canResend.value
                          ? TextSpan(
                              text: "Re-send code",
                              style: CustomTextStyles.t16(
                                color: Color(0xff8B6914),
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  controller.resendOtp(phone);
                                },
                            )
                          : TextSpan(
                              text: "Re-send code in ",
                              style: CustomTextStyles.t16(
                                color: Color(0xff848484),
                              ),
                            ),
                      if (!controller.canResend.value)
                        TextSpan(
                          text:
                              "0:${controller.secondsLeft.value.toString().padLeft(2, '0')}",
                          style: CustomTextStyles.t16(
                            color: Colors.black87,
                            weight: FontWeight.bold,
                          ),
                        ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 20.h),

              ElevatedButton(
                onPressed: () {
                  if (controller.isFromForgotPassword) {
                    Get.toNamed(Routes.RESET_PASS);
                    return;
                  } else {
                    Get.toNamed(Routes.SET_LOCATION_SCREEN);
                  }
                },
                child: Text('Save'),
              ),
              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }
}

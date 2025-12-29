import 'package:fiwippo_ecommerce_app/app/routes/app_pages.dart';
import 'package:fiwippo_ecommerce_app/core/constants/app_appbar.dart';
import 'package:fiwippo_ecommerce_app/core/constants/custom_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/reset_pass_controller.dart';

class ResetPassView extends GetView<ResetPassController> {
  const ResetPassView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Center(
            child: Column(
              children: [
                AppAppbar(),
                SizedBox(height: 20.h),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Form(
                    key: controller.upFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 14.h),
                        Text(
                          'Set Password',
                          style: CustomTextStyles.t16(
                            weight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(height: 7.h),

                        Obx(
                          () => TextFormField(
                            controller: controller.passwordController,
                            obscureText: controller.isSetPasswordHidden.value,
                            decoration: InputDecoration(
                              hintText: 'Type New Password',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  color: Colors.black54,
                                  controller.isSetPasswordHidden.value
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                                onPressed: () {
                                  controller
                                      .togglePasswordVisibility(); // fixed here
                                },
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              } else if (value.length < 8) {
                                return 'Password must be at least 8 characters long';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(height: 14.h),
                        Text(
                          'Confirm  Password',
                          style: CustomTextStyles.t16(
                            weight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(height: 7.h),

                        Obx(
                          () => TextFormField(
                            controller: controller.newPasswordController,
                            obscureText:
                                controller.isSetNewPasswordHidden.value,
                            decoration: InputDecoration(
                              hintText: 'Confirm New Password',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  color: Colors.black54,
                                  controller.isSetNewPasswordHidden.value
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                                onPressed: () {
                                  controller
                                      .toggleNewPasswordVisibility(); // fixed here
                                },
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              } else if (value.length < 8) {
                                return 'Password must be at least 8 characters long';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(height: 14.h),
                        ElevatedButton(
                          onPressed: () {
                            if (controller.upFormKey.currentState!.validate()) {
                              Get.toNamed(Routes.VERIFICATION_SUCCESS);
                            } else {
                              Get.snackbar(
                                'Error',
                                'Please fill all the fields',
                              );
                            }
                          },

                          child: Text('Set Password'),
                        ),
                        SizedBox(height: 14.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Obx(
                              () => Checkbox(
                                value: controller.rememberMe.value,
                                onChanged: (value) {
                                  controller.toggleRememberMe(value!);
                                },
                              ),
                            ),
                            Text(
                              'I Agree with Privacy and Policy',
                              style: CustomTextStyles.t14(
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 50.h),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

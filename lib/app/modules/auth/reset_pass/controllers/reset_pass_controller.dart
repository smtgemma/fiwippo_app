import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassController extends GetxController {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final GlobalKey<FormState> upFormKey = GlobalKey<FormState>();

  RxBool rememberMe = false.obs;
  RxString selectedOption = ''.obs;

  RxBool isSetPasswordHidden = true.obs;
  RxBool isSetNewPasswordHidden = true.obs;

  void togglePasswordVisibility() {
    isSetPasswordHidden.value = !isSetPasswordHidden.value;
  }

  void toggleNewPasswordVisibility() {
    isSetNewPasswordHidden.value = !isSetNewPasswordHidden.value;
  }

  void toggleRememberMe(bool value) {
    rememberMe.value = value;
  }

  void selectOption(String option) {
    selectedOption.value = option;
  }
}

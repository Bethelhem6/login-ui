import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController textEditingController = TextEditingController();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  RxBool enableButton = false.obs;

  @override
  void onInit() {
    super.onInit();
    textEditingController.addListener(() {
      enableButton.value = _validEmail(textEditingController.text);
    });
  }

  bool _validEmail(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  String? isEmailValid(String email) {
    if (email.isEmpty) {
      enableButton.value = false;
      return 'Please Enter Your Email';
    } else if (!_validEmail(email)) {
      enableButton.value = false;
      return 'Please Enter Valid Email';
    }
    changeStatus();
    return null;
  }

  checkLogin() {
    final isValid = loginFormKey.currentState!.validate();
    if (!isValid) {
      return null;
    } else {
      changeStatus();
      loginFormKey.currentState!.save();
    }
  }

  changeStatus() {
    enableButton.value = true;
  }

  @override
  void onClose() {
    textEditingController.dispose();
    super.onClose();
  }
}

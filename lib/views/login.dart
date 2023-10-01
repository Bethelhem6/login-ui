import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/exports.dart';
import '../controller/exports.dart';
import '../widget/export.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final FocusNode _emailFocus = FocusNode();
  LoginController loginController = Get.put(LoginController());

  void removeLastChar() {
    loginController.textEditingController.text = loginController
        .textEditingController.text
        .substring(0, loginController.textEditingController.text.length - 1);
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: loginController.loginFormKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50.0),
                child: Text("Log in",
                    style: Theme.of(context).textTheme.titleLarge),
              ),
              Expanded(
                child: ListView(
                  children: [
                    LineTextField(
                        controller: loginController.textEditingController,
                        placeholder: "E-mail",
                        right: GestureDetector(
                          onTap: () {
                            removeLastChar();
                          },
                          child: Icon(
                            Icons.cancel,
                            color: AppColors.ligtGray,
                          ),
                        ),
                        focusNode: _emailFocus,
                        validator: (value) =>
                            loginController.isEmailValid(value!)),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 10),
                    child: Text(
                      "Find e-mail",
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: AppColors.ligtGray,
                          fontWeight: FontWeight.bold,
                          fontSize: AppFont.mediumText),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 10),
                    child: Text(
                      "|",
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: AppColors.ligtGray,
                          fontWeight: FontWeight.bold,
                          fontSize: AppFont.mediumText),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "Find password",
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: AppColors.ligtGray,
                          fontWeight: FontWeight.bold,
                          fontSize: AppFont.mediumText),
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  loginController.checkLogin();
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: CustomBtn(
                    text: loginController.enableButton.value
                        ? "Next"
                        : "Enter your e-mail address",
                    width: width,
                    btnColor: loginController.enableButton.value
                        ? AppColors.darkGray
                        : AppColors.ligtGray,
                    btnTextColor: AppColors.color,
                  ),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}

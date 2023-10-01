import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'export.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = const Duration(seconds: 1);
    return Timer(duration, route);
  }

  route() {
    Get.to(() => LoginPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Image.asset(
                "assets/splash_image.png",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:e_commerce/const/app_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFF6B6B),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Text(
            AppString.appName,
            style: TextStyle(
              fontSize: 44.0.sp,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          )),
        ],
      ),
    );
  }
}

import 'package:e_commerce/const/app_colors.dart';
import 'package:e_commerce/const/app_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'auth/signup_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState

    Future.delayed(
        Duration(seconds: 1),
        () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => SignUpScreen())));
    super.initState();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.pastelRed,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppString.appName,
                style: TextStyle(
                  fontSize: 44.0.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20.h),
              CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 6.2.w,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:e_commerce/const/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserFormScreen extends StatelessWidget {
  const UserFormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 120.0.h),
          Text(
            "Submit the form to continue.",
            style: TextStyle(
              fontSize: 30.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.pastelRed,
            ),
          ),
          SizedBox(height: 20.0.h),
          Text(
            "We will not share your information with anyone.",
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w300,
              color: Colors.black87,
            ),
          ),

        ],
      ),
    );
  }
}

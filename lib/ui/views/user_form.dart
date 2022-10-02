import 'package:e_commerce/const/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserFormScreen extends StatelessWidget {
  const UserFormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 120.0.h),
          Text(
            "Submit the form to continue.",
            style: TextStyle(
              fontSize: 27.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.pastelRed,
            ),
          ),
          SizedBox(height: 2.0.h),
          Text(
            "We will not share your information with anyone.",
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w300,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 150.0.h),
          
        ],
      ),
    );
  }
}

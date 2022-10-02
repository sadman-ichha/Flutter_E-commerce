import 'package:e_commerce/const/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../views/auth/login_screen.dart';



Widget pastelRedButton(String title, onAction) {
  return InkWell(
    onTap: onAction,
    child: Container(
      height: 55.0.h,
      width: 350.0.w,
      decoration: BoxDecoration(
          color: AppColors.pastelRed,
          borderRadius: BorderRadius.all(Radius.circular(10.0.r))),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            fontSize: 20.0.sp,
            fontWeight: FontWeight.w300,
            color: Colors.white,
          ),
        ),
      ),
    ),
  );
}



Widget anAccountName(context, String title1, String title2) {
  return Wrap(
    children: [
      Text(
        title1,
        style: TextStyle(
          fontSize: 13.sp,
          fontWeight: FontWeight.w300,
          color:Colors.black87,
        ),
      ),
      GestureDetector(
        onTap: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginScreen())),
        child: Text(
          title2,
          style: TextStyle(
            fontSize: 13.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.pastelRed,
          ),
        ),
      ),
    ],
  );
}

// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'dart:ui';

import 'package:e_commerce/const/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget customEmailField(String imagePath,controller) {
  return Row(
    children: [
      Container(
        height: 50.0.h,
        width: 50.0.w,
        decoration: BoxDecoration(
          color: AppColors.pastelRed,
          borderRadius: BorderRadius.all(Radius.circular(12.0.r)),
        ),
        child: Center(
            child: Image.asset(imagePath, color: Colors.white, height: 28.0.h)),
      ),
      SizedBox(width: 20.0.w),
      Expanded(
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: "name@gmail.com",
            hintStyle:
                TextStyle(fontSize: 14.0.sp, fontWeight: FontWeight.w300),
            labelText: "EMAIL",
            labelStyle: TextStyle(
              color: AppColors.pastelRed,
            ),
          ),
        ),
      ),
    ],
  );
}


// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:e_commerce/const/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "E-Commerce",
          style: TextStyle(
              color: Colors.black,
              fontSize: 35.0.sp,
              fontWeight: FontWeight.w600),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 30.0.h),
            Padding(
              padding:  EdgeInsets.only(left: 25.0.w,right: 25.0.w),
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 60.0.h,
                      child: TextFormField(
                        readOnly: true,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(0)),
                              borderSide: BorderSide(color: Colors.blue)),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(0)),
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          hintText: "Search products here",
                          hintStyle: TextStyle(height: 1.3.h),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 60.0.h,
                    width: 60.0.h,
                    decoration: BoxDecoration(
                      color: AppColors.pastelRed,
                    ),
                    child: Center(
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.search,
                            size: 30,
                          )),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

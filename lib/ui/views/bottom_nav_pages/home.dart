import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 100.0.h),
          Text(
            "E-Commerce",
            style: TextStyle(
                color: Colors.black,
                fontSize: 35.0.sp,
                fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}

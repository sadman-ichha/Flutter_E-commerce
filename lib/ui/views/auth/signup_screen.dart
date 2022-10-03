import 'package:e_commerce/business_logics/auth.dart';
import 'package:e_commerce/const/app_colors.dart';
import 'package:e_commerce/ui/widgets/custom_with_img_text_field.dart';
import 'package:e_commerce/ui/widgets/pastelButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pastelRed,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 100.0.h),
          Padding(
            padding: EdgeInsets.only(left: 20.0.w),
            child: Text(
              "Sign Up",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 35.0.sp,
                  fontWeight: FontWeight.w300),
            ),
          ),
          SizedBox(height: 100.0.h),
          Expanded(
            child: Container(
              width: ScreenUtil().screenWidth,
              decoration: BoxDecoration(
                  color: AppColors.mintCream,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(28.r),
                    topRight: Radius.circular(28.r),
                  )),
              child: Padding(
                padding: EdgeInsets.only(left: 25.0.w, right: 35.0.w),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 30.0.h),
                      Text(
                        "Welcome Buddy!",
                        style: TextStyle(
                            color: AppColors.pastelRed,
                            fontSize: 35.0.sp,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "Glad to see you back my buddy.",
                        style: TextStyle(
                            color: AppColors.pastelRed,
                            fontSize: 15.0.sp,
                            fontWeight: FontWeight.w300),
                      ),
                      SizedBox(height: 30.0.h),
                      customEmailField(
                          "assets/icons/email.png", _emailController),
                      SizedBox(height: 20.0.h),
                      Row(
                        children: [
                          Container(
                            height: 50.0.h,
                            width: 50.0.w,
                            decoration: BoxDecoration(
                              color: AppColors.pastelRed,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.0.r)),
                            ),
                            child: Center(
                                child: Image.asset("assets/icons/lock.png",
                                    color: Colors.white, height: 25.0.h)),
                          ),
                          SizedBox(width: 20.0.w),
                          Expanded(
                            child: TextFormField(
                              controller: _passwordController,
                              decoration: InputDecoration(
                                hintText: "password must be 6 character",
                                hintStyle: TextStyle(
                                    fontSize: 14.0.sp,
                                    fontWeight: FontWeight.w500),
                                labelText: "PASSWORD",
                                labelStyle:
                                    TextStyle(color: AppColors.pastelRed),
                                suffixIcon: _obscureText == true
                                    ? IconButton(
                                        onPressed: () {
                                          setState(() {
                                            _obscureText = false;
                                          });
                                        },
                                        icon: Icon(
                                          Icons.remove_red_eye,
                                          size: 25.w,
                                        ))
                                    : IconButton(
                                        onPressed: () {
                                          _obscureText = true;
                                        },
                                        icon: Icon(Icons.visibility_off)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 160.0.h),
                      Center(
                        child: PastelRedButton(
                            "SIGN UP",
                            () => Auth().signUp(context, _emailController.text,
                                _passwordController.text)),
                      ),
                      SizedBox(height: 20.0.h),
                      Center(
                          child: anAccountName(
                              context,
                              "Do you  have an account?",
                              " Login",
                              () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen())))),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

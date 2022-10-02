import 'package:e_commerce/const/app_colors.dart';
import 'package:e_commerce/ui/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserFormScreen extends StatefulWidget {
  const UserFormScreen({Key? key}) : super(key: key);

  @override
  State<UserFormScreen> createState() => _UserFormScreenState();
}

class _UserFormScreenState extends State<UserFormScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _dobController = TextEditingController();
  TextEditingController _genderController = TextEditingController();
  TextEditingController _ageController = TextEditingController();

  List<String> genderItems = ["Male", "Female", "Others"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 25.0.w, right: 35.0.w),
        child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 120.0.h),
              Text(
                "Submit the form to continue.",
                style: TextStyle(
                  fontSize: 25.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.pastelRed,
                ),
              ),
              SizedBox(height: 2.0.h),
              Text(
                "We will not share your information with anyone.",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w300,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 100.0.h),
              customTextField("Name", _nameController, TextInputType.name),
              SizedBox(height: 10.0.h),
              customTextField(
                  "Phone Number", _phoneController, TextInputType.phone),
              SizedBox(height: 10.0.h),
              TextField(
                controller: _dobController,
                readOnly: true,
                decoration: InputDecoration(
                  hintText: "Date of Birth",
                  hintStyle:
                      TextStyle(fontSize: 17.0.sp, fontWeight: FontWeight.w300),
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      'assets/icons/calendar.png',
                      width: 22.0.w,
                      height: 22.0.h,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.0.h),
              TextField(
                controller: _genderController,
                readOnly: true,
                decoration: InputDecoration(
                  hintText: "Gender",
                  hintStyle:
                      TextStyle(fontSize: 17.0.sp, fontWeight: FontWeight.w300),
                  prefixIcon: DropdownButton(
                      items: genderItems.map((String value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(value),
                          onTap: () {
                            setState(() {
                              _genderController.text = value;
                            });
                          },
                        );
                      }).toList(),
                      onChanged: (context) {}),
                ),
              ),
              SizedBox(height: 10.0.h),
              customTextField("Age", _ageController, TextInputType.number),
            ]),
      ),
    );
  }
}

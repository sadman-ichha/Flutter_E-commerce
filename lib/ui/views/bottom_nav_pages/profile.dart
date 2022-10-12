import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../const/app_colors.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/pastelButton.dart';

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _HomeState();
}

class _HomeState extends State<Profile> {
  DateTime currentDate = DateTime.now();
  String? dob;
  selectedDate(context) async {
    final showDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(2000),
        lastDate: DateTime(2030));

    if (showDate != null && showDate != currentDate) {
      dob = "${showDate.day}-${showDate.month}-${showDate.year}";
      _dobController.text = dob!;
    }
  }

  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _dobController = TextEditingController();
  TextEditingController _genderController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  // final Stream userStream = FirebaseFirestore.instance
  //     .collection("users-form-data")
  //     .doc(FirebaseAuth.instance.currentUser!.email)
  //     .snapshots();
  setUserData(userData) {
    _nameController.text = userData["name"];
    _phoneController.text = userData["phone number"].toString();
    _dobController.text = userData["dob"];
    _ageController.text = userData["age"].toString();
    return Column(
      // mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 100.0.h),
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
        SizedBox(height: 80.0.h),
        customTextField("Name", _nameController, TextInputType.name),
        SizedBox(height: 10.0.h),
        customTextField("Phone Number", _phoneController, TextInputType.phone),
        SizedBox(height: 10.0.h),
        TextField(
          controller: _dobController,
          readOnly: true,
          decoration: InputDecoration(
            hintText: "Date of Birth",
            hintStyle:
                TextStyle(fontSize: 17.0.sp, fontWeight: FontWeight.w300),
            suffixIcon: IconButton(
              onPressed: () => selectedDate(context),
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
        // TextField(
        //   controller: _genderController,
        //   readOnly: true,
        //   decoration: InputDecoration(
        //     hintText: "Gender",
        //     hintStyle:
        //         TextStyle(fontSize: 17.0.sp, fontWeight: FontWeight.w300),
        //     suffixIcon: DropdownButton(
        //         items: genderItems.map((String value) {
        //           return DropdownMenuItem(
        //             value: value,
        //             child: Text(value),
        //             onTap: () {
        //               setState(() {
        //                 _genderController.text = value;
        //               });
        //             },
        //           );
        //         }).toList(),
        //         onChanged: (context) {}),
        //   ),
        // ),

        SizedBox(height: 10.0.h),
        customTextField("Age", _ageController, TextInputType.number),
        SizedBox(height: 140.0.h),
        PastelRedButton(
          "Update",
          () => updateData(),
        ),
      ],
    );
  }

  updateData() {
    try {
      CollectionReference collectionReference =
          FirebaseFirestore.instance.collection("users-form-data");
      final user = FirebaseAuth.instance.currentUser!.email;
      collectionReference
          .doc(user)
          .update({
            "name": _nameController.text,
            'phone number': _phoneController.text,
            'dob': _dobController.value.text,
            "age": _ageController.text,
          })
          .whenComplete(() => Fluttertoast.showToast(msg: "Update Successful"))
          .then((value) => Navigator.pop(context));
    } catch (e) {
      Fluttertoast.showToast(msg: "Something is wrong");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(left: 35.0.w, right: 35.0.w),
          child: SingleChildScrollView(
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("users-form-data")
                  .doc(FirebaseAuth.instance.currentUser!.email)
                  .snapshots(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                var userData = snapshot.data;
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return setUserData(userData);
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}

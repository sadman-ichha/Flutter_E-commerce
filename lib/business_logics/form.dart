import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/ui/views/bottom_nav_controller/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class userInfo {
  final userAuth = FirebaseAuth.instance;
  
  sentDataToDB(context, String name, int phone, String dob, String gender,
      int age) async {
    CollectionReference _userInfo =
        await FirebaseFirestore.instance.collection('users-form-data');
    _userInfo
        .doc(userAuth.currentUser!.email)
        .set({
          "name": name,
          "phone number": phone,
          "dob": dob,
          "gender": gender,
          "age": age,
        })
        .whenComplete(() => Fluttertoast.showToast(msg: "Added Successfully"))
        .catchError((error) =>
            Fluttertoast.showToast(msg: "Failed to add user: $error"));
    Navigator.push(context, MaterialPageRoute(builder: (_) => HomeScreen()));
  }
}

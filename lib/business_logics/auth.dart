import 'package:e_commerce/ui/views/user_form.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../ui/views/bottom_nav_controller.dart';

class Auth {
  Future signUp(context, String emailAddress, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailAddress, password: password);

      var authCredential = userCredential.user;
      if (authCredential!.uid.isNotEmpty) {
        Fluttertoast.showToast(msg: "Registration Successful");

        Navigator.push(
            context, MaterialPageRoute(builder: (_) => UserFormScreen()));
      } else {
        Fluttertoast.showToast(msg: "Registration Failed");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Fluttertoast.showToast(msg: 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Fluttertoast.showToast(
            msg: 'The account already exists for that email.');
      }
    } catch (e) {
      Fluttertoast.showToast(msg: 'Error is : $e');
    }
  }

  Future logIn(context, String emailAddress, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
      var authCredential = userCredential.user;
      if (authCredential!.uid.isNotEmpty) {
        Fluttertoast.showToast(msg: 'Login Successful');
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => BottomNavController()));
      } else {
        Fluttertoast.showToast(msg: 'Login Failed');
      }
    } on FirebaseException catch (e) {
      if (e.code == 'user-not-found') {
        Fluttertoast.showToast(msg: 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        Fluttertoast.showToast(msg: 'Wrong password provided');
      }
    } catch (e) {
      Fluttertoast.showToast(msg: 'Somethings is Wrong');
    }
  }
}

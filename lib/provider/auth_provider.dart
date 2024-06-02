import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:minimal_chat_app/view/pages/home_page.dart';
import 'package:minimal_chat_app/view/pages/login_page.dart';
import 'package:minimal_chat_app/view/pages/profile_page.dart';

import '../utils/themes/light_theme.dart';

class AuthProvider extends ChangeNotifier {
  AuthProvider() {}

  //UI Logics

  bool isShown = false;
  final formkeyLogin = GlobalKey<FormState>();
  final formkeyRegister = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confrimpasswordController = TextEditingController();

  showPassword() {
    isShown = !isShown;
    notifyListeners();
  }

  validateEmail(String value) {
    if (value.isEmpty) {
      return 'Please enter your email';
    }
    if (!value.contains(RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$"))) {
      return "Enter Valid Email";
    }
    return null;
  }

  validatePassword(String value) {
    if (value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    if (!confrimpasswordController.text.isEmpty &&
        passwordController.text != confrimpasswordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  clearFields() {
    emailController.clear();
    passwordController.clear();
    confrimpasswordController.clear();
  }

  //change theme
  bool isDarkMode = false;
  bool changeTheme() {
    if (isDarkMode) {
      Get.changeTheme(lightTheme);
    } else {
      Get.changeTheme(darkTheme);
    }
    isDarkMode = !isDarkMode;
    notifyListeners();
    return isDarkMode;
  }

  //FireBase Logics

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  //signInWithEmailAndPassword
  Future<bool> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        firestore.collection("users").doc(userCredential.user!.uid).set({
          "uid": userCredential.user!.uid,
          "email": userCredential.user!.email,
        });
        return true;
      }
    } catch (e) {
      print(e);

      // throw Exception(e);
    }
    return false;
  }

  //signupWithEmailAndPassword
  Future<bool> signupWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      if (userCredential.user != null) {
        firestore.collection("users").doc(userCredential.user!.uid).set({
          "uid": userCredential.user!.uid,
          "email": userCredential.user!.email,
        });
        return true;
      }
    } catch (e) {
      print("exception: $e");
    }
    return false;
  }

  Future<bool> signout() async {
    try {
      await firebaseAuth.signOut();
      return true;
    } catch (e) {
      print(e);
    }
    return false;
  }
}

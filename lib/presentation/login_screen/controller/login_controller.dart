import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/presentation/login_screen/models/login_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// A controller class for the LoginScreen.
///
/// This class manages the state of the LoginScreen, including the
/// current loginModelObj
class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Rx<LoginModel> loginModelObj = LoginModel().obs;
  Rx<bool> isShowPassword = true.obs;
  Rx<bool> isLoading = false.obs;

  Future<bool> login() async {
    try {
      isLoading.value = true;
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text,
      );
      isLoading.value = false;
      if (userCredential.user != null) {
        await PrefUtils.setIsSignIn(false);
        return true;
      }
      return false;
    } on FirebaseAuthException catch (e) {
      isLoading.value = false;
      Fluttertoast.showToast(
        msg: e.message ?? "Authentication failed",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
      return false;
    } catch (e) {
      isLoading.value = false;
      Fluttertoast.showToast(msg: "An unexpected error occurred.");
      return false;
    }
  }

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
    passwordController.dispose();
  }
}

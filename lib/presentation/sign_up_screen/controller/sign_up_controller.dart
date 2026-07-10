import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/presentation/sign_up_screen/models/sign_up_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// A controller class for the SignUpScreen.
///
/// This class manages the state of the SignUpScreen, including the
/// current signUpModelObj
class SignUpController extends GetxController {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Rx<SignUpModel> signUpModelObj = SignUpModel().obs;
  Rx<bool> isShowPassword = true.obs;
  Rx<bool> isLoading = false.obs;

  Future<bool> register() async {
    try {
      isLoading.value = true;
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text,
      );
      
      if (userCredential.user != null) {
        String uid = userCredential.user!.uid;
        
        // Save user profile metadata to Firestore
        await FirebaseFirestore.instanceFor(app: Firebase.app(), databaseId: 'ai-image-app')
            .collection('ai_app')
            .doc('image_generator')
            .collection('users')
            .doc(uid)
            .set({
          'uid': uid,
          'firstName': firstNameController.text.trim(),
          'lastName': lastNameController.text.trim(),
          'email': emailController.text.trim(),
          'profileImage': '',
          'following': [],
          'followers': [],
          'createdAt': FieldValue.serverTimestamp(),
        });
        
        isLoading.value = false;
        Fluttertoast.showToast(msg: "Account created successfully!");
        return true;
      }
      isLoading.value = false;
      return false;
    } on FirebaseAuthException catch (e) {
      isLoading.value = false;
      Fluttertoast.showToast(
        msg: e.message ?? "Registration failed",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
      return false;
    } catch (e) {
      isLoading.value = false;
      Fluttertoast.showToast(msg: "An unexpected error occurred: ${e.toString()}");
      return false;
    }
  }

  @override
  void onClose() {
    super.onClose();
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
}

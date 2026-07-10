import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/presentation/edit_profile_screen/models/edit_profile_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// A controller class for the EditProfileScreen.
///
/// This class manages the state of the EditProfileScreen, including the
/// current editProfileModelObj
class EditProfileController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  Rx<EditProfileModel> editProfileModelObj = EditProfileModel().obs;
  Rx<bool> isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserProfile();
  }

  Future<void> fetchUserProfile() async {
    try {
      isLoading.value = true;
      update();

      String? uid = FirebaseAuth.instance.currentUser?.uid;
      if (uid == null) {
        isLoading.value = false;
        update();
        return;
      }

      DocumentSnapshot doc = await FirebaseFirestore.instance
          .collection('ai_app')
          .doc('image_generator')
          .collection('users')
          .doc(uid)
          .get();

      if (doc.exists && doc.data() != null) {
        var data = doc.data() as Map<String, dynamic>;
        nameController.text = data['firstName'] ?? '';
        lastNameController.text = data['lastName'] ?? '';
        emailController.text = data['email'] ?? '';
      }

      isLoading.value = false;
      update();
    } catch (e) {
      isLoading.value = false;
      update();
      print("Error loading profile for edit: $e");
    }
  }

  Future<bool> saveProfile() async {
    try {
      isLoading.value = true;
      update();

      String? uid = FirebaseAuth.instance.currentUser?.uid;
      if (uid == null) {
        isLoading.value = false;
        update();
        return false;
      }

      await FirebaseFirestore.instance
          .collection('ai_app')
          .doc('image_generator')
          .collection('users')
          .doc(uid)
          .update({
        'firstName': nameController.text.trim(),
        'lastName': lastNameController.text.trim(),
        'email': emailController.text.trim(),
      });

      isLoading.value = false;
      update();
      Fluttertoast.showToast(msg: "Profile updated successfully!");
      return true;
    } catch (e) {
      isLoading.value = false;
      update();
      print("Error saving profile: $e");
      Fluttertoast.showToast(msg: "Failed to update profile: ${e.toString()}");
      return false;
    }
  }

  @override
  void onClose() {
    super.onClose();
    nameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
  }
}

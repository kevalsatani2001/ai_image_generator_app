import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/presentation/more_popup_tab_container_screen/models/more_popup_tab_container_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

/// A controller class for the MorePopupTabContainerScreen.
///
/// This class manages the state of the MorePopupTabContainerScreen, including the
/// current morePopupTabContainerModelObj
class MorePopupTabContainerController extends GetxController with GetSingleTickerProviderStateMixin {
  Rx<MorePopupTabContainerModel> morePopupTabContainerModelObj = MorePopupTabContainerModel().obs;

  late TabController tabviewController = Get.put(TabController(vsync: this, length: 2));

  String firstName = "";
  String lastName = "";
  String profileImage = "";
  bool isLoading = false;

  @override
  void onInit() {
    super.onInit();
    fetchUserProfile();
  }

  Future<void> fetchUserProfile() async {
    try {
      isLoading = true;
      update();

      String? uid = FirebaseAuth.instance.currentUser?.uid;
      if (uid == null) {
        isLoading = false;
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
        firstName = data['firstName'] ?? '';
        lastName = data['lastName'] ?? '';
        profileImage = data['profileImage'] ?? '';
      }

      isLoading = false;
      update();
    } catch (e) {
      isLoading = false;
      update();
      print("Error loading more popup profile container info: $e");
    }
  }
}

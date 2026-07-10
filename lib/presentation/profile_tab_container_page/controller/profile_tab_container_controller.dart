import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/presentation/profile_tab_container_page/models/profile_tab_container_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

/// A controller class for the ProfileTabContainerPage.
///
/// This class manages the state of the ProfileTabContainerPage, including the
/// current profileTabContainerModelObj
class ProfileTabContainerController extends GetxController with GetSingleTickerProviderStateMixin {
  ProfileTabContainerController(this.profileTabContainerModelObj);

  Rx<ProfileTabContainerModel> profileTabContainerModelObj;

  late TabController tabviewController = TabController(vsync: this, length: 3);
  PageController pageController = PageController();

  String firstName = "";
  String lastName = "";
  String profileImage = "";
  int followersCount = 0;
  int followingCount = 0;
  int postsCount = 0;
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

      // 1. Fetch user doc
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
        List<dynamic> followers = data['followers'] as List<dynamic>? ?? [];
        List<dynamic> following = data['following'] as List<dynamic>? ?? [];
        followersCount = followers.length;
        followingCount = following.length;
      }

      // 2. Query posts count for user
      QuerySnapshot postsSnap = await FirebaseFirestore.instance
          .collection('ai_app')
          .doc('image_generator')
          .collection('posts')
          .where('userId', isEqualTo: uid)
          .get();
      postsCount = postsSnap.docs.length;

      isLoading = false;
      update();
    } catch (e) {
      isLoading = false;
      update();
      print("Error loading profile tab container info: $e");
    }
  }
}

import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/presentation/profile_one_tab_container_screen/models/profile_one_tab_container_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../models/pop_up_menu_items.dart';
import '../models/popu_up_menu_item_model.dart';

/// A controller class for the ProfileOneTabContainerScreen.
///
/// This class manages the state of the ProfileOneTabContainerScreen, including the
/// current profileOneTabContainerModelObj
class ProfileOneTabContainerController extends GetxController
    with GetSingleTickerProviderStateMixin {
  TextEditingController searchController = TextEditingController();

  List<PopupmenuItemModel> popupMenuItemList = PopupmenuItems.getPopupmenuItem();
  late TabController tabviewController = TabController(vsync: this, length: 2);
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
      print("Error loading profile one tab container info: $e");
    }
  }

  @override
  void onClose() {
    super.onClose();
    searchController.dispose();
  }
}

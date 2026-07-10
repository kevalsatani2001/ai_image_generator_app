import 'package:ai_image_generator/core/app_export.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../profile_one_tab_container_screen/models/popu_up_menu_item_model.dart';
import '../models/art_work_post_pop_up_data.dart';

class ArtworkPostController extends GetxController {
  TextEditingController seedvalueoneController = TextEditingController();
  TextEditingController seednumberoneController = TextEditingController();
  List<PopupmenuItemModel> getArtWorkPopupList = ArtworkPostPopUpmenuData.getPopupmenuItem();

  String? docId;
  Map<String, dynamic>? postData;
  bool isLoading = false;
  bool isLiked = false;

  @override
  void onInit() {
    super.onInit();
    docId = Get.arguments as String?;
    if (docId != null) {
      loadPostDetails();
    }
  }

  Future<void> loadPostDetails() async {
    try {
      isLoading = true;
      update();

      DocumentSnapshot doc = await FirebaseFirestore.instance
          .collection('ai_app')
          .doc('image_generator')
          .collection('posts')
          .doc(docId)
          .get();

      if (doc.exists && doc.data() != null) {
        postData = doc.data() as Map<String, dynamic>?;

        // check if currently liked by active user
        String? currentUid = FirebaseAuth.instance.currentUser?.uid;
        if (currentUid != null) {
          List<dynamic> likes = postData?['likes'] as List<dynamic>? ?? [];
          isLiked = likes.contains(currentUid);
        }
      }

      isLoading = false;
      update();
    } catch (e) {
      isLoading = false;
      update();
      print("Error loading post details: $e");
    }
  }

  Future<void> toggleLike() async {
    try {
      String? currentUid = FirebaseAuth.instance.currentUser?.uid;
      if (currentUid == null || docId == null) return;

      isLiked = !isLiked;
      update();

      DocumentReference postRef = FirebaseFirestore.instance
          .collection('ai_app')
          .doc('image_generator')
          .collection('posts')
          .doc(docId);
      if (isLiked) {
        await postRef.update({
          'likes': FieldValue.arrayUnion([currentUid]),
          'likesCount': FieldValue.increment(1)
        });
      } else {
        await postRef.update({
          'likes': FieldValue.arrayRemove([currentUid]),
          'likesCount': FieldValue.increment(-1)
        });
      }

      // reload post details to get updated count
      loadPostDetails();
    } catch (e) {
      isLiked = !isLiked;
      update();
      print("Error toggling like: $e");
    }
  }

  Future<void> reportPost() async {
    try {
      String? currentUid = FirebaseAuth.instance.currentUser?.uid;
      if (currentUid == null || docId == null) return;

      await FirebaseFirestore.instance
          .collection('ai_app')
          .doc('image_generator')
          .collection('posts')
          .doc(docId)
          .update({
        'reports': FieldValue.arrayUnion([currentUid])
      });
      Fluttertoast.showToast(msg: "Post has been reported successfully.");
    } catch (e) {
      print("Error reporting post: $e");
    }
  }

  @override
  void onClose() {
    super.onClose();
    seedvalueoneController.dispose();
    seednumberoneController.dispose();
  }
}

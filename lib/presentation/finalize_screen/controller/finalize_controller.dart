import 'dart:typed_data';
import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/presentation/finalize_screen/models/finalize_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// A controller class for the FinalizeScreen.
///
/// This class manages the state of the FinalizeScreen, including the
/// current finalizeModelObj
class FinalizeController extends GetxController {
  TextEditingController seedvalueoneController = TextEditingController();

  Rx<FinalizeModel> finalizeModelObj = FinalizeModel().obs;
  Rx<bool> isSelectedSwitch = false.obs;
  Rx<bool> isSelectedSwitch1 = false.obs;
  Rx<bool> isSelectedSwitch2 = false.obs;
  Rx<bool> isSelectedSwitch3 = false.obs;
  Rx<bool> isLoading = false.obs;

  Future<bool> publishPost({
    required Uint8List imageBytes,
    required String prompt,
    required String negativePrompt,
    required String style,
    required double cfgScale,
    required String seed,
  }) async {
    try {
      isLoading.value = true;
      update();

      String? currentUid = FirebaseAuth.instance.currentUser?.uid;
      if (currentUid == null) {
        isLoading.value = false;
        update();
        Fluttertoast.showToast(msg: "User not authenticated");
        return false;
      }

      // 1. Upload image bytes to Firebase Storage
      String filename = "posts/${currentUid}/${DateTime.now().millisecondsSinceEpoch}.png";
      Reference storageRef = FirebaseStorage.instance.ref().child(filename);
      UploadTask uploadTask = storageRef.putData(imageBytes);
      TaskSnapshot taskSnapshot = await uploadTask;
      String downloadUrl = await taskSnapshot.ref.getDownloadURL();

      // 2. Fetch current user metadata for creator details
      DocumentSnapshot userDoc = await FirebaseFirestore.instanceFor(app: Firebase.app(), databaseId: 'ai-image-app')
          .collection('ai_app')
          .doc('image_generator')
          .collection('users')
          .doc(currentUid)
          .get();

      String creatorName = "Quick John";
      String creatorAvatar = "";
      if (userDoc.exists && userDoc.data() != null) {
        var data = userDoc.data() as Map<String, dynamic>;
        String firstName = data['firstName'] ?? '';
        String lastName = data['lastName'] ?? '';
        creatorName = "$firstName $lastName".trim();
        creatorAvatar = data['profileImage'] ?? '';
      }

      // 3. Create post doc in Cloud Firestore
      await FirebaseFirestore.instanceFor(app: Firebase.app(), databaseId: 'ai-image-app')
          .collection('ai_app')
          .doc('image_generator')
          .collection('posts')
          .add({
        'userId': currentUid,
        'creatorName': creatorName.isNotEmpty ? creatorName : "Quick John",
        'creatorAvatar': creatorAvatar,
        'imageUrl': downloadUrl,
        'prompt': prompt,
        'negativePrompt': negativePrompt,
        'style': style,
        'cfgScale': cfgScale,
        'seed': seed,
        'likes': [],
        'likesCount': 0,
        'reports': [],
        'createdAt': FieldValue.serverTimestamp(),
      });

      isLoading.value = false;
      update();
      Fluttertoast.showToast(msg: "Post published to discover feed successfully!");
      return true;
    } catch (e) {
      isLoading.value = false;
      update();
      print("Error publishing post: $e");
      Fluttertoast.showToast(msg: "Failed to publish post: ${e.toString()}");
      return false;
    }
  }

  @override
  void onClose() {
    super.onClose();
    seedvalueoneController.dispose();
  }
}

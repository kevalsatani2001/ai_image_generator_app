import 'package:ai_image_generator/core/app_export.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PerSonalInformationScreenController extends GetxController {
  String firstName = "";
  String lastName = "";
  String email = "";
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

      DocumentSnapshot doc = await FirebaseFirestore.instanceFor(app: Firebase.app(), databaseId: 'ai-image-app')
          .collection('ai_app')
          .doc('image_generator')
          .collection('users')
          .doc(uid)
          .get();

      if (doc.exists && doc.data() != null) {
        var data = doc.data() as Map<String, dynamic>;
        firstName = data['firstName'] ?? '';
        lastName = data['lastName'] ?? '';
        email = data['email'] ?? '';
        profileImage = data['profileImage'] ?? '';
      }

      isLoading = false;
      update();
    } catch (e) {
      isLoading = false;
      update();
      print("Error fetching personal user profile: $e");
    }
  }
}
import 'package:ai_image_generator/core/app_export.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/discover_item_model.dart';

class DiscoverController extends GetxController {
  List<DiscoverItemModel> createdData = [];
  bool isLoading = false;

  @override
  void onInit() {
    super.onInit();
    fetchCreators();
  }

  Future<void> fetchCreators() async {
    try {
      isLoading = true;
      update();
      
      String? currentUid = FirebaseAuth.instance.currentUser?.uid;
      if (currentUid == null) {
        isLoading = false;
        update();
        return;
      }

      // 1. Fetch current user data to see who they follow
      DocumentSnapshot currentUserDoc = await FirebaseFirestore.instance
          .collection('ai_app')
          .doc('image_generator')
          .collection('users')
          .doc(currentUid)
          .get();
          
      List<dynamic> followingList = [];
      if (currentUserDoc.exists && currentUserDoc.data() != null) {
        var data = currentUserDoc.data() as Map<String, dynamic>;
        followingList = data['following'] as List<dynamic>? ?? [];
      }

      // 2. Fetch other creators
      QuerySnapshot creatorsSnapshot = await FirebaseFirestore.instance
          .collection('ai_app')
          .doc('image_generator')
          .collection('users')
          .get();

      List<DiscoverItemModel> tempCreators = [];
      for (var doc in creatorsSnapshot.docs) {
        if (doc.id == currentUid) continue; // skip myself
        
        var data = doc.data() as Map<String, dynamic>;
        String uid = doc.id;
        String firstName = data['firstName'] ?? '';
        String lastName = data['lastName'] ?? '';
        String displayName = "$firstName $lastName".trim();
        String username = data['username'] ?? "@${firstName.toLowerCase()}";
        String profileImage = data['profileImage'] ?? '';
        
        bool isFollow = followingList.contains(uid);
        
        tempCreators.add(DiscoverItemModel(
          profileImage.isNotEmpty ? profileImage : ImageConstant.imgCreater1,
          username,
          displayName.isNotEmpty ? displayName : "Creator",
          isFollow,
          uid.hashCode,
          uid: uid,
        ));
      }
      
      createdData = tempCreators;
      isLoading = false;
      update();
    } catch (e) {
      isLoading = false;
      update();
      print("Error fetching creators: $e");
    }
  }

  Future<void> toggleFollow(String targetUid, int index) async {
    try {
      String? currentUid = FirebaseAuth.instance.currentUser?.uid;
      if (currentUid == null) return;

      DiscoverItemModel creator = createdData[index];
      bool isNowFollowing = !(creator.isFollow ?? false);
      
      // Local update first for quick UX responsiveness
      creator.isFollow = isNowFollowing;
      update();

      // Firestore batch update
      WriteBatch batch = FirebaseFirestore.instance.batch();
      
      DocumentReference currentUserRef = FirebaseFirestore.instance
          .collection('ai_app')
          .doc('image_generator')
          .collection('users')
          .doc(currentUid);
      DocumentReference targetUserRef = FirebaseFirestore.instance
          .collection('ai_app')
          .doc('image_generator')
          .collection('users')
          .doc(targetUid);
      
      if (isNowFollowing) {
        batch.update(currentUserRef, {
          'following': FieldValue.arrayUnion([targetUid])
        });
        batch.update(targetUserRef, {
          'followers': FieldValue.arrayUnion([currentUid])
        });
      } else {
        batch.update(currentUserRef, {
          'following': FieldValue.arrayRemove([targetUid])
        });
        batch.update(targetUserRef, {
          'followers': FieldValue.arrayRemove([currentUid])
        });
      }
      
      await batch.commit();
    } catch (e) {
      print("Error toggling follow: $e");
      // rollback if failed
      createdData[index].isFollow = !(createdData[index].isFollow ?? false);
      update();
    }
  }
}

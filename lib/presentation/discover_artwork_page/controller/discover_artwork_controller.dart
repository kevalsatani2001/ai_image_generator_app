import 'package:ai_image_generator/core/app_export.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/discover1_item_model.dart';

class DiscoverArtworkController extends GetxController {
  List<Discover1ItemModel> discoverArtworkData = [];
  bool isLoading = false;

  @override
  void onInit() {
    super.onInit();
    fetchArtworks();
  }

  Future<void> fetchArtworks() async {
    try {
      isLoading = true;
      update();

      // Retrieve published artworks from Firestore ordered by creation timestamp
      QuerySnapshot postsSnapshot = await FirebaseFirestore.instance
          .collection('ai_app')
          .doc('image_generator')
          .collection('posts')
          .orderBy('createdAt', descending: true)
          .get();

      List<Discover1ItemModel> tempArtworks = [];
      for (var doc in postsSnapshot.docs) {
        var data = doc.data() as Map<String, dynamic>;
        String imageUrl = data['imageUrl'] ?? '';
        if (imageUrl.isNotEmpty) {
          tempArtworks.add(Discover1ItemModel(
            null,
            doc.id.hashCode,
            url: imageUrl,
            docId: doc.id,
          ));
        }
      }

      discoverArtworkData = tempArtworks;
      isLoading = false;
      update();
    } catch (e) {
      isLoading = false;
      update();
      print("Error fetching discover artworks: $e");
    }
  }
}

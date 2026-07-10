
import 'package:ai_image_generator/core/app_export.dart';
import 'package:image_picker/image_picker.dart';

class ImagesToPaintingOneController extends GetxController {
 XFile? images;
 // final _imageKey = GlobalKey<ImagePainterState>();

 // void saveImage(context) async {
 //  final image = await _imageKey.currentState?.exportImage();
 //  final directory = (await getApplicationDocumentsDirectory()).path;
 //  await Directory('$directory/sample').create(recursive: true);
 //  final fullPath =
 //      '$directory/sample/${DateTime.now().millisecondsSinceEpoch}.png';
 //  print("path is ======== $fullPath");
 //  final imgFile = File('$fullPath');
 //  if (image != null) {
 //   imgFile.writeAsBytesSync(image);
 //   ScaffoldMessenger.of(context).showSnackBar(
 //    SnackBar(
 //     backgroundColor: Colors.grey[700],
 //     padding: const EdgeInsets.only(left: 10),
 //     content: Row(
 //      mainAxisAlignment: MainAxisAlignment.spaceBetween,
 //      children: [
 //       const Text("Image Exported successfully.",
 //           style: TextStyle(color: Colors.white)),
 //       TextButton(
 //        onPressed: () => OpenFile.open("$fullPath"),
 //        child: Text(
 //         "Open",
 //         style: TextStyle(
 //          color: Colors.blue[200],
 //         ),
 //        ),
 //       )
 //      ],
 //     ),
 //    ),
 //   );
 //  }
 // }
}

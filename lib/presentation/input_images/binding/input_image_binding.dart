import 'package:ai_image_generator/core/app_export.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import '../controller/input_images_screen_controller.dart';

class InputImageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InputImagesController());
  }
}
import '../controller/remix_popup_controller.dart';
import 'package:get/get.dart';

/// A binding class for the RemixPopupScreen.
///
/// This class ensures that the RemixPopupController is created when the
/// RemixPopupScreen is first loaded.
class RemixPopupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RemixPopupController());
  }
}

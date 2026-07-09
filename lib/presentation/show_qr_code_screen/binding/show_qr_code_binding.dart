import '../controller/show_qr_code_controller.dart';
import 'package:get/get.dart';

/// A binding class for the ShowQrCodeScreen.
///
/// This class ensures that the ShowQrCodeController is created when the
/// ShowQrCodeScreen is first loaded.
class ShowQrCodeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ShowQrCodeController());
  }
}

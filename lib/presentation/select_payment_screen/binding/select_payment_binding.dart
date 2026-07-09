import '../controller/select_payment_controller.dart';
import 'package:get/get.dart';

/// A binding class for the SelectPaymentScreen.
///
/// This class ensures that the SelectPaymentController is created when the
/// SelectPaymentScreen is first loaded.
class SelectPaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SelectPaymentController());
  }
}

import '../controller/more_popup_one_controller.dart';
import 'package:get/get.dart';

/// A binding class for the MorePopupOneScreen.
///
/// This class ensures that the MorePopupOneController is created when the
/// MorePopupOneScreen is first loaded.
class MorePopupOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MorePopupOneController());
  }
}

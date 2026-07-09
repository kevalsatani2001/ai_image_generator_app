import '../controller/more_popup_tab_container_controller.dart';
import 'package:get/get.dart';

/// A binding class for the MorePopupTabContainerScreen.
///
/// This class ensures that the MorePopupTabContainerController is created when the
/// MorePopupTabContainerScreen is first loaded.
class MorePopupTabContainerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MorePopupTabContainerController());
  }
}

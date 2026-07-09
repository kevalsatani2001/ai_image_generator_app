
import 'package:get/get.dart';

import '../controller/follower_tab_container_controller.dart';

/// A binding class for the ForgotPasswordScreen.
///
/// This class ensures that the ForgotPasswordController is created when the
/// ForgotPasswordScreen is first loaded.
class FollowersTabContainer extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FollowersTabContainerController());
  }
}

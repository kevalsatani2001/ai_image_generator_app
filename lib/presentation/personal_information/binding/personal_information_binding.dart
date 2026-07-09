

import 'package:get/get.dart';

import '../controller/personal_information_controller.dart';

/// A binding class for the ForgotPasswordScreen.
///
/// This class ensures that the ForgotPasswordController is created when the
/// ForgotPasswordScreen is first loaded.
class PersonalInformationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PerSonalInformationScreenController());
  }
}

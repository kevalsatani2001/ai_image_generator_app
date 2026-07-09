import '../controller/thanks_for_reporting_controller.dart';
import 'package:get/get.dart';

/// A binding class for the ThanksForReportingScreen.
///
/// This class ensures that the ThanksForReportingController is created when the
/// ThanksForReportingScreen is first loaded.
class ThanksForReportingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ThanksForReportingController());
  }
}

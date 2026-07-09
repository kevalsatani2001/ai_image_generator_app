import '../controller/review_summary_controller.dart';
import 'package:get/get.dart';

/// A binding class for the ReviewSummaryScreen.
///
/// This class ensures that the ReviewSummaryController is created when the
/// ReviewSummaryScreen is first loaded.
class ReviewSummaryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ReviewSummaryController());
  }
}

import '../controller/notifications_one_controller.dart';
import 'package:get/get.dart';

/// A binding class for the NotificationsOneScreen.
///
/// This class ensures that the NotificationsOneController is created when the
/// NotificationsOneScreen is first loaded.
class NotificationsOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NotificationsOneController());
  }
}

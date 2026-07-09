import '../controller/splash_screen_seven_controller.dart';
import 'package:get/get.dart';

/// A binding class for the SplashScreenSevenScreen.
///
/// This class ensures that the SplashScreenSevenController is created when the
/// SplashScreenSevenScreen is first loaded.
class SplashScreenSevenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashScreenSevenController());
  }
}

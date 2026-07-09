import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/presentation/upgrade_screen/models/upgrade_model.dart';

import '../models/upgrade_pro_features.dart';

/// A controller class for the UpgradeScreen.
///
/// This class manages the state of the UpgradeScreen, including the
/// current upgradeModelObj
class UpgradeController extends GetxController {
 List<UpgradeModel> planFeaturesList = UpgradeProFeaters.getPlanFeatures();
}

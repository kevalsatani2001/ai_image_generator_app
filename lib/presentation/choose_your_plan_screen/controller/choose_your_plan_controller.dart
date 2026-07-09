import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/presentation/choose_your_plan_screen/models/choose_your_plan_model.dart';

import '../models/subscriptionpla_item_model.dart';

/// A controller class for the ChooseYourPlanScreen.
///
/// This class manages the state of the ChooseYourPlanScreen, including the
/// current chooseYourPlanModelObj
class ChooseYourPlanController extends GetxController {
 List<SubscriptionplaItemModel> planList = ChooseYourPlanModel.getPlanData();
 int currentPlanId = 1;
}

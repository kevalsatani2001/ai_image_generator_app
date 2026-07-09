import '../../../core/app_export.dart';
import 'subscriptionpla_item_model.dart';

/// This class defines the variables used in the [choose_your_plan_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class ChooseYourPlanModel {
  static List<SubscriptionplaItemModel> getPlanData(){
   return [
    SubscriptionplaItemModel("1 Month","Pro access for 1 month","\$50.00",1),
    SubscriptionplaItemModel("3 Month","You save 10%","\$75.00",2),
    SubscriptionplaItemModel("6 Month","You save 20%","\$100.00",3),
    SubscriptionplaItemModel("12 Month","You save 30%","\125.00",4),
    SubscriptionplaItemModel("Life time","Limited time and offer","\$50.00",5),
   ];
  }
}

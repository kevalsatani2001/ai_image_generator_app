import 'notifications_one_model.dart';

class NotificationOption{
  static List<NotificationsOneModel> getNotifyMeList(){
    return [
      NotificationsOneModel("Someone is following me",true),
      NotificationsOneModel("Someone likes my artwork",false),
      NotificationsOneModel("Someone likes my artwork",false),
      NotificationsOneModel("Someone likes my artwork",false),
      NotificationsOneModel("Someone likes my artwork",false),
      NotificationsOneModel("I made a payment",false),
      NotificationsOneModel("There are subscription updates",false),
    ];
  }
  static List<NotificationsOneModel> getSystem(){
    return [
      NotificationsOneModel("App system",false),
      NotificationsOneModel("Guidance, tips, and tricks",false),
      NotificationsOneModel("Participate in a survey",false),
    ];
  }
}
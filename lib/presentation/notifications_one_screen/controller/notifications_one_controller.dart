import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/presentation/notifications_one_screen/models/notifications_one_model.dart';

import '../models/notification_options.dart';

/// A controller class for the NotificationsOneScreen.
///
/// This class manages the state of the NotificationsOneScreen, including the
/// current notificationsOneModelObj
class NotificationsOneController extends GetxController {
 List<NotificationsOneModel> notifymeList =  NotificationOption.getNotifyMeList();
 List<NotificationsOneModel> systemList =  NotificationOption.getSystem();
}

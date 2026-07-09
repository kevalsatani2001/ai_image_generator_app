import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/presentation/security_screen/models/security_model.dart';

import '../models/sequrity_data.dart';

/// A controller class for the SecurityScreen.
///
/// This class manages the state of the SecurityScreen, including the
/// current securityModelObj
class SecurityController extends GetxController {
 List<SecurityModel> sequrityData = SequrityData.getSequrityData();
}

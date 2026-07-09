import 'package:ai_image_generator/core/app_export.dart';import 'package:ai_image_generator/presentation/show_qr_code_screen/models/show_qr_code_model.dart';/// A controller class for the ShowQrCodeScreen.
///
/// This class manages the state of the ShowQrCodeScreen, including the
/// current showQrCodeModelObj
class ShowQrCodeController extends GetxController {Rx<ShowQrCodeModel> showQrCodeModelObj = ShowQrCodeModel().obs;

 }

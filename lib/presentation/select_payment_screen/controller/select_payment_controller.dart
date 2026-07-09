import 'package:ai_image_generator/core/app_export.dart';import 'package:ai_image_generator/presentation/select_payment_screen/models/select_payment_model.dart';

import '../../payment_method_screen/models/payment_method_data.dart';
import '../../payment_method_screen/models/payment_method_model.dart';/// A controller class for the SelectPaymentScreen.
///
/// This class manages the state of the SelectPaymentScreen, including the
/// current selectPaymentModelObj
class SelectPaymentController extends GetxController {Rx<SelectPaymentModel> selectPaymentModelObj = SelectPaymentModel().obs;

List<PaymentMethodModel> paymentMethodsList = PaymentMethods.getPaymentMethods();
int currentPaymentMethos = 1;
 }

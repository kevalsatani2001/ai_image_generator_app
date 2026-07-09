import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/presentation/payment_method_screen/models/payment_method_model.dart';
import '../models/payment_method_data.dart';


class PaymentMethodController extends GetxController {
 List<PaymentMethodModel> paymentMethodsList = PaymentMethods.getPaymentMethods();
}

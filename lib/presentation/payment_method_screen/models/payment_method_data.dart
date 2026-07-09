import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/presentation/payment_method_screen/models/payment_method_model.dart';

class PaymentMethods{
  static List<PaymentMethodModel> getPaymentMethods(){
    return [
      PaymentMethodModel(ImageConstant.imgPaypal1,"Paypal",1),
      PaymentMethodModel(ImageConstant.imgGooglepay1,"Google pay",2),
      PaymentMethodModel(ImageConstant.imgApplelogo1,"Apple pay",3),
      PaymentMethodModel(ImageConstant.imgVisa1,"**** **** **** 1244",4),
    ];
  }
}
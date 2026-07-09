import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/core/utils/validation_functions.dart';
import 'package:ai_image_generator/widgets/custom_elevated_button.dart';
import 'package:ai_image_generator/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'controller/add_new_card_controller.dart';


class AddNewCardScreen extends StatefulWidget {
  const AddNewCardScreen({super.key});

  @override
  State<AddNewCardScreen> createState() => _AddNewCardScreenState();
}

class _AddNewCardScreenState extends State<AddNewCardScreen> {
 AddNewCardController controller = Get.put(AddNewCardController());
 GlobalKey<FormState> _formKey = GlobalKey<FormState>();

 @override
 Widget build(BuildContext context) {
  mediaQueryData = MediaQuery.of(context);
  return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Form(
              key: _formKey,
              child: SizedBox(
                  width: double.maxFinite,
                  child: Column(children: [
                   getCommonAppBar("lbl_add_new_card".tr),
                   Container(
                       padding: EdgeInsets.symmetric(
                           horizontal: 20.h, vertical: 24.v),
                       child: Column(children: [
                        CustomTextFormField(
                            controller: controller.nameController,
                            hintText: "msg_card_holder_name".tr,
                            validator: (value) {
                             if (!isText(value)) {
                              return "Please enter valid text";
                             }
                             return null;
                            },
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 16.h, vertical: 17.v)),
                        SizedBox(height: 24.v),
                        CustomTextFormField(
                            controller: controller.cardNumberController,
                            hintText: "lbl_card_number".tr,
                            textInputType: TextInputType.number,
                            validator: (value) {
                             if (!isNumeric(value)) {
                              return "Please enter valid number";
                             }
                             return null;
                            },
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 16.h, vertical: 17.v)),
                        SizedBox(height: 24.v),
                        CustomTextFormField(
                            controller: controller.dateController,
                            hintText: "lbl_expiray_date".tr,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 16.h, vertical: 17.v)),
                        SizedBox(height: 24.v),
                        CustomTextFormField(
                            controller: controller.cvvController,
                            hintText: "lbl_cvv".tr,
                            textInputAction: TextInputAction.done,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 16.h, vertical: 17.v)),
                        SizedBox(height: 5.v)
                       ]))
                  ]))),
          bottomNavigationBar: Container(
              margin: EdgeInsets.only(left: 20.h, right: 20.h, bottom: 24.v),
              decoration: AppDecoration.white,
              child: CustomElevatedButton(onTap: () {
                Get.back();
              },text: "lbl_add".tr))));
 }

 onTapAddnewcard() {
Get.back();
 }
}





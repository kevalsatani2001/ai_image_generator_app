import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/widgets/custom_elevated_button.dart';
import 'package:ai_image_generator/widgets/custom_outlined_button.dart';
import 'package:ai_image_generator/widgets/custom_text_form_field.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import '../edit_four_screen/controller/edit_four_controller.dart';
import 'controller/finalize_eight_controller.dart';



class FinalizeEightScreen extends StatefulWidget {
  const FinalizeEightScreen({super.key});

  @override
  State<FinalizeEightScreen> createState() => _FinalizeEightScreenState();
}

class _FinalizeEightScreenState extends State<FinalizeEightScreen> {
 FinalizeEightController controller = Get.put(FinalizeEightController());
 @override
 Widget build(BuildContext context) {
  mediaQueryData = MediaQuery.of(context);
  return WillPopScope(
   onWillPop: () async{
    Get.back();
     return true;
   },
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: ColorfulSafeArea(
           color: appTheme.whiteA700,
            child: GetBuilder<EditFourController>(
             init: EditFourController(),
              builder:(editFourController) =>  SizedBox(
                  width: double.maxFinite,
                  child: Column(children: [
                   getCommonAppBar("lbl_finalize".tr),
                   Container(
                       padding: EdgeInsets.symmetric(
                           horizontal: 20.h, vertical: 24.v),
                       child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [

                            editFourController.bdata == null?Container(
                             height: 374.v,
                             width: double.infinity,
                             child: Center(
                               child: Container(height: 50.v,
                                   width:50.v,child: CircularProgressIndicator()),
                             ),
                            ): Container(
                                height: 374.v,
                           width: double.infinity,
                                child: Image.memory(editFourController.bdata!,fit: BoxFit.fill,),),
                            SizedBox(height: 26.v),
                            Text("lbl_add_title".tr,
                                style: theme.textTheme.titleMedium),
                            SizedBox(height: 18.v),
                            CustomTextFormField(
                                controller:
                                controller.womenSketchTextController,
                                hintText: "msg_women_sketch_to".tr,
                                textInputAction: TextInputAction.done),
                            SizedBox(height: 5.v)
                           ]))
                  ])),
            ),
          ),
          bottomNavigationBar: Container(
              margin: EdgeInsets.only(left: 20.h, right: 20.h, bottom: 24.v),
              decoration: AppDecoration.white,
              child: Container(
                  decoration: AppDecoration.white,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                       CustomOutlinedButton(
                           width: 173.h, text: "lbl_share".tr),
                       CustomElevatedButton(
                           width: 177.h, text: "lbl_download".tr)
                      ])))));
 }

 onTapArrowleftone() {
  Get.back();
 }
}






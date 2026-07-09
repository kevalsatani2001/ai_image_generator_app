import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/widgets/app_bar/appbar_button_7.dart';
import 'package:ai_image_generator/widgets/app_bar/custom_app_bar.dart';
import 'package:ai_image_generator/widgets/custom_elevated_button.dart';
import 'package:ai_image_generator/widgets/custom_outlined_button.dart';
import 'package:ai_image_generator/widgets/custom_text_form_field.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import '../edit_seven_screen/controller/edit_seven_controller.dart';
import 'controller/finalize_three_controller.dart';



class FinalizeThreeScreen extends StatefulWidget {
  const FinalizeThreeScreen({super.key});

  @override
  State<FinalizeThreeScreen> createState() => _FinalizeThreeScreenState();
}

class _FinalizeThreeScreenState extends State<FinalizeThreeScreen> {
 // EditSevenController editSevenController = Get.put(EditSevenController());
 FinalizeThreeController controller = Get.put(FinalizeThreeController());
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
            child: GetBuilder<EditSevenController>(
             init: EditSevenController(),
              builder:(editSevenController) =>  SizedBox(
                  width: double.maxFinite,
                  child: Column(children: [
                   getCommonAppBar("lbl_finalize".tr),
                   Container(
                       padding: EdgeInsets.symmetric(
                           horizontal: 20.h, vertical: 24.v),
                       child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [

                            editSevenController.bdata == null?Container(
                             height: 374.v,
                             width: double.infinity,
                             child: Container(
                              height: 50.v,
                                 width: 50.v,
                              child: CircularProgressIndicator(),
                             ),
                            ):Container(
                             height: 374.v,
                             width: double.infinity,
                             decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.h),
                              image: DecorationImage(image: MemoryImage(editSevenController.bdata!),fit: BoxFit.fill)
                             ),
                            ),

                            // CustomImageView(
                            //     imagePath: ImageConstant.imgRectangle7646,
                            //     height: 374.adaptSize,
                            //     width: 374.adaptSize,
                            //     radius: BorderRadius.circular(8.h)),
                            SizedBox(height: 26.v),
                            Text("lbl_add_title".tr,
                                style: theme.textTheme.titleMedium),
                            SizedBox(height: 18.v),
                            CustomTextFormField(
                                controller:
                                controller.actionname3enusController,
                                hintText: "lbl_recolor_images".tr,
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
                        onTap: (){
                         getDownloadDialogue(context, (){});
                        },
                           width: 177.h, text: "lbl_download".tr)
                      ])))));
 }

 onTapFinalize() {
  Get.toNamed(
   AppRoutes.editSevenScreen,
  );
 }
}







import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/widgets/custom_elevated_button.dart';
import 'package:ai_image_generator/widgets/custom_outlined_button.dart';
import 'package:ai_image_generator/widgets/custom_text_form_field.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import '../edit_nine_screen/controller/edit_nine_controller.dart';
import 'controller/sketch_to_images_two_controller.dart';





class SketchToImagesTwoScreen extends StatefulWidget {
  const SketchToImagesTwoScreen({super.key});

  @override
  State<SketchToImagesTwoScreen> createState() => _SketchToImagesTwoScreenState();
}

class _SketchToImagesTwoScreenState extends State<SketchToImagesTwoScreen> {
 EditNineController editNineController = Get.put(EditNineController());
 SketchToImagesTwoController controller = Get.put(SketchToImagesTwoController());
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
            child: GetBuilder<EditNineController>(
              init: EditNineController(),
              builder:(editNineController) =>  SizedBox(
                  width: double.maxFinite,
                  child: Column(children: [
                  getCommonAppBar("lbl_finalize".tr),
                   Container(
                       padding: EdgeInsets.symmetric(
                           horizontal: 20.h, vertical: 24.v),
                       child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Container(height: 374.v,
                               width: double.infinity,
                               decoration: BoxDecoration(  borderRadius:
                               BorderRadius.circular(8.h),),
                               child: editNineController.bdata == null?Container(
                                   height:374.v,child: Container(
                                   height: 50.v,
                                   width: 50.v,
                                   child: CircularProgressIndicator())):Image.memory(editNineController.bdata!,fit: BoxFit.fill,),),
                            SizedBox(height: 26.v),
                            Text("lbl_add_title".tr,
                                style: theme.textTheme.titleMedium),
                            SizedBox(height: 18.v),
                            CustomTextFormField(
                              width: double.infinity,
                                controller: controller.birdoneController,
                                hintText: "lbl_colourfull_bird".tr,
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
   AppRoutes.editNineScreen,
  );
 }
}






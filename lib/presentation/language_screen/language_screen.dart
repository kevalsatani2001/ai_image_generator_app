import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/widgets/app_bar/appbar_button_3.dart';
import 'package:ai_image_generator/widgets/app_bar/custom_app_bar.dart';
import 'package:ai_image_generator/widgets/custom_checkbox_button.dart';
import 'package:ai_image_generator/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'controller/language_controller.dart';
import 'models/language_model.dart';



class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
 LanguageController languageController = Get.put(LanguageController());
 @override
 Widget build(BuildContext context) {
  mediaQueryData = MediaQuery.of(context);
  return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SizedBox(
              width: double.maxFinite,
              child: Column(children: [
               getCommonAppBar("Language"),
               GetBuilder<LanguageController>(
                 init: LanguageController(),
                 builder:(controller) =>  Expanded(
                   child: ListView(
                     children: [
                               Container(
                         padding: EdgeInsets.symmetric(
                               horizontal: 20.h, vertical: 26.v),
                         child: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                Text("lbl_general".tr,
                                    style: theme.textTheme.titleMedium),
                                SizedBox(height: 18.v),
                                 ListView.builder(
                                   primary: false,
                                   shrinkWrap: true,
                                   itemCount: controller.generelLanguageList.length,
                                   itemBuilder: (context, index) {
                                     LanguageModel data = controller.generelLanguageList[index];
                                     return Padding(
                                       padding:  EdgeInsets.symmetric(vertical: 8.v),
                                       child: GestureDetector(
                                         onTap: (){
                                           controller.currentLangugeId = data.id!;
                                           controller.update();
                                         },
                                         child: Container(
                                             padding: EdgeInsets.symmetric(
                                                 horizontal: 16.h, vertical: 13.v),
                                             decoration: AppDecoration.fillGray10002
                                                 .copyWith(
                                                 borderRadius:
                                                 BorderRadiusStyle.roundedBorder8),
                                             child: Row(
                                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                               children: [
                                                 Text(data.language!,
                                                     style: theme.textTheme.bodyMedium),
                                           controller.currentLangugeId == data.id!?CustomImageView(
                                                   svgPath: ImageConstant.imgSelectedCheakmark,
                                                 ):SizedBox()
                                               ],
                                             )),
                                       ),
                                     );
                                   },),
                                SizedBox(height: 29.v),
                                Text("lbl_language".tr,
                                    style: theme.textTheme.titleMedium),
                                 ListView.builder(
                                   primary: false,
                                   shrinkWrap: true,
                                   itemCount: controller.languageList.length,
                                   itemBuilder: (context, index) {
                                     LanguageModel data = controller.languageList[index];
                                     return Padding(
                                       padding:  EdgeInsets.symmetric(vertical: 8.v),
                                       child: GestureDetector(
                                         onTap: (){
                                           controller.currentLangugeId = data.id!;
                                           controller.update();
                                         },
                                         child: Container(
                                             padding: EdgeInsets.symmetric(
                                                 horizontal: 16.h, vertical: 13.v),
                                             decoration: AppDecoration.fillGray10002
                                                 .copyWith(
                                                 borderRadius:
                                                 BorderRadiusStyle.roundedBorder8),
                                             child: Row(
                                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                               children: [
                                                 Text(data.language!,
                                                     style: theme.textTheme.bodyMedium),
                                                 controller.currentLangugeId == data.id!?CustomImageView(
                                                   svgPath: ImageConstant.imgSelectedCheakmark,
                                                 ):SizedBox()
                                               ],
                                             )),
                                       ),
                                     );
                                   },),
                               ])),
                             ],
                   ),
                 ),
               )
              ]))));
 }

 onTapLanguage() {
  Get.toNamed(
   AppRoutes.settingsScreen,
  );
 }
}

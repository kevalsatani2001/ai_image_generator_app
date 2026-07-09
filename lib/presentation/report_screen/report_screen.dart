import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/presentation/thanks_for_reporting_screen/thanks_for_reporting_screen.dart';
import 'package:ai_image_generator/widgets/custom_elevated_button.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'controller/report_controller.dart';
import 'models/report_model.dart';


class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
 ReportController reportController = Get.put(ReportController());
 @override
 Widget build(BuildContext context) {
  mediaQueryData = MediaQuery.of(context);
  return WillPopScope(
    onWillPop: () async{
      Get.back();
      return true;
    },
      child: Scaffold(
          body: ColorfulSafeArea(
            color: appTheme.whiteA700,
            child: GetBuilder<ReportController>(
              init: ReportController(),
              builder: (controller) => SizedBox(
                  width: double.maxFinite,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                  getCommonAppBar( "lbl_report".tr),
                   SizedBox(height: 20.v),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 20.h),
                      child: Text("msg_why_are_you_reporting".tr,
                          style: theme.textTheme.titleMedium),
                    ),
                        SizedBox(height: 16.v),
                   Expanded(
                     child: ListView.builder(
                       primary: false,
                       shrinkWrap: true,
                       itemCount: controller.reportDataList.length,
                       itemBuilder: (context, index) {
                         ReportModel data = controller.reportDataList[index];
                       return  Padding(
                         padding:  EdgeInsets.symmetric(horizontal: 20.h,vertical: 8.h),
                         child: GestureDetector(
                           onTap: (){
                             controller.selectedReportReason = data.id!;
                             controller.update();
                           },
                           child: Container(
                               width: double.infinity,
                               padding: EdgeInsets.symmetric(
                                   horizontal: 16.h, vertical: 17.v),
                               decoration: AppDecoration.fillGray10002
                                   .copyWith(
                                   borderRadius: BorderRadiusStyle
                                       .roundedBorder8),
                               child:Row(
                                 children: [
                                   CustomImageView(
                                     svgPath: controller.selectedReportReason == data.id?ImageConstant.imgRadioSelected:ImageConstant.imgRadiounSelected,
                                   ),
                                   SizedBox(width: 8.h,),
                                   Text(data.reportTitle!,style: theme.textTheme.bodyLarge,)
                                 ],
                               )



                              ),
                         ),
                       );
                     },),
                   ),

                  ])),
            ),
          ),
          bottomNavigationBar: Container(
              margin: EdgeInsets.only(left: 20.h, right: 20.h, bottom: 24.v),
              decoration: AppDecoration.white,
              child: CustomElevatedButton(
                  text: "lbl_report".tr,
                  onTap: () {
                   onTapReport();
                  }))));
 }
 onTapReport() {
   showDialog(
     barrierDismissible: false,
     context: context,
     builder: (context) {
       return AlertDialog(
           insetPadding: EdgeInsets.all(16),
           shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(20)),
           contentPadding: EdgeInsets.zero,
           content: ThanksForReportingScreen());
     },
   );
 }
 onTapReport1() {
  Get.toNamed(
   AppRoutes.morePopupOneScreen,
  );
 }
}






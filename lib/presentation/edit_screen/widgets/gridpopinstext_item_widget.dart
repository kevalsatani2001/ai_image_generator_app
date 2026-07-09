import '../controller/edit_controller.dart';
import '../models/font_family_model.dart';
import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class GridpopinstextItemWidget extends StatelessWidget {
  GridpopinstextItemWidget(
    this.gridpopinstextItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  FontFamilyModel gridpopinstextItemModelObj;

  EditController controller = Get.put(EditController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditController>(
      init: EditController(),
      builder:(controller) =>  GestureDetector(
        onTap: (){
          controller.currentFontFamily = gridpopinstextItemModelObj.fontFamily!;
          controller.update();
        },
        child: Container(
          padding: EdgeInsets.all(8.h),
          decoration: AppDecoration.fillGray10002.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder8,
            border: Border.all(color: controller.currentFontFamily == gridpopinstextItemModelObj.fontFamily!?appTheme.blue:Colors.transparent)
          ),
          child: Row(
            children: [


              CustomElevatedButton(
                height: 48.v,
                width: 48.h,
                text: "lbl_ag".tr,
                buttonStyle: CustomButtonStyles.fillOnErrorContainer.copyWith(
                  elevation: MaterialStatePropertyAll(0)
                ),
                buttonTextStyle:TextStyle(
                  fontSize: 16.fSize,
                  fontWeight: FontWeight.w600,
                  fontFamily:gridpopinstextItemModelObj.fontFamily!
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 16.h,
                  top: 15.v,
                  bottom: 10.v,
                ),
                child: Text(
                  gridpopinstextItemModelObj.fontFamily!,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodyLarge!.copyWith(
                    fontFamily: gridpopinstextItemModelObj.fontFamily!
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

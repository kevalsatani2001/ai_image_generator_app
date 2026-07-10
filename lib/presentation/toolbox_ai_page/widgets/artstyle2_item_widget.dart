import '../../art_styles_screen/models/artstyle_item_model.dart';
import '../controller/toolbox_ai_controller.dart';
import 'package:ai_image_generator/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Artstyle2ItemWidget extends StatelessWidget {
  Artstyle2ItemWidget(
    this.artstyle2ItemModelObj, {
    Key? key,
    this.onTapArtstyle,
  }) : super(
          key: key,
        );

  ArtstyleItemModel artstyle2ItemModelObj;

  ToolboxAiController controller = Get.put(ToolboxAiController());

  VoidCallback? onTapArtstyle;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: () {
          onTapArtstyle?.call();
        },
        child: Container(
          padding: EdgeInsets.all(4.h),
          decoration: AppDecoration.fillGray10002.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder8,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomImageView(
                imagePath: artstyle2ItemModelObj.image,
                height: 137.v,
                width: 169.h,
                radius: BorderRadius.vertical(
                  top: Radius.circular(8.h),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 8.h,
                  top: 11.v,
                  bottom: 2.v,
                ),
                child: Text(
                  artstyle2ItemModelObj.title!,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodyLarge,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

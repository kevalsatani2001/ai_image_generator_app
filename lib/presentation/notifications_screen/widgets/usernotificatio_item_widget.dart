import '../controller/notifications_controller.dart';
import '../models/usernotificatio_item_model.dart';
import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class UsernotificatioItemWidget extends StatelessWidget {
  UsernotificatioItemWidget(
    this.usernotificatioItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  UsernotificatioItemModel usernotificatioItemModelObj;

  var controller = Get.find<NotificationsController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 8.h,
        vertical: 5.v,
      ),
      decoration: AppDecoration.fillGray10002.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder8,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CustomIconButton(
            height: 48.adaptSize,
            width: 48.adaptSize,
            margin: EdgeInsets.symmetric(vertical: 2.v),
            padding: EdgeInsets.all(12.h),
            decoration: IconButtonStyleHelper.fillOnErrorContainerTL24,
            child: CustomImageView(
              svgPath: ImageConstant.imgIcnotificatuion,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 12.h,
              top: 2.v,
            ),
            child: Obx(
              () => Text(
                usernotificatioItemModelObj.notificationTex!.value,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.bodyLarge!.copyWith(
                  height: 1.50,
                ),
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(
              top: 30.v,
              bottom: 2.v,
            ),
            child: Obx(
              () => Text(
                usernotificatioItemModelObj.notificationTim!.value,
                overflow: TextOverflow.ellipsis,
                style: CustomTextStyles.bodyMediumGray700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import '../controller/choose_your_plan_controller.dart';
import '../models/subscriptionpla_item_model.dart';
import 'package:ai_image_generator/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SubscriptionplaItemWidget extends StatelessWidget {
  SubscriptionplaItemWidget(
    this.subscriptionplaItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  SubscriptionplaItemModel subscriptionplaItemModelObj;

  ChooseYourPlanController chooseYourPlanController = Get.put(ChooseYourPlanController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChooseYourPlanController>(
      init: ChooseYourPlanController(),
      builder:(controller) => GestureDetector(
        onTap: (){
          controller.currentPlanId = subscriptionplaItemModelObj.id!;
          controller.update();
        },
        child: Container(
          padding: EdgeInsets.all(16.h),
          decoration: AppDecoration.fillGray10002.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder8,
           border: Border.all(color: controller.currentPlanId == subscriptionplaItemModelObj.id?appTheme.blue:Colors.transparent)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 2.v),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      subscriptionplaItemModelObj.title!,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.titleMedium,
                    ),
                    SizedBox(height: 6.v),
                    Text(
                      subscriptionplaItemModelObj.subtitle!,
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyles.bodyMediumGray70001,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 16.v,
                  bottom: 15.v,
                ),
                child:Text(
                  subscriptionplaItemModelObj.amount!,
                  overflow: TextOverflow.ellipsis,
                  style: CustomTextStyles.titleMedium16_1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

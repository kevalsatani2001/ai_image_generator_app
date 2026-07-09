import '../more_popup_page/widgets/more_popup_item_widget.dart';
import 'controller/more_popup_controller.dart';
import 'models/more_popup_item_model.dart';
import 'models/more_popup_model.dart';
import 'package:ai_image_generator/core/app_export.dart';
import 'package:flutter/material.dart';

class MorePopupPage extends StatelessWidget {
  MorePopupPage({Key? key})
      : super(
          key: key,
        );

  MorePopupController controller =
      Get.put(MorePopupController(MorePopupModel().obs));

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          decoration: AppDecoration.white,
          child: Padding(
            padding: EdgeInsets.only(
              left: 20.h,
              top: 16.v,
              right: 20.h,
            ),
            child: Obx(
              () => GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: 178.v,
                  crossAxisCount: 2,
                  mainAxisSpacing: 20.h,
                  crossAxisSpacing: 20.h,
                ),
                physics: NeverScrollableScrollPhysics(),
                itemCount: controller
                    .morePopupModelObj.value.morePopupItemList.value.length,
                itemBuilder: (context, index) {
                  MorePopupItemModel model = controller
                      .morePopupModelObj.value.morePopupItemList.value[index];
                  return MorePopupItemWidget(
                    model,
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

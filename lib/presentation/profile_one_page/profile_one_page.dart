import '../profile_one_page/widgets/userprofile1_item_widget.dart';
import 'controller/profile_one_controller.dart';
import 'models/profile_one_model.dart';
import 'models/userprofile1_item_model.dart';
import 'package:ai_image_generator/core/app_export.dart';
import 'package:flutter/material.dart';

class ProfileOnePage extends StatelessWidget {
  ProfileOnePage({Key? key})
      : super(
          key: key,
        );

  ProfileOneController controller =
      Get.put(ProfileOneController(ProfileOneModel().obs));

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
                  mainAxisExtent: 209.v,
                  crossAxisCount: 2,
                  mainAxisSpacing: 20.h,
                  crossAxisSpacing: 20.h,
                ),
                physics: BouncingScrollPhysics(),
                itemCount: controller
                    .profileOneModelObj.value.userprofile1ItemList.value.length,
                itemBuilder: (context, index) {
                  Userprofile1ItemModel model = controller.profileOneModelObj
                      .value.userprofile1ItemList.value[index];
                  return Userprofile1ItemWidget(
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

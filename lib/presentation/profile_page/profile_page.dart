
import '../art_styles_screen/models/artstyle_item_model.dart';
import '../profile_page/widgets/profile_item_widget.dart';
import 'controller/profile_controller.dart';
import 'package:ai_image_generator/core/app_export.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key})
      : super(
          key: key,
        );

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisExtent: 177.v,
        crossAxisCount: 2,
        mainAxisSpacing: 20.h,
        crossAxisSpacing: 20.h,
      ),
      physics: NeverScrollableScrollPhysics(),
      itemCount: controller
          .createdDataList.length,
      itemBuilder: (context, index) {
        ArtstyleItemModel model = controller
            .createdDataList[index];
        return ProfileItemWidget(
          model,
        );
      },
    );
  }
}

import 'package:ai_image_generator/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../widgets/custom_search_view.dart';
import '../art_styles_screen/models/artstyle_item_model.dart';
import '../toolbox_ai_page/widgets/artstyle2_item_widget.dart';
import 'controller/toolbox_ai_controller.dart';

// ignore_for_file: must_be_immutable
class ToolboxAiPage extends StatefulWidget {
  ToolboxAiPage({Key? key}) : super(key: key);

  @override
  State<ToolboxAiPage> createState() => _ToolboxAiPageState();
}

class _ToolboxAiPageState extends State<ToolboxAiPage> {
  ToolboxAiController controller = Get.put(ToolboxAiController());

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Container(
        width: double.maxFinite,
        decoration: AppDecoration.white,
        child: Padding(
            padding: EdgeInsets.only(bottom: 5.v),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      width: double.maxFinite,
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.h, vertical: 17.v),
                      decoration: AppDecoration.outlineGray,
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 6.v),
                            Text("lbl_toolbox_ai".tr,
                                style: theme.textTheme.headlineSmall)
                          ])),
                  CustomSearchView(
                      margin: EdgeInsets.only(left: 20.h, top: 16.v, right: 20.h),
                      controller: controller.searchController,
                      hintText: "lbl_search".tr,
                      prefix: Container(
                          margin: EdgeInsets.fromLTRB(16.h, 16.v, 12.h, 16.v),
                          child: CustomImageView(
                              svgPath: ImageConstant.imgSearch)),
                      prefixConstraints: BoxConstraints(maxHeight: 56.v),
                      suffix: Padding(
                          padding: EdgeInsets.only(right: 15.h),
                          child: IconButton(
                              onPressed: () {
                                controller.searchController.clear();
                              },
                              icon: Icon(Icons.clear,
                                  color: Colors.grey.shade600))),
                      contentPadding: EdgeInsets.only(
                          top: 17.v, right: 30.h, bottom: 17.v)),
                  Expanded(
                    child: Obx(() {
                      final tools = controller.toolboxai;
                      if (tools.isEmpty) {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.search_off, size: 64.adaptSize, color: Colors.grey),
                              SizedBox(height: 16.v),
                              Text(
                                "No tools found",
                                style: theme.textTheme.titleMedium?.copyWith(
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                      return GridView.builder(
                          padding: EdgeInsets.only(
                              left: 20.h, top: 16.v, right: 20.h),
                          shrinkWrap: true,
                          primary: false,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisExtent: 182.v,
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 20.h,
                                  crossAxisSpacing: 20.h),
                          itemCount: tools.length,
                          itemBuilder: (context, index) {
                            ArtstyleItemModel model = tools[index];
                            return Artstyle2ItemWidget(model,
                                onTapArtstyle: () {
                                  final route = controller.toolRoutes[model.id];
                                  if (route != null) {
                                    Get.toNamed(route);
                                  } else {
                                    Fluttertoast.showToast(
                                        msg: "Feature coming soon!");
                                  }
                                });
                          });
                    }),
                  ),
                ])));
  }
}

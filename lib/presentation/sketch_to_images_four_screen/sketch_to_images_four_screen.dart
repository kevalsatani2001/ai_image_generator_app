import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import '../../widgets/custom_text_form_field.dart';
import '../home_screen/controller/home_controller.dart';
import '../home_screen/models/aspect_ratio_model.dart';
import '../home_screen/widgets/listview1_item_widget.dart';
import 'controller/sketch_to_images_four_controller.dart';


class SketchToImagesFourScreen extends StatefulWidget {
  const SketchToImagesFourScreen({super.key});

  @override
  State<SketchToImagesFourScreen> createState() => _SketchToImagesFourScreenState();
}

class _SketchToImagesFourScreenState extends State<SketchToImagesFourScreen> {
  SketchToImagesFourController controller = Get.put(SketchToImagesFourController());
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            body: SizedBox(
                width: double.maxFinite,
                child: Column(children: [
                  getCommonAppBar("lbl_text_to_pattern".tr),
                  Container(
                      padding: EdgeInsets.symmetric(vertical: 29.v),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                                padding: EdgeInsets.only(left: 20.h,right: 20.h,bottom: 16.v),
                                child: Text("lbl_enter_prompt".tr,
                                    style: theme.textTheme.titleMedium)),
                            Padding(
                              padding:  EdgeInsets.symmetric(horizontal: 20.h),
                              child: CustomTextFormField(
                                width: double.infinity,
                                controller: controller.promtController,
                                hintText: "msg_this_is_where_you_ll".tr,
                                textInputAction: TextInputAction.done,
                                maxLines: 3,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 16.h, vertical: 17.v),
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.only(left: 20.h, top: 28.v,bottom: 16.v),
                                child: Text("lbl_aspect_ratio".tr,
                                    style: theme.textTheme.titleMedium)),
                            GetBuilder<HomeController>(
                              init: HomeController(),
                              builder:(controller) =>  SizedBox(
                                height: 48.v,
                                child: ListView.builder(
                                  padding: EdgeInsets.only(left: 12.h, right: 12.h),
                                  itemCount: controller.aspectRatioList.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    AspectRatioModel model =
                                    controller.aspectRatioList[index];
                                    return Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 8.h),
                                      child: GestureDetector(
                                        onTap: () {
                                          controller.setCurrentSize(model.id);
                                        },
                                        child: Listview1ItemWidget(
                                          model,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ]))
                ])),
            bottomNavigationBar: Container(
                margin: EdgeInsets.only(left: 20.h, right: 20.h, bottom: 24.v),
                decoration: AppDecoration.white,
                child: CustomElevatedButton(
                    text: "lbl_generate".tr,
                    onTap: () {
                      onTapGenerate();
                    }))));
  }

  onTapGenerate() {
    Get.toNamed(
      AppRoutes.editSixScreen,
    );
  }

  onTapArrowleftone() {
    Get.back();
  }
}






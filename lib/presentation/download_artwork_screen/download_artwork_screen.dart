import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/widgets/custom_elevated_button.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';

import 'controller/download_artwork_controller.dart';
import 'models/download_artwork_model.dart';

class DownloadArtworkScreen extends StatefulWidget {
  const DownloadArtworkScreen({super.key});

  @override
  State<DownloadArtworkScreen> createState() => _DownloadArtworkScreenState();
}

class _DownloadArtworkScreenState extends State<DownloadArtworkScreen> {
  DownloadArtworkController downloadArtworkController =
  Get.put(DownloadArtworkController());

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return WillPopScope(
      onWillPop: () async {
        Get.back();
        return true;
      },
      child: ColorfulSafeArea(
          color: appTheme.white,
          child: Scaffold(
              resizeToAvoidBottomInset: false,
              body: GetBuilder<DownloadArtworkController>(
                init: DownloadArtworkController(),
                builder: (controller) => SizedBox(
                    width: double.maxFinite,
                    child: Column(children: [
                      getCommonAppBar("msg_download_artwork".tr),
                      ListView.builder(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.h, vertical: 16.v),
                        primary: false,
                        shrinkWrap: true,
                        itemCount: controller.artSizeData.length,
                        itemBuilder: (context, index) {
                          DownloadArtworkModel data =
                          controller.artSizeData[index];
                          return Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.v),
                            child: GestureDetector(
                              onTap: () {
                                controller.setCurrentSize(data);
                              },
                              child: Container(
                                  decoration: AppDecoration.fillGray10002
                                      .copyWith(
                                      border: Border.all(
                                          color:
                                          controller.cutrrentSizeId ==
                                              data.id
                                              ? appTheme.blue
                                              : Colors.transparent),
                                      borderRadius:
                                      BorderRadiusStyle.roundedBorder8),
                                  child: Padding(
                                    padding: EdgeInsets.all(16.h),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(data.size!,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: theme.textTheme.bodyLarge!
                                                .copyWith(height: 1.50)),
                                        controller.cutrrentSizeId == data.id
                                            ? CustomImageView(
                                          svgPath: ImageConstant
                                              .imgCorrectIcon,
                                          height: 24.adaptSize,
                                          width: 24.adaptSize,
                                        )
                                            : SizedBox()
                                      ],
                                    ),
                                  )),
                            ),
                          );
                        },
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.h, vertical: 24.v),
                      )
                    ])),
              ),
              bottomNavigationBar: Container(
                  margin:
                  EdgeInsets.only(left: 20.h, right: 20.h, bottom: 24.v),
                  decoration: AppDecoration.white,
                  child: CustomElevatedButton(
                      text: "lbl_download".tr,
                      onTap: () {
                        onTapDownload();
                      })))),
    );
  }

  onTapDownload() {
    Get.toNamed(
      AppRoutes.finalizeScreen,
    );
  }

  onTapDownload1() {
    Get.toNamed(
      AppRoutes.eraseObjectScreen,
    );
  }
}
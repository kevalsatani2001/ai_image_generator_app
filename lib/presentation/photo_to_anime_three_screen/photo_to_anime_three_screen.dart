import 'dart:io';

import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/widgets/custom_elevated_button.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../widgets/custom_icon_button.dart';
import 'controller/photo_to_anime_three_controller.dart';

class PhotoToAnimeThreeScreen extends StatefulWidget {
  const PhotoToAnimeThreeScreen({super.key});

  @override
  State<PhotoToAnimeThreeScreen> createState() =>
      _PhotoToAnimeThreeScreenState();
}

class _PhotoToAnimeThreeScreenState extends State<PhotoToAnimeThreeScreen> {
  PhotoToAnimeThreeController controller =
      Get.put(PhotoToAnimeThreeController());
  XFile? _image;
  final ImagePicker picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return WillPopScope(
      onWillPop: () async {
        Get.back();
        return true;
      },
      child: Scaffold(
        body: ColorfulSafeArea(
          color: appTheme.white,
          child: SizedBox(
            width: double.maxFinite,
            child: Column(
              children: [
                getCommonAppBar("Photo to anime"),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.h,
                    vertical: 24.v,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _image == null
                          ? GestureDetector(
                              onTap: () async {
                                XFile? file = await picker.pickImage(
                                    source: ImageSource.gallery);
                                setState(() {
                                  _image = file!;
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 78.h,
                                  vertical: 145.v,
                                ),
                                decoration:
                                    AppDecoration.fillGray10002.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder8,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomImageView(
                                      svgPath: ImageConstant.imgUpload,
                                      height: 50.adaptSize,
                                      width: 50.adaptSize,
                                    ),
                                    SizedBox(height: 10.v),
                                    Text(
                                      "msg_upload_your_photo".tr,
                                      style: CustomTextStyles
                                          .titleMediumOnPrimaryContainer,
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : Container(
                              height: 374.v,
                              width: double.infinity,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.h),),
                              child: Stack(children: [
                                Image.file(
                                  File(_image!.path),
                                  fit: BoxFit.fill,
                                  width: double.infinity,
                                ),
                                CustomIconButton(
                                  onTap: (){
                                    setState(() {
                                      _image = null;
                                    });
                                  },
                                    height: 24.adaptSize,
                                    width: 24.adaptSize,
                                    margin:
                                        EdgeInsets.only(top: 16.v, right: 16.h),
                                    padding: EdgeInsets.all(2.h),
                                    alignment: Alignment.topRight,
                                    child: CustomImageView(
                                        svgPath: ImageConstant
                                            .imgCloseOnerrorcontainer))
                              ]),
                            ),
                      Container(
                        width: 362.h,
                        margin: EdgeInsets.only(
                          top: 17.v,
                          right: 11.h,
                          bottom: 5.v,
                        ),
                        child: Text(
                          "msg_upload_your_photo2".tr,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: CustomTextStyles.bodyLargeOnPrimaryContainer
                              .copyWith(
                            height: 1.50,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          margin: EdgeInsets.only(
            left: 20.h,
            right: 20.h,
            bottom: 24.v,
          ),
          decoration: AppDecoration.white,
          child: CustomElevatedButton(
            onTap: () {
              Get.toNamed(AppRoutes.editArtworkOneScreen);
            },
            text: "lbl_generate".tr,
          ),
        ),
      ),
    );
  }
}

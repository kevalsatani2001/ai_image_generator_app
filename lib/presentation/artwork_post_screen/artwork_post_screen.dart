import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/core/utils/validation_functions.dart';
import 'package:ai_image_generator/presentation/remix_popup_screen/remix_popup_screen.dart';
import 'package:ai_image_generator/widgets/custom_elevated_button.dart';
import 'package:ai_image_generator/widgets/custom_icon_button.dart';
import 'package:ai_image_generator/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import '../profile_one_tab_container_screen/models/popu_up_menu_item_model.dart';
import 'controller/artwork_post_controller.dart';





class ArtworkPostScreen extends StatefulWidget {
  const ArtworkPostScreen({super.key});

  @override
  State<ArtworkPostScreen> createState() => _ArtworkPostScreenState();
}

class _ArtworkPostScreenState extends State<ArtworkPostScreen> {
 ArtworkPostController controller = Get.put(ArtworkPostController());
 GlobalKey<FormState> _formKey = GlobalKey<FormState>();

 @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formKey,
          child: SizedBox(
            width: double.maxFinite,
            child: Column(
              children: [
                getCommonAppBar("Artwork post"),
                SizedBox(height: 16.v),
                Expanded(
                  child: GetBuilder<ArtworkPostController>(
                    init: ArtworkPostController(),
                    builder: (controller) {
                      if (controller.isLoading) {
                        return Center(child: CircularProgressIndicator(color: theme.colorScheme.primary));
                      }
                      if (controller.postData == null) {
                        return Center(
                          child: Text("Post details not found", style: CustomTextStyles.bodyMediumGray700),
                        );
                      }

                      var post = controller.postData!;
                      String creatorName = post['creatorName'] ?? 'Quick John';
                      String creatorAvatar = post['creatorAvatar'] ?? '';
                      String imageUrl = post['imageUrl'] ?? '';
                      String styleName = post['style'] ?? 'AI Art';
                      String promptText = post['prompt'] ?? '';
                      String negPrompt = post['negativePrompt'] ?? 'None';
                      String cfgVal = post['cfgScale']?.toString() ?? '9';
                      String seedVal = post['seed']?.toString() ?? '123654789654';
                      int likesCount = post['likesCount'] ?? 0;

                      // Sync text controllers
                      controller.seednumberoneController.text = cfgVal;
                      controller.seedvalueoneController.text = seedVal;

                      return SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.only(left: 20.h, right: 20.h, bottom: 5.v),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 16.v),
                                decoration: AppDecoration.fillGray10002.copyWith(
                                  borderRadius: BorderRadiusStyle.roundedBorder8,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 8.h),
                                      child: Row(
                                        children: [
                                          CustomImageView(
                                            imagePath: creatorAvatar.isEmpty || creatorAvatar.startsWith('assets/') ? ImageConstant.imgEllipse236 : null,
                                            url: creatorAvatar.isNotEmpty && !creatorAvatar.startsWith('assets/') ? creatorAvatar : null,
                                            height: 40.adaptSize,
                                            width: 40.adaptSize,
                                            radius: BorderRadius.circular(20.h),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left: 11.h, top: 10.v, bottom: 7.v),
                                            child: Text(
                                              creatorName,
                                              style: CustomTextStyles.titleMedium16_1,
                                            ),
                                          ),
                                          Spacer(),
                                          CustomElevatedButton(
                                            height: 32.v,
                                            width: 94.h,
                                            text: "lbl_remix".tr,
                                            margin: EdgeInsets.symmetric(vertical: 4.v),
                                            buttonTextStyle: CustomTextStyles.titleMediumOnErrorContainerSemiBold,
                                            onTap: () {
                                              showModalBottomSheet(
                                                context: context,
                                                builder: (context) {
                                                  return RemixPopupScreen();
                                                },
                                              );
                                            },
                                          ),
                                          PopupMenuButton<PopupmenuItemModel>(
                                            color: appTheme.whiteA700,
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.h)),
                                            icon: CustomIconButton(
                                              height: 32.adaptSize,
                                              width: 32.adaptSize,
                                              margin: EdgeInsets.only(left: 8.h, top: 4.v, bottom: 4.v),
                                              padding: EdgeInsets.all(4.h),
                                              decoration: IconButtonStyleHelper.fillBlueGray,
                                              child: CustomImageView(svgPath: ImageConstant.imgOverflowmenu),
                                            ),
                                            onSelected: (PopupmenuItemModel item) {},
                                            itemBuilder: (BuildContext context) => <PopupMenuEntry<PopupmenuItemModel>>[
                                              PopupMenuItem<PopupmenuItemModel>(
                                                child: popupmenuItemFormate(() {}, controller.getArtWorkPopupList[0].icon, controller.getArtWorkPopupList[0].title!),
                                              ),
                                              PopupMenuItem<PopupmenuItemModel>(
                                                child: popupmenuItemFormate(() {}, controller.getArtWorkPopupList[1].icon, controller.getArtWorkPopupList[1].title!),
                                              ),
                                              PopupMenuItem<PopupmenuItemModel>(
                                                child: popupmenuItemFormate(() {
                                                  Get.back();
                                                  controller.reportPost();
                                                }, controller.getArtWorkPopupList[2].icon, controller.getArtWorkPopupList[2].title!),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 16.v),
                                    SizedBox(
                                      height: 342.v,
                                      width: 358.h,
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          CustomImageView(
                                            url: imageUrl.isNotEmpty ? imageUrl : null,
                                            imagePath: imageUrl.isEmpty ? ImageConstant.imgIllustrationha340x358 : null,
                                            height: 340.v,
                                            width: 358.h,
                                            radius: BorderRadius.circular(9.h),
                                            alignment: Alignment.center,
                                          ),
                                          Align(
                                            alignment: Alignment.center,
                                            child: Container(
                                              height: 342.v,
                                              width: 358.h,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(8.h),
                                                gradient: LinearGradient(
                                                  begin: Alignment(0.04, 0.07),
                                                  end: Alignment(0.98, 1),
                                                  colors: [
                                                    appTheme.black900.withOpacity(0.64),
                                                    appTheme.black900.withOpacity(0),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 8.h, top: 16.v),
                                      child: Row(
                                        children: [
                                          GestureDetector(
                                            onTap: () => controller.toggleLike(),
                                            child: CustomImageView(
                                              svgPath: ImageConstant.imgFavorite,
                                              color: controller.isLiked ? Colors.red : appTheme.gray700,
                                              height: 24.adaptSize,
                                              width: 24.adaptSize,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left: 8.h),
                                            child: Text(
                                              likesCount.toString(),
                                              style: CustomTextStyles.titleMedium16_1,
                                            ),
                                          ),
                                          CustomImageView(
                                            svgPath: ImageConstant.imgSend,
                                            height: 24.adaptSize,
                                            width: 24.adaptSize,
                                            margin: EdgeInsets.only(left: 24.h),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 20.v),
                              Text(styleName, style: theme.textTheme.titleMedium),
                              SizedBox(height: 19.v),
                              Text("lbl_prompt".tr, style: theme.textTheme.bodyLarge),
                              SizedBox(height: 8.v),
                              SizedBox(
                                width: 374.h,
                                child: Text(
                                  promptText,
                                  maxLines: 5,
                                  overflow: TextOverflow.ellipsis,
                                  style: CustomTextStyles.bodyLargeGray700.copyWith(height: 1.50),
                                ),
                              ),
                              SizedBox(height: 16.v),
                              Text("Negative Prompt", style: theme.textTheme.bodyLarge),
                              Container(
                                width: 368.h,
                                margin: EdgeInsets.only(top: 8.v, right: 5.h),
                                child: Text(
                                  negPrompt,
                                  maxLines: 7,
                                  overflow: TextOverflow.ellipsis,
                                  style: CustomTextStyles.bodyLargeGray700.copyWith(height: 1.50),
                                ),
                              ),
                              SizedBox(height: 16.v),
                              Text("lbl_cfg_scale".tr, style: theme.textTheme.titleMedium),
                              SizedBox(height: 19.v),
                              CustomTextFormField(
                                controller: controller.seednumberoneController,
                                hintText: "lbl_9".tr,
                              ),
                              SizedBox(height: 26.v),
                              Text("lbl_seed".tr, style: theme.textTheme.titleMedium),
                              CustomTextFormField(
                                filled: true,
                                controller: controller.seedvalueoneController,
                                margin: EdgeInsets.only(left: 0.h, right: 0.h, bottom: 24.v, top: 17.v),
                                hintText: "lbl_123654789654".tr,
                                textInputAction: TextInputAction.done,
                                textInputType: TextInputType.phone,
                                suffix: Container(
                                  margin: EdgeInsets.fromLTRB(30.h, 14.v, 16.h, 14.v),
                                  child: CustomImageView(svgPath: ImageConstant.imgCopy1),
                                ),
                                suffixConstraints: BoxConstraints(maxHeight: 48.v),
                                validator: (value) {
                                  if (!isValidPhone(value)) {
                                    return "Please enter valid number";
                                  }
                                  return null;
                                },
                                contentPadding: EdgeInsets.only(left: 16.h, top: 13.v, bottom: 13.v),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

 onTapRemix() {
  Get.toNamed(
   AppRoutes.remixPopupScreen,
  );
 }

 onTapBtnOverflowmenu() {
  Get.toNamed(
   AppRoutes.morePopupOneScreen,
  );
 }

 popupmenuItemFormate(function,icon,text){
   return GestureDetector(
     onTap: function,
     child: Row(children: [
       CustomImageView(
           svgPath: icon,
           height: 24.adaptSize,
           width: 24.adaptSize),
       Padding(
           padding:
           EdgeInsets.only(
               left: 12.h,
               top: 2.v),
           child: Text(
               text,
               style: theme
                   .textTheme
                   .bodyLarge))
     ]),
   );
 }
}







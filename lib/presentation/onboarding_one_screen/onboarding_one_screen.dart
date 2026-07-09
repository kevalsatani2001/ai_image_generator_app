import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/widgets/custom_elevated_button.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';

import 'controller/onboarding_one_controller.dart';
import 'models/sliderturnyourw_item_model.dart';





class OnboardingOneScreen extends StatefulWidget {
  const OnboardingOneScreen({super.key});

  @override
  State<OnboardingOneScreen> createState() => _OnboardingOneScreenState();
}

class _OnboardingOneScreenState extends State<OnboardingOneScreen> {
  OnboardingOneController onboardingOneController = Get.put(OnboardingOneController());
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return WillPopScope(
        onWillPop: () async {
          closeApp();
          return true;
        },
        child: Scaffold(

          body: GetBuilder<OnboardingOneController>(
            init: OnboardingOneController(),
            builder: (controller) => ColorfulSafeArea(
              color: Colors.transparent,
              child: Stack(
                children: [
                  PageView.builder(
                    controller: controller.pageController,
                    onPageChanged: (value) {
                      controller.setCurrentPage(value);
                    },
                    itemCount: controller.onbordingData.length,
                    itemBuilder: (context, index) {
                      SliderturnyourwItemModel data =
                      controller.onbordingData[index];
                      return Container(
                        height: double.infinity,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(data.image!),
                                fit: BoxFit.fill)),
                        child: Padding(
                            padding:
                            // getPadding(left: 20, right: 20, bottom: 237),
                            EdgeInsets.only(
                                left: 20.h, bottom: 216.v, right: 20.h),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  data.title!,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: theme.textTheme.headlineMedium!.copyWith(
                                    height: 1.50,
                                  ),
                                ),
                                SizedBox(height: 12.v),
                                Padding(
                                  padding:
                                  EdgeInsets.only(left: 20.h, right: 20.h),
                                  child: Text(
                                    data.subTitle!,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                    style: theme.textTheme.bodyLarge!.copyWith(
                                      height: 1.50,
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      );
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 20.h, right: 20.h, top: 16.v, bottom: 32.v),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Column(
                          children: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(
                                    controller.onbordingData.length, (index) {
                                  return AnimatedContainer(
                                    margin:
                                    EdgeInsets.only(left: 4.h, right: 4.h),
                                    duration: const Duration(milliseconds: 300),
                                    height: 8.v,
                                    width: 8.h,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: (index == controller.currentPage)
                                            ? appTheme.buttonColor
                                            : appTheme.gray300),
                                  );
                                })),
                            CustomElevatedButton(
                                text: controller.currentPage ==
                                    controller.onbordingData.length - 1
                                    ? "Get started"
                                    : "lbl_next".tr,
                                margin: EdgeInsets.only(
                                    left: 0.h, top: 48.v, right: 0.h),
                                onTap: controller.currentPage ==
                                    controller.onbordingData.length - 1
                                    ? () {
                                  PrefUtils.setIsIntro(false);
                                  Get.toNamed(
                                    AppRoutes.loginScreen,
                                  );
                                }
                                    : () {
                                  controller.pageController.nextPage(
                                      duration:
                                      const Duration(milliseconds: 100),
                                      curve: Curves.bounceIn);
                                }),
                            SizedBox(
                              height: 16.v,
                            ),
                            GestureDetector(
                                onTap: () {
                                  PrefUtils.setIsIntro(false);
                                  onTapTxtSkip();
                                },
                                child: Container(
                                  height: 24.v,
                                  child: Text(
                                      controller.currentPage ==
                                          controller.onbordingData.length - 1
                                          ? ""
                                          : "lbl_skip".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: theme.textTheme.bodyLarge),
                                )),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  onTapTxtSkip() {
    Get.toNamed(
      AppRoutes.loginScreen,
    );
  }
}











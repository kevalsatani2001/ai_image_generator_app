import 'dart:io';
import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/widgets/custom_icon_button.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../art_styles_screen/controller/art_styles_controller.dart';
import 'controller/edit_artwork_controller.dart';

class EditArtworkScreen extends StatefulWidget {
  const EditArtworkScreen({super.key});

  @override
  State<EditArtworkScreen> createState() => _EditArtworkScreenState();
}

class _EditArtworkScreenState extends State<EditArtworkScreen> {
  EditArtworkController controller = Get.put(EditArtworkController());
  ArtStylesController artStylesControllers = Get.put(ArtStylesController());

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
            body: GetBuilder<EditArtworkController>(
              init: EditArtworkController(),
              builder: (controller) => GetBuilder<ArtStylesController>(
                init: ArtStylesController(),
                builder: (artStylesController) => SizedBox(
                    width: double.maxFinite,
                    child: Column(children: [
                      getCommonAppBar("lbl_finalize".tr,
                          actionWidget: GestureDetector(
                            onTap: (){
                              controller.captureAndSaveImage();
                              Get.toNamed(AppRoutes.finalizeScreen);
                            },
                            child: Text(
                              "lbl_finalize".tr,
                              style: CustomTextStyles.bodyMedium18Blue,
                            ),
                          )),
                      Container(
                          child: Column(children: [
                        SizedBox(
                            height: 374.adaptSize,
                            width: double.infinity,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: 24.v, left: 20.h, right: 20.h),
                              child: Stack(
                                  alignment: Alignment.bottomRight,
                                  children: [
                                    RepaintBoundary(
                                      key:controller.globalKey,
                                      child: ValueListenableBuilder(
                                        valueListenable: _filterColor,
                                        builder: (context, color, child) {
                                          return Container(
                                            height: 374.v,
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8.h),
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                      artStylesController
                                                          .currentArt!.image!,
                                                    ),
                                                    fit: BoxFit.fill,
                                                    colorFilter: ColorFilter.mode(
                                                        color.withOpacity(0.5),
                                                        BlendMode.color))),

                                          );


                                        },
                                      ),
                                    ),
                                    /*CustomImageView(
                                        imagePath: artStylesController.currentArt!.image!,
                                        height: 374.adaptSize,
                                        width: 374.adaptSize,
                                        radius: BorderRadius.circular(8.h),
                                        alignment: Alignment.center),*/
                                    CustomIconButton(
                                        height: 32.adaptSize,
                                        width: 32.adaptSize,
                                        margin: EdgeInsets.only(
                                            right: 8.h, bottom: 8.v),
                                        padding: EdgeInsets.all(6.h),
                                        decoration:
                                            IconButtonStyleHelper.fillBlack,
                                        alignment: Alignment.bottomRight,
                                        child: CustomImageView(
                                            svgPath:
                                                ImageConstant.imgArrowdown))
                                  ]),
                            )),
                        Padding(
                            padding: EdgeInsets.only(
                                left: 20.h, top: 32.v, right: 20.h),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      CustomIconButton(
                                          onTap: () {
                                            controller.isList = true;
                                            controller.update();
                                          },
                                          height: 40.adaptSize,
                                          width: 40.adaptSize,
                                          padding: EdgeInsets.all(8.h),
                                          decoration: IconButtonStyleHelper
                                              .fillGrayTL8
                                              .copyWith(
                                                  color: controller.isList
                                                      ? appTheme.lightblue
                                                      : appTheme.lightGray,
                                                  border: Border.all(
                                                      color: controller.isList
                                                          ? appTheme.blue
                                                          : appTheme
                                                              .lightGray)),
                                          child: CustomImageView(
                                              svgPath: ImageConstant.imgMenu)),
                                      CustomIconButton(
                                          onTap: () {
                                            controller.isList = false;
                                            controller.update();
                                          },
                                          height: 40.adaptSize,
                                          width: 40.adaptSize,
                                          margin: EdgeInsets.only(left: 16.h),
                                          padding: EdgeInsets.all(10.h),
                                          decoration: IconButtonStyleHelper
                                              .fillGrayTL8
                                              .copyWith(
                                                  color: !controller.isList
                                                      ? appTheme.lightblue
                                                      : appTheme.lightGray,
                                                  border: Border.all(
                                                      color: !controller.isList
                                                          ? appTheme.blue
                                                          : appTheme
                                                              .lightGray)),
                                          // onTap: () {
                                          //   onTapBtnSettingsone();
                                          // },
                                          child: CustomImageView(
                                              svgPath: ImageConstant
                                                  .imgSettingsBlack900)),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      CustomIconButton(
                                          height: 40.adaptSize,
                                          width: 40.adaptSize,
                                          padding: EdgeInsets.all(8.h),
                                          decoration: IconButtonStyleHelper
                                              .fillGrayTL81,
                                          child: CustomImageView(
                                              svgPath:
                                                  ImageConstant.imgRefresh)),
                                      CustomIconButton(
                                          height: 40.adaptSize,
                                          width: 40.adaptSize,
                                          margin: EdgeInsets.only(left: 16.h),
                                          padding: EdgeInsets.all(10.h),
                                          decoration: IconButtonStyleHelper
                                              .fillGrayTL81,
                                          child: CustomImageView(
                                              svgPath: ImageConstant
                                                  .imgRefreshBlack900))
                                    ],
                                  )
                                ])),
                        SizedBox(height: 24.v),
                        FilterSelector(
                          onFilterChanged: _onFilterChanged,
                          filters: _filters, image: AssetImage(
                          artStylesController.currentArt!.image!,
                        ), imagesize: 100,
                        ),
                            SizedBox(height: 33.v),
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 20.h),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 119.v,
                                  decoration: AppDecoration.outlineBlueGray
                                      .copyWith(
                                          borderRadius:
                                              BorderRadiusStyle.roundedBorder8),
                    child: Padding(
                      padding:  EdgeInsets.symmetric(vertical: 16.v),
                      child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                              CustomIconButton(
                                  height: 40.adaptSize,
                                  width: 40.adaptSize,
                                  padding: EdgeInsets.all(8.h),
                                  decoration:
                                  IconButtonStyleHelper.fillOnErrorContainer,
                                  child: CustomImageView(
                                      svgPath: ImageConstant.imgRefreshBlack900)),

                              SizedBox(

                                  child: Text("lbl_re_generate".tr,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                      style: CustomTextStyles.bodyMedium13
                                          .copyWith(height: 1.50)))
                            ]),
                    ),
                                ),
                              ),
                              SizedBox(
                                width: 21.h,
                              ),
                              Expanded(
                                child: Container(
                                  height: 119.v,
                                  decoration: AppDecoration.outlineBlueGray
                                      .copyWith(
                                      borderRadius:
                                      BorderRadiusStyle.roundedBorder8),
                                   child: Padding(
                                     padding:  EdgeInsets.symmetric(vertical: 16.v),
                                     child: Column(

                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            CustomIconButton(
                                                height: 40.adaptSize,
                                                width: 40.adaptSize,
                                                padding: EdgeInsets.all(8.h),
                                                decoration:
                                                IconButtonStyleHelper.fillOnErrorContainer,
                                                child: CustomImageView(
                                                    svgPath: ImageConstant.imgSignal)),
                                            SizedBox(

                                                child: Text("Create variations",
                                                    maxLines: 2,
                                                    overflow: TextOverflow.ellipsis,
                                                    textAlign: TextAlign.center,
                                                    style: CustomTextStyles.bodyMedium13
                                                        .copyWith(height: 1.50)))
                                          ]),
                                   )
                                ),
                              ),
                              SizedBox(
                                width: 21.h,
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    Get.toNamed(AppRoutes.eraseObjectScreen);
                                  },
                                  child: Container(
                                    height: 119.v,
                                    decoration: AppDecoration.outlineBlueGray
                                        .copyWith(
                                        borderRadius:
                                        BorderRadiusStyle.roundedBorder8),
                                      child: Padding(
                                        padding:  EdgeInsets.symmetric(vertical: 16.v),
                                        child: Column(

                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              CustomIconButton(
                                                  height: 40.adaptSize,
                                                  width: 40.adaptSize,
                                                  padding: EdgeInsets.all(8.h),
                                                  decoration: IconButtonStyleHelper
                                                      .fillOnErrorContainer,
                                                  child: CustomImageView(
                                                      svgPath: ImageConstant.imgTicket)),
                                              SizedBox(

                                                  child: Text("lbl_erase_object".tr,
                                                      maxLines: 2,
                                                      overflow: TextOverflow.ellipsis,
                                                      textAlign: TextAlign.center,
                                                      style: CustomTextStyles.bodyMedium13
                                                          .copyWith(height: 1.50)))
                                            ]),
                                      )
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 21.h,
                              ),
                              Expanded(
                                child: Container(
                                  height: 119.v,
                                  decoration: AppDecoration.outlineBlueGray
                                      .copyWith(
                                      borderRadius:
                                      BorderRadiusStyle.roundedBorder8),
                                    child: Padding(
                                      padding:  EdgeInsets.symmetric(vertical: 16.v),
                                      child: Column(

                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            CustomIconButton(
                                                height: 40.adaptSize,
                                                width: 40.adaptSize,
                                                padding: EdgeInsets.all(8.h),
                                                decoration: IconButtonStyleHelper
                                                    .fillOnErrorContainer,
                                                child: CustomImageView(
                                                    svgPath: ImageConstant.imgEdit)),

                                            SizedBox(

                                                child: Text("lbl_edit_input".tr,
                                                    maxLines: 2,
                                                    overflow: TextOverflow.ellipsis,
                                                    textAlign: TextAlign.center,
                                                    style: CustomTextStyles.bodyMedium13
                                                        .copyWith(height: 1.50)))
                                          ]),
                                    )
                                ),
                              ),
                            ],
                          ),
                        )

                        // Padding(
                        //     padding: EdgeInsets.only(
                        //         left: 1.h, top: 24.v, bottom: 9.v),
                        //     child: Row(
                        //         mainAxisAlignment: MainAxisAlignment.center,
                        //         children: [
                        //          Expanded(
                        //              child: CustomImageView(
                        //                  imagePath: ImageConstant
                        //                      .imgIllustrationha244x244,
                        //                  height: 100.v,
                        //                  width: 78.h,
                        //                  radius: BorderRadius.circular(8.h),
                        //                  margin:
                        //                  EdgeInsets.only(right: 10.h))),
                        //          Expanded(
                        //              child: CustomImageView(
                        //                  imagePath: ImageConstant
                        //                      .imgIllustrationha244x244,
                        //                  height: 100.v,
                        //                  width: 78.h,
                        //                  radius: BorderRadius.circular(8.h),
                        //                  margin: EdgeInsets.symmetric(
                        //                      horizontal: 10.h))),
                        //          Expanded(
                        //              child: CustomImageView(
                        //                  imagePath: ImageConstant
                        //                      .imgIllustrationha244x244,
                        //                  height: 100.v,
                        //                  width: 78.h,
                        //                  radius: BorderRadius.circular(8.h),
                        //                  margin: EdgeInsets.symmetric(
                        //                      horizontal: 10.h))),
                        //          Expanded(
                        //              child: CustomImageView(
                        //                  imagePath: ImageConstant
                        //                      .imgIllustrationha244x244,
                        //                  height: 100.v,
                        //                  width: 78.h,
                        //                  radius: BorderRadius.circular(8.h),
                        //                  margin: EdgeInsets.only(left: 10.h)))
                        //         ]))
                      ]))
                    ])),
              ),
            ),
            // bottomNavigationBar: Padding(
            //     padding: EdgeInsets.only(left: 31.h, right: 19.h, bottom: 32.v),
            //     child:
            //     Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            //      Container(
            //          margin: EdgeInsets.symmetric(vertical: 15.v),
            //          decoration: AppDecoration.outlineBlueGray.copyWith(
            //              borderRadius: BorderRadiusStyle.roundedBorder8),
            //          child: Column(mainAxisSize: MainAxisSize.min, children: [
            //           CustomIconButton(
            //               height: 40.adaptSize,
            //               width: 40.adaptSize,
            //               padding: EdgeInsets.all(8.h),
            //               decoration:
            //               IconButtonStyleHelper.fillOnErrorContainer,
            //               child: CustomImageView(
            //                   svgPath: ImageConstant.imgRefreshBlack900)),
            //           SizedBox(height: 10.v),
            //           SizedBox(
            //               width: 54.h,
            //               child: Text("lbl_re_generate".tr,
            //                   maxLines: 2,
            //                   overflow: TextOverflow.ellipsis,
            //                   textAlign: TextAlign.center,
            //                   style: CustomTextStyles.bodyMedium13
            //                       .copyWith(height: 1.50)))
            //          ])),
            //      Container(
            //          margin: EdgeInsets.only(left: 32.h),
            //          padding:
            //          EdgeInsets.symmetric(horizontal: 8.h, vertical: 16.v),
            //          decoration: AppDecoration.outlineBlueGray.copyWith(
            //              borderRadius: BorderRadiusStyle.roundedBorder8),
            //          child: Column(
            //              mainAxisSize: MainAxisSize.min,
            //              mainAxisAlignment: MainAxisAlignment.center,
            //              children: [
            //               CustomIconButton(
            //                   height: 40.adaptSize,
            //                   width: 40.adaptSize,
            //                   padding: EdgeInsets.all(8.h),
            //                   decoration:
            //                   IconButtonStyleHelper.fillOnErrorContainer,
            //                   child: CustomImageView(
            //                       svgPath: ImageConstant.imgSignal)),
            //               SizedBox(height: 9.v),
            //               SizedBox(
            //                   width: 60.h,
            //                   child: Text("msg_create_variations".tr,
            //                       maxLines: 1,
            //                       overflow: TextOverflow.ellipsis,
            //                       textAlign: TextAlign.center,
            //                       style: CustomTextStyles.bodyMedium13
            //                           .copyWith(height: 1.50)))
            //              ])),
            //      GestureDetector(
            //          onTap: () {
            //           onTapColumnticket();
            //          },
            //          child: Container(
            //              margin: EdgeInsets.only(left: 21.h),
            //              padding: EdgeInsets.symmetric(
            //                  horizontal: 19.h, vertical: 14.v),
            //              decoration: AppDecoration.outlineBlueGray.copyWith(
            //                  borderRadius: BorderRadiusStyle.roundedBorder8),
            //              child: Column(
            //                  mainAxisSize: MainAxisSize.min,
            //                  mainAxisAlignment: MainAxisAlignment.center,
            //                  children: [
            //                   CustomIconButton(
            //                       height: 40.adaptSize,
            //                       width: 40.adaptSize,
            //                       padding: EdgeInsets.all(8.h),
            //                       decoration: IconButtonStyleHelper
            //                           .fillOnErrorContainer,
            //                       child: CustomImageView(
            //                           svgPath: ImageConstant.imgTicket)),
            //                   SizedBox(height: 10.v),
            //                   SizedBox(
            //                       width: 37.h,
            //                       child: Text("lbl_erase_object".tr,
            //                           maxLines: 2,
            //                           overflow: TextOverflow.ellipsis,
            //                           textAlign: TextAlign.center,
            //                           style: CustomTextStyles.bodyMedium13
            //                               .copyWith(height: 1.50)))
            //                  ]))),
            //      GestureDetector(
            //          onTap: () {
            //           onTapColumneditone();
            //          },
            //          child: Container(
            //              margin: EdgeInsets.only(left: 21.h),
            //              padding: EdgeInsets.symmetric(
            //                  horizontal: 19.h, vertical: 14.v),
            //              decoration: AppDecoration.outlineBlueGray.copyWith(
            //                  borderRadius: BorderRadiusStyle.roundedBorder8),
            //              child: Column(
            //                  mainAxisSize: MainAxisSize.min,
            //                  mainAxisAlignment: MainAxisAlignment.center,
            //                  children: [
            //                   CustomIconButton(
            //                       height: 40.adaptSize,
            //                       width: 40.adaptSize,
            //                       padding: EdgeInsets.all(8.h),
            //                       decoration: IconButtonStyleHelper
            //                           .fillOnErrorContainer,
            //                       child: CustomImageView(
            //                           svgPath: ImageConstant.imgEdit)),
            //                   SizedBox(height: 9.v),
            //                   SizedBox(
            //                       width: 32.h,
            //                       child: Text("lbl_edit_input".tr,
            //                           maxLines: 2,
            //                           overflow: TextOverflow.ellipsis,
            //                           textAlign: TextAlign.center,
            //                           style: CustomTextStyles.bodyMedium13
            //                               .copyWith(height: 1.50)))
            //                  ])))
            //     ]))
          )),
    );
  }

  onTapColumnticket() {
    Get.toNamed(
      AppRoutes.eraseObjectScreen,
    );
  }

  onTapColumneditone() {
    Get.toNamed(
      AppRoutes.editInputScreen,
    );
  }

  onTapEdit() {
    Get.toNamed(
      AppRoutes.explorePromptPhotoDetailPopupScreen,
    );
  }

  onTapFinalize() {
    Get.toNamed(
      AppRoutes.finalizeScreen,
    );
  }

  onTapBtnSettingsone() {
    Get.toNamed(
      AppRoutes.editArtworkTwoScreen,
    );
  }

  final _filters = [
    Colors.white,
    ...List.generate(
      Colors.primaries.length,
      (index) => Colors.primaries[(index * 4) % Colors.primaries.length],
    )
  ];
  final _filterColor = ValueNotifier<Color>(Colors.white);

  void _onFilterChanged(Color value) {
    _filterColor.value = value;
  }
}

@immutable
class FilterSelector extends StatefulWidget {
  const FilterSelector({
    super.key,
    required this.filters,
    required this.image,
    required this.onFilterChanged,
    required this.imagesize,
     this.isGrid = false,
    this.padding = const EdgeInsets.symmetric(vertical: 24),
  });

  final List<Color> filters;
  final void Function(Color selectedColor) onFilterChanged;
  final ImageProvider<Object> image;
  final EdgeInsets padding;
  final int imagesize;
  final bool isGrid;

  @override
  State<FilterSelector> createState() => _FilterSelectorState();
}

class _FilterSelectorState extends State<FilterSelector> {
  static const _filtersPerScreen = 5;
  static const _viewportFractionPerItem = 1.0 / _filtersPerScreen;

  late final PageController _controller;
  late int _page;

  int get filterCount => widget.filters.length;

  Color itemColor(int index) => widget.filters[index % filterCount];

  @override
  void initState() {
    super.initState();
    _page = 0;
    _controller = PageController(
      initialPage: _page,
      viewportFraction: _viewportFractionPerItem,
    );
    _controller.addListener(_onPageChanged);
  }

  void _onPageChanged() {
    final page = (_controller.page ?? 0).round();
    if (page != _page) {
      _page = page;
      widget.onFilterChanged(widget.filters[page]);
    }
  }

  void _onFilterTapped(int index) {
    _controller.animateToPage(
      index,
      duration: const Duration(milliseconds: 450),
      curve: Curves.ease,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scrollable(
      controller: _controller,
      axisDirection: AxisDirection.right,
      physics: const PageScrollPhysics(),
      viewportBuilder: (context, viewportOffset) {
        return LayoutBuilder(
          builder: (context, constraints) {
            final itemSize = constraints.maxWidth * _viewportFractionPerItem;
            viewportOffset
              ..applyViewportDimension(constraints.maxWidth)
              ..applyContentDimensions(0.0, itemSize * (filterCount - 1));

            return Stack(
              alignment: Alignment.bottomCenter,
              children: [
                // _buildShadowGradient(itemSize),
                widget.isGrid ? _buildCarouselGrid(
            viewportOffset: viewportOffset,
                itemSize: widget.imagesize.v, image: widget.image
            ):_buildCarousel(
                  viewportOffset: viewportOffset,
                  itemSize: widget.imagesize.v, image: widget.image
                ),
                // _buildSelectionRing(100),
              ],
            );
          },
        );
      },
    );
  }

  Widget _buildShadowGradient(double itemSize) {
    return SizedBox(
      height: itemSize * 2 + widget.padding.vertical,
      child: const DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.black,
            ],
          ),
        ),
        child: SizedBox.expand(),
      ),
    );
  }
  ArtStylesController artStylesController = Get.put(ArtStylesController());
  Widget _buildCarousel({
    required ViewportOffset viewportOffset,
    required double itemSize,
    required ImageProvider<Object> image,
  }) {
    return Container(
        height: itemSize,
        // margin: widget.padding,
        child: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 9.5.h),
          scrollDirection: Axis.horizontal,
          itemCount: filterCount,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.5.h),
              child: FilterItem(
                index: index,
                selectedFilter: CurrentFilterIndex,
                onFilterSelected: () {
                  _onFilterTapped(index);
                  setCurrentFilterIndex(index);
                },
                color: itemColor(index), image: DecorationImage(
                  image: image,

                  fit: BoxFit.fill,
                  colorFilter: ColorFilter.mode(itemColor(index).withOpacity(0.5), BlendMode.color)),
              ),
            );
          },
        )

        // Flow(
        //   delegate: CarouselFlowDelegate(
        //     viewportOffset: viewportOffset,
        //     filtersPerScreen: _filtersPerScreen,
        //   ),
        //   children: [
        //     for (int i = 0; i < filterCount; i++)
        //       FilterItem(
        //         onFilterSelected: () => _onFilterTapped(i),
        //         color: itemColor(i),
        //       ),
        //   ],
        // ),
        );
  }


List filterName = [
  "Hefe","Blackwhite","Sierra","Walden","Nashville","Kelvin","Sutro","Lo-Fi"
];
  Widget _buildCarouselGrid({
    required ViewportOffset viewportOffset,
    required double itemSize,
    required ImageProvider<Object> image,
  }) {
    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      itemCount: filterName.length,
      primary: false,
        shrinkWrap: true,
      gridDelegate:   SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisExtent: 125.v,
        crossAxisCount: 4,
        mainAxisSpacing: 20.h,
        crossAxisSpacing: 20.h),itemBuilder: (context, index) {
          return Column(
            children: [
              FilterItem(
              index: index,
              selectedFilter: CurrentFilterIndex,
              onFilterSelected: () {
              _onFilterTapped(index);
              setCurrentFilterIndex(index);
              },
              color: itemColor(index), image: DecorationImage(
              image: image,

              fit: BoxFit.fill,
              colorFilter: ColorFilter.mode(itemColor(index).withOpacity(0.5), BlendMode.color)),
              ),
              SizedBox(height: 4.v,),
              Text(
                filterName[index],
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.bodyMedium,
              ),

            ],
          );
        },);
  }

  Widget _buildSelectionRing(double itemSize) {
    return IgnorePointer(
      child: Padding(
        padding: widget.padding,
        child: SizedBox(
          width: 74.h,
          height: 100.v,
          child: const DecoratedBox(
            decoration: BoxDecoration(
              border: Border.fromBorderSide(
                BorderSide(width: 6, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }

  int CurrentFilterIndex = 0;

  void setCurrentFilterIndex(int index) {
    setState(() {
      CurrentFilterIndex = index;
    });
  }
}

class CarouselFlowDelegate extends FlowDelegate {
  CarouselFlowDelegate({
    required this.viewportOffset,
    required this.filtersPerScreen,
  }) : super(repaint: viewportOffset);

  final ViewportOffset viewportOffset;
  final int filtersPerScreen;

  @override
  void paintChildren(FlowPaintingContext context) {
    final count = context.childCount;

    // All available painting width
    final size = context.size.width;

    // The distance that a single item "page" takes up from the perspective
    // of the scroll paging system. We also use this size for the width and
    // height of a single item.
    final itemExtent = size / filtersPerScreen;

    // The current scroll position expressed as an item fraction, e.g., 0.0,
    // or 1.0, or 1.3, or 2.9, etc. A value of 1.3 indicates that item at
    // index 1 is active, and the user has scrolled 30% towards the item at
    // index 2.
    final active = viewportOffset.pixels / itemExtent;

    // Index of the first item we need to paint at this moment.
    // At most, we paint 3 items to the left of the active item.
    final min = math.max(0, active.floor() - 3).toInt();

    // Index of the last item we need to paint at this moment.
    // At most, we paint 3 items to the right of the active item.
    final max = math.min(count - 1, active.ceil() + 3).toInt();

    // Generate transforms for the visible items and sort by distance.
    for (var index = min; index <= max; index++) {
      final itemXFromCenter = itemExtent * index - viewportOffset.pixels;
      final percentFromCenter = 1.0 - (itemXFromCenter / (size / 2)).abs();
      final itemScale = 0.5 + (percentFromCenter * 0.5);
      final opacity = 0.25 + (percentFromCenter * 0.75);

      final itemTransform = Matrix4.identity()
        ..translate((size - itemExtent) / 2)
        ..translate(itemXFromCenter)
        ..translate(itemExtent / 2, itemExtent / 2)
        ..multiply(Matrix4.diagonal3Values(itemScale, itemScale, 1.0))
        ..translate(-itemExtent / 2, -itemExtent / 2);

      context.paintChild(
        index,
        transform: itemTransform,
        opacity: opacity,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CarouselFlowDelegate oldDelegate) {
    return oldDelegate.viewportOffset != viewportOffset;
  }
}

@immutable
class FilterItem extends StatelessWidget {
  FilterItem(
      {super.key,
      required this.color,
      this.onFilterSelected,
      required this.selectedFilter,
      required this.index,
      required this.image,
      });

  final Color color;
  final int selectedFilter;
  final int index;
   DecorationImage? image;
  final VoidCallback? onFilterSelected;
  ArtStylesController artStylesController = Get.put(ArtStylesController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onFilterSelected,
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: Container(
          height: 100.v,
          width: 74.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.h),
              border: Border.all(
                  color: selectedFilter == index
                      ? appTheme.blue
                      : Colors.transparent),
              image: image??DecorationImage(
                  image:


                  AssetImage(
                    artStylesController.currentArt!.image!,
                  ),
                  fit: BoxFit.fill,
                  colorFilter: ColorFilter.mode(
                      color.withOpacity(0.5), BlendMode.color))),
          // child: Image.asset(artStylesController.currentArt!.image!,
          //   color: color.withOpacity(0.5),
          //   colorBlendMode: BlendMode.color,
          //   fit: BoxFit.fill,
          // ),
        ),
      ),
    );
  }
}


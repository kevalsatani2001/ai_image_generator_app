import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:ai_image_generator/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class GridillustratioItemWidget extends StatelessWidget {
  final XFile file;
  final VoidCallback? onDelete;

  GridillustratioItemWidget({
    Key? key,
    required this.file,
    this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 0,
      margin: EdgeInsets.all(0),
      color: appTheme.gray10002,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusStyle.roundedBorder8,
      ),
      child: Container(
        height: 177.adaptSize,
        width: 177.adaptSize,
        decoration: AppDecoration.fillGray10002.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder8,
        ),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              child: Image.file(
                File(file.path),
                height: 177.adaptSize,
                fit: BoxFit.fill,
              ),
            ),
            GestureDetector(
              onTap: onDelete,
              child: Padding(
                padding: EdgeInsets.only(top: 12.v, right: 12.h),
                child: Container(
                  height: 24.v,
                  width: 24.v,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: appTheme.black900.withOpacity(0.40),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(2.h),
                    child: CustomImageView(
                      svgPath: ImageConstant.imgCloseOnerrorcontainer,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

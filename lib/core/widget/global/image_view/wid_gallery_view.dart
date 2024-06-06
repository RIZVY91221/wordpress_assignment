import 'package:bs_assignment/core/theme/colors.dart';
import 'package:bs_assignment/core/uttils/functions.dart';
import 'package:bs_assignment/core/values/constants.dart';
import 'package:bs_assignment/core/widget/global/image_view/model_image.dart';
import 'package:bs_assignment/core/widget/global/sidebar/wid_appbar.dart';
import 'package:bs_assignment/core/widget/global/sidebar/wid_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:get/get.dart' as getx;

/// Gallery Screen
class WidgetImageGallery extends StatelessWidget {
  const WidgetImageGallery({
    Key? key,
    required this.index,
    required this.imagesList,
    this.onPageChanged,
  }) : super(key: key);

  final int index;
  final List<Images> imagesList;
  final Function(int)? onPageChanged;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      onWillPop: () => getx.Get.back(),
      appBar: baseAppBar(
        backgroundColor: Colors.black,
        leadingArrow: true,
        leadingArrowColor: AppColor.whiteFFFFFF,
        onPressedLeading: () => getx.Get.back(),
      ),
      backgroundColor: Colors.black,
      body: ImageSlideshow(
        indicatorRadius: 5,
        width: double.infinity,
        height: MediaQuery.of(context).size.height - 200,
        initialPage: index,
        indicatorColor: imagesList.length <= 1 ? Colors.black : AppColor.whiteFFFFFF,
        indicatorBackgroundColor: AppColor.whiteFFFFFF.withOpacity(0.2),
        onPageChanged: onPageChanged,
        isLoop: false,
        children: imagesList.asMap().map((i, v) => MapEntry(i, _imagePreview(i, stringBase64: v.image))).values.toList(),
      ),
    );
  }

  // Image Preview
  Widget _imagePreview(int index, {bool zoomFeature = false, String? stringBase64}) {
    return zoomFeature
        ? InteractiveViewer(
            panEnabled: false,
            minScale: 0.75,
            maxScale: 3,
            child: FN.imageWidgetFromBase64(
              stringBase64 ?? '',
              width: double.infinity,
              height: double.infinity,
              filterOutBefore: AppConstant.base64FilterString,
            ),
          )
        : FN.imageWidgetFromBase64(
            stringBase64 ?? '',
            width: double.infinity,
            height: double.infinity,
            filterOutBefore: AppConstant.base64FilterString,
          );
  }
}

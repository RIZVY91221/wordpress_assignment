import 'package:bs_assignment/core/theme/colors.dart';
import 'package:bs_assignment/core/theme/text.dart';
import 'package:bs_assignment/core/uttils/functions.dart';
import 'package:bs_assignment/core/values/values.dart';
import 'package:bs_assignment/core/widget/global/card/card.dart';
import 'package:bs_assignment/core/widget/global/image_view/wid_clickable_image_view.dart';
import 'package:bs_assignment/models/product/product_resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key, required this.productResource}) : super(key: key);

  final ProductResource productResource;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: AppColor.whiteFFFFFF,
      surfaceTintColor: AppColor.whiteFFFFFF,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Container(
          decoration: const BoxDecoration(shape: BoxShape.rectangle),
          width: MediaQuery.of(context).size.width / 2.5,
          child: CardWrapperWidget(
            cardHeader: CardHeader(
              child: SizedBox(
                height: 110,
                child: WidgetClickableImageView(
                  image: productResource.prettifyProduct?.image ?? '',
                  margin: EdgeInsets.zero,
                  backgroundColor: AppColor.transparent,
                  borderRadius: 4,
                  border: Border.all(color: AppColor.whiteLightestGrayF8F8F8),
                  // popView: true,
                ),
              ),
            ),
            cardBody: CardBody(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppGap.vertical8,
                  Text(
                    productResource.prettifyProduct?.productName ?? ' - ',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyle.bodySmall().copyWith(),
                  ),
                  AppGap.vertical10,
                  Row(
                    children: [
                      productResource.prettifyProduct?.sellPrice != ''
                          ? Text(
                              "\$ ${productResource.prettifyProduct?.regularPrice}",
                              style: AppTextStyle.bodyVerySmall().copyWith(
                                  color: AppColor.disabledE4E5E7,
                                  decoration: TextDecoration.lineThrough,
                                  decorationColor: AppColor.disabledE4E5E7),
                            )
                          : AppText.headline6("\$ ${productResource.prettifyProduct?.regularPrice}", color: AppColor.dark202125),
                      AppGap.horizontal10,
                      productResource.prettifyProduct?.sellPrice != ''
                          ? AppText.headline6("\$ ${productResource.prettifyProduct?.sellPrice}", color: AppColor.dark202125)
                          : const SizedBox.shrink(),
                    ],
                  ),
                  RatingBarIndicator(
                    rating: double.parse('${productResource.prettifyProduct?.rating ?? 0}'),
                    itemBuilder: (context, index) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    itemCount: 5,
                    itemSize: 13.0,
                    direction: Axis.horizontal,
                  )
                ],
              ),
            ),
          )),
    );
  }
}

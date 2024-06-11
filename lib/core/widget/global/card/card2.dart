import 'package:bs_assignment/core/theme/colors.dart';
import 'package:bs_assignment/core/theme/text.dart';
import 'package:bs_assignment/core/values/values.dart';
import 'package:bs_assignment/core/widget/global/card/card.dart';
import 'package:bs_assignment/core/widget/global/image_view/wid_clickable_image_view.dart';
import 'package:bs_assignment/models/movies/movie_resource.dart';
import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({Key? key, required this.productResource, this.onPressCard}) : super(key: key);

  final MovieResource productResource;
  final VoidCallback? onPressCard;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressCard,
      child: Card(
        elevation: 3,
        color: AppColor.dark202125,
        surfaceTintColor: AppColor.dark202125,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
            decoration: BoxDecoration(shape: BoxShape.rectangle, color: AppColor.dark202125),
            width: MediaQuery.of(context).size.width / 2.5,
            child: CardWrapperWidget(
              cardHeader: CardHeader(
                child: SizedBox(
                  height: 110,
                  child: WidgetClickableImageView(
                    image: productResource.prettifyMovies?.image ?? '',
                    margin: EdgeInsets.zero,
                    backgroundColor: AppColor.transparent,
                    borderRadius: 4,
                    popView: false,
                    border: Border.all(
                      color: AppColor.dark202125,
                    ),
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
                      productResource.prettifyMovies?.name ?? ' - ',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyle.bodySmall().copyWith(color: AppColor.whiteFFFFFF),
                    ),
                    AppGap.vertical10,
                  ],
                ),
              ),
            )),
      ),
    );
  }
}

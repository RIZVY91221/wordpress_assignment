import 'package:bs_assignment/models/product/product.dart';

class PrettifyProduct {
  final int id;
  final String productName;
  final String regularPrice;
  final String sellPrice;
  final String price;
  final int rating;
  final String image;

  PrettifyProduct(
      {this.id = 0, this.productName = '', this.regularPrice = '', this.sellPrice = '', this.price = '', this.rating = 0, this.image = ''});

  factory PrettifyProduct.fromJson(Map<String, dynamic> json) {
    Product product = Product.fromJson(json);
    return PrettifyProduct(
      id: product.id ?? 0,
      productName: product.name ?? ' - ',
      regularPrice: product.regularPrice ?? ' - ',
      sellPrice: product.salePrice ?? ' - ',
      price: product.price ?? ' - ',
      rating: product.ratingCount ?? 0,
      image: (product.images != null && product.images!.isNotEmpty) ? product.images?.first.src ?? '' : '',
    );
  }
}

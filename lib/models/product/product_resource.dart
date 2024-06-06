import 'package:bs_assignment/models/product/prettify_product.dart';
import 'package:bs_assignment/models/product/product.dart';

class ProductResource {
  Product? product;
  PrettifyProduct? prettifyProduct;

  ProductResource({this.product, this.prettifyProduct});

  factory ProductResource.fromJson(Map<String, dynamic> json) => ProductResource(
        product: Product.fromJson(json),
        prettifyProduct: PrettifyProduct.fromJson(json),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'product': product,
        'prettifyProduct': prettifyProduct,
      };
}

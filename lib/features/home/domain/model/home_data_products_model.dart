
import 'products_model.dart';

class HomeDataProductsModel {
  List<ProductsModel> allProducts;
  List<ProductsModel> latestProducts;
  List<ProductsModel> offerProducts;
  List<ProductsModel> topProducts;

  HomeDataProductsModel(
      {required this.allProducts,
        required this.latestProducts,
        required this.offerProducts,
        required this.topProducts});
}
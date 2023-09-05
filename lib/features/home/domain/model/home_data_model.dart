
import 'categories_model.dart';
import 'home_data_products_model.dart';
import 'sliders_model.dart';

class HomeDataModel {
  HomeDataProductsModel products;
  List<SlidersModel> sliders;
  List<CategoriesModel> categories;

  HomeDataModel({required this.products, required this.sliders, required this.categories});
}
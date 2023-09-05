import 'package:dartz/dartz.dart';
import '../../../../core/error_handler/error_handler.dart';
import '../model/sub_category_products_model.dart';

abstract class GetSubCategoryProductsRepository {
  Future<Either<Failure, SubCategoryModel>> getSubCategoryProducts(int id);
}
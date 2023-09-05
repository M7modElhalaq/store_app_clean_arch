import 'package:dartz/dartz.dart';
import '../../../../core/error_handler/error_handler.dart';
import '../model/product_details_model.dart';

abstract class ProductDetailsRepository {
  Future<Either<Failure, ProductDetailsModel>> productDetails(int id);
}
import 'package:dartz/dartz.dart';

import '../../../../core/error_handler/error_handler.dart';
import '../../../../core/usecase/base_usecase.dart';
import '../model/product_details_model.dart';
import '../repository/product_details_repository.dart';

class ProductDetailsUseCase implements BaseUseCase<int, ProductDetailsModel> {
  final ProductDetailsRepository _repository;

  ProductDetailsUseCase(this._repository);

  @override
  Future<Either<Failure, ProductDetailsModel>> execute(int id) async {
    return await _repository.productDetails(id);
  }
}
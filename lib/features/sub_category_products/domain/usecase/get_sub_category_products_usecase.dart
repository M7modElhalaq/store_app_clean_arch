import 'package:dartz/dartz.dart';

import '../../../../core/error_handler/error_handler.dart';
import '../../../../core/usecase/base_usecase.dart';
import '../model/sub_category_products_model.dart';
import '../repository/get_sub_category_products_repository.dart';

class GetSubCategoryProductsUseCase implements BaseUseCase<int, SubCategoryModel> {
  final GetSubCategoryProductsRepository _repository;

  GetSubCategoryProductsUseCase(this._repository);

  @override
  Future<Either<Failure, SubCategoryModel>> execute(int id) async {
    return await _repository.getSubCategoryProducts(id);
  }
}
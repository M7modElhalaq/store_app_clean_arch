import 'package:dartz/dartz.dart';
import 'package:store_app/features/shopping_bag/domain/model/shopping_bag_model.dart';

import '../../../../core/error_handler/error_handler.dart';
import '../../../../core/usecase/base_usecase.dart';
import '../repository/shopping_bag_repository.dart';

class GetShoppingBagDataUseCase implements BaseGetUseCase {
  final ShoppingBagRepository _repository;

  GetShoppingBagDataUseCase(this._repository);

  @override
  Future<Either<Failure, ShoppingBagModel>> execute() async {
    return await _repository.getShoppingBagData();
  }
}
import 'package:dartz/dartz.dart';
import '../../../../core/error_handler/error_handler.dart';
import '../../../../core/usecase/base_usecase.dart';
import '../models/cart_model.dart';
import '../repository/cart_get_data_repository.dart';

class GetCartDataUseCase implements BaseGetUseCase {
  final CartGetDataRepository _repository;

  GetCartDataUseCase(this._repository);

  @override
  Future<Either<Failure, CartModel>> execute() async {
    return await _repository.getCartData();
  }
}
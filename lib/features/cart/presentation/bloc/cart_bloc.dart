import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/core/constance.dart';
import 'package:store_app/core/errors/failure.dart';
import 'package:store_app/core/resources/manager_strings.dart';
import 'package:store_app/core/storage/remote/data_source/app_remote_data_source.dart';
import 'package:store_app/core/widgets/helpers.dart';
import 'package:store_app/features/cart/domain/entities/cart_model.dart';
import 'package:store_app/features/cart/domain/use_cases/get_cart_data.dart';
import 'package:store_app/features/cart/presentation/bloc/cart_event.dart';
import 'package:store_app/features/cart/presentation/bloc/cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartStates> with Helpers {
  AppRemoteDataSource appRemoteDataSource = AppRemoteDataSource();
  final GetCartUseCase getProducts;
  CartModel? products;

  CartBloc({required this.getProducts}) : super(CartInitialState()) {
    on<CartEvent>((event, emit) async {
      print('Bloc Start');
      if (event is GetCartEvent) {
        emit(CartLoadingState());
        print('ProductLoadingState');
        final cart = await getProducts();
        cart.fold(
              (failure) {
                print(failure);
                products = null;
          },
              (r) {
              products = r;
          },
        );
        emit(GetCartSuccessState());
      }
    });
  }

  void addToFav(BuildContext context, {required int productIndex}) async {
    emit(GetCartSuccessState());
    try {
      products!.data[productIndex].product!.inFavorites = !(products!.data[productIndex].product!.inFavorites);
      bool val = await appRemoteDataSource.addOrRemoveFavorite(context, productId: products!.data[productIndex].id);
      if(!val) {
        products!.data[productIndex].product!.inFavorites = false;
      }
    } on AddToFavFailure {
      showSnackBar(context: context, message: ManagerStrings.failedAddToFav, error: true);
    }
    emit(AddItemToFavState());
  }

  void addToCart(BuildContext context, {required int productIndex}) async {
    emit(GetCartSuccessState());
    try {
      products!.data[productIndex].product!.inCart = !(products!.data[productIndex].product!.inCart);
      bool val = await appRemoteDataSource.addOrRemoveCart(context, productId: products!.data[productIndex].id);
      if(!val) {
        products!.data[productIndex].product!.inCart = false;
      }
    } on AddToCartFailure {
      showSnackBar(context: context, message: ManagerStrings.failedAddToCart, error: true);
    }
    emit(AddItemToFavState());
  }

  @override
  Future<void> close() {
    print('Bloc Close');
    return super.close();
  }
}

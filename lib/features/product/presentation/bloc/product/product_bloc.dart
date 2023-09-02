import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/core/storage/local/database/shared_preferences/app_settings_shared_preferences.dart';
import 'package:store_app/core/storage/remote/data_source/app_remote_data_source.dart';
import 'package:store_app/features/product/presentation/bloc/product/product_event.dart';
import 'package:store_app/features/product/presentation/bloc/product/product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductStates> {
  AppSettingsSharedPreferences appSettingsSharedPreferences = AppSettingsSharedPreferences();
  AppRemoteDataSource appRemoteDataSource = AppRemoteDataSource();

  ProductBloc() : super(ProductInitialState()) {
    on<ProductEvent>((event, emit) async {
    });
  }

  void addToFav(BuildContext context, {required int productIndex}) async {
    emit(ProductInitialState());
    await appRemoteDataSource.addOrRemoveFavorite(context, productId: productIndex);
    emit(AddToFavouritesState());
  }

  void addToCart(BuildContext context, {required int productIndex}) async {
    emit(ProductInitialState());
    await appRemoteDataSource.addOrRemoveCart(context, productId: productIndex);
    emit(AddToFavouritesState());
  }
}
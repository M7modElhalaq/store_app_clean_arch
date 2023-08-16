import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_app/core/errors/exceptions.dart';
import 'package:store_app/features/home/data/models/product_model.dart';

import '../../../../core/constance.dart';

abstract class ProductLocalDataSource {
  Future<List<ProductModel>> getCachedProducts(String type);
  Future<Unit> cacheProducts(List<ProductModel> products, String type);
  Future<Unit> clearCache();
}

class ProductLocalDataSourceImpl extends ProductLocalDataSource {
  final SharedPreferences sharedPreferences;

  ProductLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<Unit> cacheProducts(List<ProductModel> products, String type) {
    sharedPreferences.setString(Constance.CACHED_PRODUCT, json.encode(products));

    return Future.value(unit);
  }

  @override
  Future<List<ProductModel>> getCachedProducts(String type) {
    final jsonString = sharedPreferences.getString(Constance.CACHED_PRODUCT);

    if(jsonString != null) {
      final List<ProductModel> listProductModel = json.decode(jsonString).map((row) => ProductModel.fromJson(row)).toList();
      return Future.value(listProductModel);
    } else {
      throw EmptyCacheException();
    }
  }

  @override
  Future<Unit> clearCache() {
    final jsonString = sharedPreferences.getString(Constance.CACHED_PRODUCT);

    if(jsonString != null) {
      sharedPreferences.remove(Constance.CACHED_PRODUCT);
      return Future.value(unit);
    } else {
      throw EmptyCacheException();
    }
  }
}
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_app/core/constance.dart';
import 'package:store_app/core/errors/exceptions.dart';
import 'package:store_app/core/errors/failure.dart';
import 'package:store_app/features/auth/data/models/customer_model.dart';

abstract class LocalDataSource {
  Future<CustomerModel> getCachedCustomer();
  Future<Unit> cacheCustomer(CustomerModel customer);
  Future<Unit> clearCache();
}

class LocalDataSourceImpl implements LocalDataSource {
  final SharedPreferences sharedPreferences;

  LocalDataSourceImpl({required this.sharedPreferences});
  @override
  Future<Unit> cacheCustomer(CustomerModel customer) {
    // print('From Local Cache');
    // print(customer);
    CustomerModel customerModelToJson = CustomerModel(
      name: customer.name,
      email: customer.email,
      phoneNumber: customer.phoneNumber,
      profileImage: customer.profileImage ?? '',
      dateOfBirth: customer.dateOfBirth ?? '',
      gender: customer.gender ?? '',
      idNumber: customer.idNumber ?? 0,
      lang: customer.lang ?? '',
      token: customer.token ?? '',
    );

    // print('From Local Cache');
    // print(customerModelToJson);

    sharedPreferences.setString(Constance.CACHED_CUSTOMER, json.encode(customerModelToJson));

    return Future.value(unit);
  }

  @override
  Future<CustomerModel> getCachedCustomer() {
    final jsonString = sharedPreferences.getString(Constance.CACHED_CUSTOMER);

    if(jsonString != null) {
      CustomerModel jsonToCustomerModel = CustomerModel.fromJson(json.decode(jsonString));
      return Future.value(jsonToCustomerModel);
    } else {
      throw EmptyCacheException();
    }
  }

  Future<Unit> clearCache() {
    final jsonString = sharedPreferences.getString(Constance.CACHED_CUSTOMER);

    if(jsonString != null) {
      print('Remove');
      sharedPreferences.remove(Constance.CACHED_CUSTOMER);
      return Future.value(unit);
    } else {
      throw EmptyCacheException();
    }
  }
}

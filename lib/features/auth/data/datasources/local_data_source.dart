import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_app/core/errors/exceptions.dart';
import 'package:store_app/core/errors/failure.dart';
import 'package:store_app/features/auth/data/models/customer_model.dart';

abstract class LocalDataSource {
  Future<CustomerModel> getCachedCustomer();

  Future<Unit> cacheCustomer(CustomerModel customer);
}

const String CACHED_CUSTOMER = "CACHED_CUSTOMER";

class LocalDataSourceImpl implements LocalDataSource {
  final SharedPreferences sharedPreferences;

  LocalDataSourceImpl({required this.sharedPreferences});
  @override
  Future<Unit> cacheCustomer(CustomerModel customer) {
    CustomerModel customerModelToJson = CustomerModel(
      name: customer.name,
      email: customer.email,
      phoneNumber: customer.phoneNumber,
      profileImage: customer.profileImage ?? '',
      dateOfBirth: customer.dateOfBirth ?? '',
      gender: customer.gender ?? '',
      lang: customer.lang ?? '',
      token: customer.token ?? '',
    );

    sharedPreferences.setString(CACHED_CUSTOMER, json.encode(customerModelToJson));

    return Future.value(unit);
  }

  @override
  Future<CustomerModel> getCachedCustomer() {
    final jsonString = sharedPreferences.getString(CACHED_CUSTOMER);

    if(jsonString != null) {
      CustomerModel customer = json.decode(jsonString);
      return Future.value(customer);
    } else {
      throw EmptyCacheException();
    }
  }
}

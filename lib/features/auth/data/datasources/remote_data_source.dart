import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:store_app/core/errors/exceptions.dart';
import '../models/customer_model.dart';

abstract class RemoteDataSource {
  Future<CustomerModel> login(int phoneNumber);
  Future<Unit> verifyPhone(int phoneNumber);
  Future<Unit> register(CustomerModel customer);
}

const BASE_URL = "http://192.168.1.188:80";

class RemoteDataSourceImpl implements RemoteDataSource {
  final dio = Dio();
  @override
  Future<CustomerModel> login(int phoneNumber) async {
    final response = await dio.get(
      "$BASE_URL/api/customers/login",
      options: Options(
        headers: {"Content-Type": "application/json"},
      ),
    );
    if (response.statusCode == 200) {
      final CustomerModel customerModel = response.data['data'];
      return customerModel;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> verifyPhone(int phoneNumber) {
    print('Verify Phone');
    throw UnimplementedError();
  }

  @override
  Future<Unit> register(CustomerModel customer) async {
    final body = {
      "name": customer.name,
      "email": customer.email,
      "phone_number": customer.phoneNumber,
      "id_number": '',
      "profile_image": customer.profileImage,
      "date_of_birth": customer.dateOfBirth,
      "gender": customer.gender,
      "token": customer.token,
      "lang": customer.lang
    };

    final response = await dio.post(
      "$BASE_URL/api/customers/register",
      data: body,
      options: Options(
        headers: {"Content-Type": "application/json"},
      ),
    );

    if (response.statusCode == 200) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }
}
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:store_app/core/constance.dart';
import 'package:store_app/core/errors/exceptions.dart';
import '../models/customer_model.dart';

abstract class RemoteDataSource {
  Future<CustomerModel> login(int phoneNumber);
  Future<String> verifyPhone(int phoneNumber);
  Future<Unit> register(CustomerModel customer);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final dio = Dio();
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Future<CustomerModel> login(int phoneNumber) async {
    final response = await dio.request(
      "${Constance.BASE_URL}/api/customers/login",
      data: {
        "phone_number": phoneNumber
      },
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Accept-Language": "ar"
        },
        method: 'POST',
      ),
    );
    if (response.data['success'] == true) {
      final CustomerModel customerModel = CustomerModel.fromJson(response.data['data']);
      return customerModel;
    } else if (response.data['success'] == false) {
      throw NotRegisteredException();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<String> verifyPhone(int phoneNumber) async {
    print('From Verify Remote Data: ${'+' + phoneNumber.toString()}');
    print('Verify Phone');
    String? verifyId;
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber.toString().trim(),
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (e) {
          throw Exception(e.message);
        },
        codeSent: (String verificationId, int? resendToken) async {
          verifyId = verificationId;
          String smsCode = '000000';

          // Create a PhoneAuthCredential with the code
          PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);

          // Sign the user in (or link) with the credential
          await auth.signInWithCredential(credential).then((value) => print('Verify Success'));
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
      print('verificationId: $verifyId');
      return verifyId!;
    } catch (e) {
      return e.toString();
    }
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
      "${Constance.BASE_URL}/api/customers/register",
      data: body,
      options: Options(
        headers: {"Content-Type": "application/json"},
      ),
    );

    print(response);

    if (response.data['success'] == true) {
      return Future.value(unit);
    } else if (response.data['success'] == false) {
      throw RegisterException();
    } else {
      throw ServerException();
    }

    if (response.statusCode == 200) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }
}
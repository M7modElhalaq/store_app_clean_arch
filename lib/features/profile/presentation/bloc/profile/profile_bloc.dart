import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_app/core/constance.dart';
import 'package:store_app/features/auth/data/datasources/local_data_source.dart';
import 'package:store_app/features/auth/data/models/customer_model.dart';
import 'package:store_app/features/profile/presentation/bloc/profile/profile_event.dart';
import 'package:store_app/features/profile/presentation/bloc/profile/profile_state.dart';


class ProfileBloc extends Bloc<ProfileEvent, ProfileStates> {
  CustomerModel? customer;
  ProfileBloc() : super(ProfileInitialState()) {
    getCustomerData();
  }

  void getCustomerData() async {
    print('Hello');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final jsonString = sharedPreferences.getString(Constance.CACHED_CUSTOMER);
    CustomerModel jsonToCustomerModel = CustomerModel.fromJson(json.decode(jsonString!));
    customer = jsonToCustomerModel;
    print(customer);
  }
}
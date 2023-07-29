import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:store_app/core/widgets/loading_widget.dart';
import 'package:store_app/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:store_app/features/auth/presentation/widgets/login_widget.dart';
import 'package:store_app/features/main_app/presentation/views/main_app_view.dart';
import '../bloc/auth/auth_state.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController controller = TextEditingController();

  String initialCountry = 'NG';
  PhoneNumber number = PhoneNumber(isoCode: 'NG');

  @override
  Widget build(BuildContext context) {
    String? phoneNumber;
    return Scaffold(
      body: _buildApp(),
    );
  }

  Widget _buildApp() {
    return BlocBuilder<AuthBloc, AuthStates>(
      builder: (context, state) {
        if(state is AuthLoadingState) {
          print('AuthLoadingState');
          return LoadingWidget();
        } else if(state is AuthFailedState) {
          print('AuthFailedState');
          return LoginWidget();
        } else if(state is AuthSuccessState) {
          print('AuthSuccessState');
          return MainAppView();
        } else {
          return LoadingWidget();
        }
      },
    );
  }

  void getPhoneNumber(String phoneNumber) async {
    PhoneNumber number =
        await PhoneNumber.getRegionInfoFromPhoneNumber(phoneNumber, 'US');

    setState(() {
      this.number = number;
    });
  }
}

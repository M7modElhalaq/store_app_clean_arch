import 'package:equatable/equatable.dart';
import 'package:store_app/features/auth/domain/entities/customer.dart';

class LoginEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CheckCustomerAccountEvent extends LoginEvent{
  final int phoneNumber;

  CheckCustomerAccountEvent({required this.phoneNumber});

  List<Object?> get props => [phoneNumber];
}

class VerifyPhoneNumberEvent extends LoginEvent{
  final bool account;
  final int phoneNumber;

  VerifyPhoneNumberEvent({required this.account, required this.phoneNumber});

  List<Object?> get props => [account, phoneNumber];
}

class RegisterNewCustomerEvent extends LoginEvent{
  final Customer customer;

  RegisterNewCustomerEvent({required this.customer});

  List<Object?> get props => [customer];
}
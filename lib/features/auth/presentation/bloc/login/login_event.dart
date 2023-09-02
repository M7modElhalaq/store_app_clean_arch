import 'package:equatable/equatable.dart';
import 'package:store_app/features/auth/domain/entities/customer.dart';

class LoginEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CheckAuthEvent extends LoginEvent{}

class CheckCustomerAccountEvent extends LoginEvent{
  final int phoneNumber;

  CheckCustomerAccountEvent({required this.phoneNumber});

  List<Object?> get props => [phoneNumber];
}

class VerifyPhoneNumberEvent extends LoginEvent{
  final int phoneNumber;

  VerifyPhoneNumberEvent({required this.phoneNumber});

  List<Object?> get props => [phoneNumber];
}

class RegisterNewCustomerEvent extends LoginEvent{
  final Customer customer;

  RegisterNewCustomerEvent({required this.customer});

  List<Object?> get props => [customer];
}
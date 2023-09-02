import 'package:equatable/equatable.dart';

class ProfileEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GetUserDataEvent extends ProfileEvent{}

class ShareAppEvent extends ProfileEvent{}

class SupportEvent extends ProfileEvent{}

class LogoutEvent extends ProfileEvent{}

class DeleteAccountEvent extends ProfileEvent{}
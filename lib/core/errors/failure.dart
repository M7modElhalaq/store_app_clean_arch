import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {}

class OfflineFailure extends Failure{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ServerFailure extends Failure{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class NotLoggedInFailure extends Failure{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class EmptyCacheFailure extends Failure{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class NotRegisteredFailure extends Failure{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SendVerifyCodeFailure extends Failure{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class NotVerifiedFailure extends Failure{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class RegisterFailure extends Failure{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class UpdateProfileFailure extends Failure{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

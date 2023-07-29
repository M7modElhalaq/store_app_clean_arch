import 'package:bloc/bloc.dart';
import 'package:store_app/features/auth/domain/use_cases/check_auth.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/strings/failures.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthStates> {
  final CheckAuthUseCase checkAuth;

  AuthBloc({required this.checkAuth}) : super(AuthInitialState()) {
    on<AuthEvent>((event, emit) async {
      if (event is CheckAuthEvent) {
        emit(AuthLoadingState());
        final auth = await checkAuth();
        auth.fold(
          (failure) {
            emit(AuthFailedState(message: _mapFailureToMessage(failure)));
          },
          (r) {
            emit(AuthSuccessState());
          },
        );
      }
    });
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case EmptyCacheFailure:
        return EMPTY_CACHE_FAILURE_MESSAGE;
      case OfflineFailure:
        return OFFLINE_FAILURE_MESSAGE;
      default:
        return "حصل خطأ, يرجي المحاولة لاحقا";
    }
  }
}

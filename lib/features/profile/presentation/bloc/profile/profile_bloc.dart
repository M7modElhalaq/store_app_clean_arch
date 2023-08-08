import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/features/profile/presentation/bloc/profile/profile_event.dart';
import 'package:store_app/features/profile/presentation/bloc/profile/profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileStates> {
  ProfileBloc() : super(ProfileInitialState()) {}
}
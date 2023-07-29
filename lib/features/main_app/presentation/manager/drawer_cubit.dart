import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:store_app/features/auth/presentation/views/login_view.dart';
import 'package:store_app/features/home/presentation/views/home_view.dart';

part 'drawer_state.dart';

class DrawerCubit extends Cubit<DrawerState> {
  DrawerCubit() : super(DrawerInitial());

  DrawerSections currentSection = DrawerSections.home;

  void navigateToScreen({required DrawerSections screen}) {
    currentSection = screen;
    if (screen == DrawerSections.home) {
      emit(DrawerNavigated(const HomeView()));
    } else if (screen == DrawerSections.login) {
      emit(DrawerNavigated(const LoginView()));
    }
  }
}

enum DrawerSections { home, login }

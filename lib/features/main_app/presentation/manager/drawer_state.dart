part of 'drawer_cubit.dart';

@immutable
abstract class DrawerState {}

class DrawerInitial extends DrawerState {}

class DrawerNavigating extends DrawerState {}

class DrawerNavigated extends DrawerState {
  final Widget screen;

  DrawerNavigated(this.screen);
}

class DrawerError extends DrawerState {}

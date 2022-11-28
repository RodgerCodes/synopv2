part of 'user_cubit.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}

class LogginIn extends UserState {}

class LoggedIn extends UserState {
  final String msg;

  LoggedIn({required this.msg});
}

class LoginError extends UserState {
  final String msg;

  LoginError({required this.msg});
}

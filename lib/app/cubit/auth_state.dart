part of 'auth_cubit.dart';

class AuthState {
  const AuthState({
    this.user,
    this.status = Status.initial,
    this.isCreatingAccount = false,
    this.errorMessage = '',
  });

  final User? user;
  final Status status;
  final bool isCreatingAccount;
  final String errorMessage;
}

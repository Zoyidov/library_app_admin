part of 'login_cubit.dart';

class LoginState {
  final FormzSubmissionStatus status;
  final Failure? failure;
  final bool isObSecure;

  const LoginState({
    this.status = FormzSubmissionStatus.initial,
    this.failure,
    this.isObSecure = true,
  });

  LoginState copyWith({
    FormzSubmissionStatus? status,
    Failure? failure,
    bool? isObSecure,
  }) {
    return LoginState(
      status: status ?? this.status,
      failure: failure ?? this.failure,
      isObSecure: isObSecure ?? this.isObSecure,
    );
  }
}

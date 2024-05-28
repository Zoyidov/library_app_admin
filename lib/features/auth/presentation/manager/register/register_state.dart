part of 'register_cubit.dart';

class RegisterState {
  final FormzSubmissionStatus status;
  final Failure? failure;
  final bool isObSecure;

  const RegisterState({
    this.status = FormzSubmissionStatus.initial,
    this.failure,
    this.isObSecure = true,
  });

  RegisterState copyWith({
    FormzSubmissionStatus? status,
    Failure? failure,
    bool? isObSecure,
  }) {
    return RegisterState(
      status: status ?? this.status,
      failure: failure,
      isObSecure: isObSecure ?? this.isObSecure,
    );
  }
}

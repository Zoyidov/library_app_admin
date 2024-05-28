import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:library_app_admin/core/failure/failure.dart';
import 'package:library_app_admin/features/auth/data/repositories/auth_repository.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final AuthRepository authRepository;

  RegisterCubit(this.authRepository) : super(const RegisterState());

  void changeIsObSecure() => emit(state.copyWith(isObSecure: !state.isObSecure, status: FormzSubmissionStatus.initial));

  void register() async {
    if (!formKey.currentState!.validate()) return;
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    final result = await authRepository.register(email: email, password: password);
    result.fold(
      (failure) => emit(state.copyWith(status: FormzSubmissionStatus.failure, failure: failure)),
      (success) => emit(state.copyWith(status: FormzSubmissionStatus.success)),
    );
  }
}

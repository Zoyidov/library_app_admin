import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:gap/gap.dart';
import 'package:library_app_admin/core/custom_widgets/input_field.dart';
import 'package:library_app_admin/core/helpers/dialog.dart';
import 'package:library_app_admin/features/auth/data/repositories/auth_repository.dart';
import 'package:library_app_admin/features/auth/presentation/manager/auth_page/auth_cubit.dart';
import 'package:library_app_admin/features/auth/presentation/manager/login/login_cubit.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(AuthRepositoryImpl()),
      child: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state.status.isInProgress) {
            DialogHelper.showProgressDialog(context);
          }
          if (state.status.isSuccess) {
            Navigator.of(context).pop();
          }
          if (state.status.isFailure) {
            Navigator.of(context).pop();
            DialogHelper.showFailureDialog(context, state.failure?.message);
          }
        },
        child: Builder(builder: (context) {
          final cubit = context.read<LoginCubit>();
          return SafeArea(
            child: Scaffold(
              body: Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Form(
                        key: cubit.formKey,
                        child: Column(
                          children: [
                            InputField(
                              label: "Email",
                              hintText: "Enter your email",
                              maxLines: null,
                              controller: cubit.emailController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Name is required";
                                }
                                return null;
                              },
                            ),
                            const Gap(16),
                            BlocBuilder<LoginCubit, LoginState>(
                              builder: (context, state) {
                                return InputField(
                                  label: "Password",
                                  hintText: "Enter your password",
                                  controller: cubit.passwordController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Password is required";
                                    }
                                    return null;
                                  },
                                  obscureText: state.isObSecure,
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      cubit.changeIsObSecure();
                                    },
                                    icon: Icon(state.isObSecure ? Icons.visibility_off : Icons.visibility),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      const Gap(24),
                      FilledButton(
                        child: const Text("Login"),
                        onPressed: () async {
                          cubit.login();
                        },
                      ),
                    ],
                  ),
                ),
              ),
              // TODO: Refactor this in login screen and register screen
              bottomNavigationBar: BottomAppBar(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have account?"),
                    TextButton(
                      onPressed: () => context.read<AuthCubit>().changePage(),
                      child: const Text("Register"),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

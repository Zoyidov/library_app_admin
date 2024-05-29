import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:library_app_admin/features/add_library/presentation/pages/library_information.dart';
import 'package:library_app_admin/features/auth/presentation/pages/auth_screen.dart';
import 'package:library_app_admin/features/home/presentation/pages/home_screen.dart';
import 'package:library_app_admin/features/redirect/presentation/manager/library_cubit/library_cubit.dart';
import 'package:library_app_admin/main.dart';

class RedirectScreen extends StatelessWidget {
  const RedirectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: supabase.auth.onAuthStateChange,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data?.session != null) {
            return BlocBuilder<LibraryCubit, LibraryState>(
              builder: (context, state) {
                if (state.status.isInProgress) {
                  return const Scaffold(body: Center(child: CircularProgressIndicator()));
                }
                if (state.library != null) {
                  return const HomeScreen();
                }
                return const LibraryInformationScreen();
              },
            );
          } else {
            return const AuthScreen();
          }
        } else if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()));
        }
        return const Center(child: CircularProgressIndicator(color: Colors.blue));
      },
    );
  }
}

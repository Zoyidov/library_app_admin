import 'package:flutter/material.dart';
import 'package:library_app_admin/features/auth/presentation/pages/auth_screen.dart';
import 'package:library_app_admin/features/home/presentation/pages/home_screen.dart';
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
            return const HomeScreen();
          } else {
            return const AuthScreen();
          }
        } else if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()));
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}

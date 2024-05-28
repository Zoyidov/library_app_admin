import 'package:flutter/material.dart';
import 'package:library_app_admin/core/constants/constants.dart';
import 'package:library_app_admin/core/singleton/local_storage/local_storage.dart';
import 'package:library_app_admin/core/themes/theme.dart';
import 'package:library_app_admin/features/auth/presentation/pages/auth_screen.dart';
import 'package:library_app_admin/features/redirect/presentation/pages/redirect_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorageShared.init();
  await Supabase.initialize(url: supabaseUrl, anonKey: supabaseKey);
  runApp(const MainApp());
}

final supabase = Supabase.instance.client;

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: const RedirectScreen(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:library_app_admin/main.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => supabase.auth.signOut(),
            icon: const Icon(Icons.logout),
          )
        ],
      ),
    );
  }
}

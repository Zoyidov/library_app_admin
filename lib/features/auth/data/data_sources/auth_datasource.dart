import 'package:library_app_admin/main.dart';

abstract class AuthDataSource {
  Future<void> login({required String email, required String password});

  Future<void> register({required String email, required String password});
}

class AuthDataSourceImpl implements AuthDataSource {
  @override
  Future<void> login({required String email, required String password}) async {
    try {
      await supabase.auth.signInWithPassword(email: email, password: password);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> register({required String email, required String password}) async {
    try {
      await supabase.auth.signUp(email: email, password: password);
    } catch (e) {
      rethrow;
    }
  }
}

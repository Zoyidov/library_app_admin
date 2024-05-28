import 'dart:io';

import 'package:library_app_admin/core/failure/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:library_app_admin/features/auth/data/data_sources/auth_datasource.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthRepository {
    final AuthDataSource authDataSource;

    AuthRepository({required this.authDataSource});

  Future<Either<Failure, void>> login({required String email, required String password});

  Future<Either<Failure, void>> register({required String email, required String password});
}

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<Either<Failure, void>> login({required String email, required String password}) async {
    try {
      await authDataSource.login(email: email, password: password);
      return const Right(null);
    } on AuthException catch (e) {
      print(e.statusCode);
      return Left(Failure(e.message));
    } on SocketException {
      return Left(Failure('No internet connection'));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> register({required String email, required String password}) async {
    try {
      await authDataSource.register(email: email, password: password);
      return const Right(null);
    } on AuthException catch (e) {
      print(e.statusCode);
      return Left(Failure(e.message));
    } on SocketException {
      return Left(Failure('No internet connection'));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  AuthDataSource get authDataSource => AuthDataSourceImpl();
}

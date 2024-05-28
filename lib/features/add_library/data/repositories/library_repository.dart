import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:library_app_admin/core/failure/failure.dart';
import 'package:library_app_admin/features/add_library/data/data_sources/library_datasource.dart';
import 'package:library_app_admin/features/add_library/presentation/manager/create_library_cubit.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class LibraryRepository {
  final LibraryDataSource libraryDataSource;

  LibraryRepository({required this.libraryDataSource});

  Future<Either<Failure, void>> addLibraryInformation({required LibraryEntity libraryEntity});
}

class LibraryRepositoryImpl implements LibraryRepository {
  @override
  Future<Either<Failure, void>> addLibraryInformation({required LibraryEntity libraryEntity}) async {
    try {
      await libraryDataSource.addLibrary(libraryEntity);
      return const Right(null);
    } on PostgrestException catch (e) {
      print(e.code);
      return Left(Failure(e.message));
    } on SocketException {
      return Left(Failure('No internet connection'));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  // TODO: implement libraryDataSource
  LibraryDataSource get libraryDataSource => LibraryDataSourceImpl();
}

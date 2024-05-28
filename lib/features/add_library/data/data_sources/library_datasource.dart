import 'package:library_app_admin/features/add_library/presentation/manager/create_library_cubit.dart';
import 'package:library_app_admin/main.dart';

abstract class LibraryDataSource {
  Future<void> addLibrary(LibraryEntity libraryEntity);
}

class LibraryDataSourceImpl implements LibraryDataSource {
  @override
  Future<void> addLibrary(LibraryEntity libraryEntity) async {
    try {
      await supabase.from('libraries').insert(libraryEntity.toMap());
      return;
    } catch (e) {
      rethrow;
    }
  }
}

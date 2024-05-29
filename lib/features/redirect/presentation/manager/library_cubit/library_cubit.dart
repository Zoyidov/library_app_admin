import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:library_app_admin/features/redirect/data/models/library_model.dart';
import 'package:library_app_admin/main.dart';

part 'library_state.dart';

class LibraryCubit extends Cubit<LibraryState> {
  LibraryCubit() : super(const LibraryState());

  initialize() async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    final response =
        await supabase.from('libraries').select('*').eq('user_id', supabase.auth.currentUser!.id).maybeSingle();
    if (response != null) {
      final library = LibraryModel.fromJson(response);
      emit(state.copyWith(library: () => library, status: FormzSubmissionStatus.success));
    } else {
      emit(state.copyWith(library: () => null, status: FormzSubmissionStatus.success));
    }
  }
}

part of 'library_cubit.dart';

class LibraryState {
  final FormzSubmissionStatus status;
  final LibraryModel? library;

  const LibraryState({
    this.status = FormzSubmissionStatus.initial,
    this.library,
  });

  LibraryState copyWith({
    FormzSubmissionStatus? status,
    LibraryModel? Function()? library,
  }) {
    return LibraryState(
      status: status ?? this.status,
      library: library != null ? library() : this.library,
    );
  }
}

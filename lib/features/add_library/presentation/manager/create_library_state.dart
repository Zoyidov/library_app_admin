part of 'create_library_cubit.dart';

class CreateLibraryState {
  final FormzSubmissionStatus status;
  final Failure? failure;
  final bool isObSecure;

  CreateLibraryState({
    this.status = FormzSubmissionStatus.initial,
    this.failure,
    this.isObSecure = true,
  });

  CreateLibraryState copyWith({
    FormzSubmissionStatus? status,
    Failure? failure,
    bool? isObSecure,
  }) {
    return CreateLibraryState(
      status: status ?? this.status,
      failure: failure ?? this.failure,
      isObSecure: isObSecure ?? this.isObSecure,
    );
  }
}

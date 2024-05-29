import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:library_app_admin/core/failure/failure.dart';
import 'package:library_app_admin/core/helpers/uuid_generator.dart';
import 'package:library_app_admin/features/add_library/data/repositories/library_repository.dart';

part 'create_library_state.dart';

class LibraryInformationCubit extends Cubit<CreateLibraryState> {
  final nameController = TextEditingController();
  final contactController = TextEditingController();
  final addressController = TextEditingController();
  final latitudeController = TextEditingController();
  final longitudeController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final LibraryRepository libraryRepository;

  LibraryInformationCubit(this.libraryRepository) : super(CreateLibraryState());

  void changeIsObSecure() => emit(state.copyWith(isObSecure: !state.isObSecure, status: FormzSubmissionStatus.initial));

  void createLibrary() async {
    if (!formKey.currentState!.validate()) return;
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));

    final library = LibraryEntity(
      name: nameController.text.trim(),
      contactInfo: contactController.text.trim(),
      address: addressController.text.trim(),
      latitude: latitudeController.text.trim(),
      longitude: longitudeController.text.trim(),
    );

    final response = await libraryRepository.addLibraryInformation(libraryEntity: library);
    response.fold(
      (l) => emit(state.copyWith(status: FormzSubmissionStatus.failure, failure: l)),
      (r) => emit(state.copyWith(status: FormzSubmissionStatus.success)),
    );
  }
}

class LibraryModel{
  final String id;

  LibraryModel({
    required this.id
  });

  factory LibraryModel.fromMap(Map<String, dynamic> map) {
    return LibraryModel(
      id: map['id'] as String
    );
  }
}

class LibraryEntity {
  final String name;
  final String contactInfo;
  final String address;
  final String latitude;
  final String longitude;

  LibraryEntity({
    required this.name,
    required this.contactInfo,
    required this.address,
    required this.latitude,
    required this.longitude,
  });

  @override
  String toString() {
    return 'LibraryEntity{ name: $name, contactInfo: $contactInfo, address: $address, latitude: $latitude, longitude: $longitude}';
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'contactInfo': contactInfo,
      'address': address,
      'location': 'POINT($latitude $longitude)'
    };
  }

  factory LibraryEntity.fromMap(Map<String, dynamic> map) {
    return LibraryEntity(
      name: map['name'] as String,
      contactInfo: map['contactInfo'] as String,
      address: map['address'] as String,
      latitude: map['latitude'] as String,
      longitude: map['longitude'] as String,
    );
  }
}

class Library {
  final String id;
  final String name;
  final String email;

  Library({required this.name})
      : id = UniqueIdHelper.generateUniqueId(),
        email = UniqueIdHelper.generateEmailFromId(UniqueIdHelper.generateUniqueId());
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:gap/gap.dart';
import 'package:library_app_admin/core/custom_widgets/input_field.dart';
import 'package:library_app_admin/core/helpers/dialog.dart';
import 'package:library_app_admin/features/add_library/data/repositories/library_repository.dart';
import 'package:library_app_admin/features/add_library/presentation/manager/create_library_cubit.dart';

class LibraryInformationScreen extends StatelessWidget {
  const LibraryInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LibraryInformationCubit(LibraryRepositoryImpl()),
      child: BlocListener<LibraryInformationCubit, CreateLibraryState>(
        listener: (context, state) {
          if (state.status.isInProgress) {
            DialogHelper.showProgressDialog(context);
          }
          if (state.status.isSuccess) {
            Navigator.of(context).pop();
          }
          if (state.status.isFailure) {
            Navigator.of(context).pop();
            DialogHelper.showFailureDialog(context, state.failure?.message);
          }
        },
        child: Builder(builder: (context) {
          final cubit = context.read<LibraryInformationCubit>();
          return SafeArea(
            child: Scaffold(
              body: Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Form(
                        key: cubit.formKey,
                        // autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: Column(
                          children: [
                            InputField(
                              label: "Name",
                              hintText: "Enter your name",
                              maxLines: null,
                              controller: cubit.nameController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Name is required";
                                }
                                return null;
                              },
                            ),
                            const Gap(16),
                            InputField(
                              label: "Contact info",
                              hintText: "Enter your contact info",
                              controller: cubit.contactController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Contact info is required";
                                }
                                return null;
                              },
                            ),
                            const Gap(16),
                            InputField(
                              label: "Address",
                              hintText: "Enter your address",
                              controller: cubit.addressController,
                              maxLines: null,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Address is required";
                                }
                                return null;
                              },
                            ),
                            const Gap(16),
                            Row(
                              children: [
                                Expanded(
                                  child: InputField(
                                    label: "Latitude",
                                    hintText: "Enter latitude",
                                    controller: cubit.latitudeController,
                                    validator: (value) {
                                      //  TODO: enter double format
                                      if (value!.isEmpty) {
                                        return "Latitude is required";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                const Gap(16),
                                Expanded(
                                  child: InputField(
                                    label: "Longitude",
                                    hintText: "Enter longitude",
                                    controller: cubit.longitudeController,
                                    validator: (value) {
                                      //  TODO: enter double format
                                      if (value!.isEmpty) {
                                        return "Longitude is required";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ],
                            ),

                          ],
                        ),
                      ),
                      const Gap(24),
                      FilledButton(
                        child: const Text("Register Library"),
                        onPressed: () async {
                          cubit.createLibrary();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

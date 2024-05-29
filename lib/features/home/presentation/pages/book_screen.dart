import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:library_app_admin/core/custom_widgets/input_field.dart';
import 'package:library_app_admin/features/home/presentation/pages/add_book_screen.dart';

class BooksScreen extends StatelessWidget {
  const BooksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) => Dialog(
                    child: ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: context.width * 0.5),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              //   InputField name, isbn, author, publisher
                              const InputField(
                                label: "Name",
                                hintText: "Book Name",
                              ),
                              const Gap(16),
                              const InputField(
                                label: "ISBN",
                                hintText: "Book ISBN",
                              ),
                              const Gap(16),
                              const InputField(
                                label: "Author",
                                hintText: "Book Author",
                              ),
                              const Gap(16),
                              const InputField(
                                label: "Publisher",
                                hintText: "Book Publisher",
                              ),
                              const Gap(16),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  OutlinedButton(
                                    onPressed: () {},
                                    child: const Text("Cancel"),
                                  ),
                                  const Gap(16),
                                  FilledButton(
                                    onPressed: () {},
                                    child: const Text("Add"),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )),
                  ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

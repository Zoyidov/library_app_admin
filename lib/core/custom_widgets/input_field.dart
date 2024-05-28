import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:library_app_admin/core/constants/constants.dart';

class InputField extends StatelessWidget {
  const InputField({
    super.key,
    required this.label,
    required this.hintText,
    this.expands = false,
    this.obscureText = false,
    this.suffixIcon,
    this.controller,
    this.maxLines = 1,
    this.validator,
  });

  final String label;
  final String hintText;
  final bool expands;
  final bool obscureText;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final int? maxLines;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(label, style: AppTextStyle.otherCaption),
        const Gap(16),
        TextFormField(
          // style: AppTextStyle.subtitleS2,
          controller: controller,
          obscureText: obscureText,
          validator: validator,
          expands: expands,
          maxLines: obscureText ? 1 : maxLines,
          onTapOutside: (event) => FocusScope.of(context).unfocus(),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            hintText: hintText,
            suffixIcon: suffixIcon,
          ),
        )
      ],
    );
  }
}

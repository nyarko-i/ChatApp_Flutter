import 'package:chat_app/core/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/core/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({
    super.key,
    this.onChanged,
    this.hintText,
    this.focusNode,
  });

  final void Function(String)? onChanged;
  final String? hintText;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      focusNode: focusNode,
      decoration: InputDecoration(
        filled: true,
        hintText: hintText,
        hintStyle: body.copyWith(
          color: const Color.fromARGB(255, 188, 189, 198),
        ),
        fillColor: grey.withValues(alpha: 0.2),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

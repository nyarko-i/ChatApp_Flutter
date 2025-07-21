import 'package:flutter/material.dart';
import 'package:chat_app/core/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:chat_app/core/constants/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onPressed,
    required this.text,
    this.loading = false,
  });

  final void Function()? onPressed;
  final String text;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1.sw,
      height: 40.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(backgroundColor: primary),
        child: loading
            ? const Center(
                child: CircularProgressIndicator(color: Colors.white),
              )
            : Text(text, style: body.copyWith(color: white)),
      ),
    );
  }
}

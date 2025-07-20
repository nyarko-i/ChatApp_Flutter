import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:chat_app/ui/widgets/textfield_widget.dart';
import 'package:chat_app/core/constants/styles.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 1.sw * 0.05, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            40.verticalSpace,
            Text("Create your Account", style: h),
            2.verticalSpace,
            Text("Please provide the details"),
            24.verticalSpace,
            const CustomTextfield(onChanged: ),
          ],
        ),
      ),
    );
  }
}

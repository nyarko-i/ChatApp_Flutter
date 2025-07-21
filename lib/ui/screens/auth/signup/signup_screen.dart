import 'package:chat_app/core/constants/strings.dart';
import 'package:chat_app/ui/widgets/button_widget.dart';
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
            Text(
              "Please provide the details",
              style: body.copyWith(
                color: const Color.fromARGB(255, 188, 189, 198),
              ),
            ),
            24.verticalSpace,
            CustomTextfield(onChanged: (p0) {}, hintText: "Enter name"),
            20.verticalSpace,
            CustomTextfield(onChanged: (p0) {}, hintText: "Enter Email"),
            20.verticalSpace,
            CustomTextfield(onChanged: (p0) {}, hintText: "Enter Password"),
            20.verticalSpace,
            CustomTextfield(onChanged: (p0) {}, hintText: "Confirm password"),
            30.verticalSpace,

            CustomButton(text: "Sign up", onPressed: () {}),
            20.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: body.copyWith(
                    color: const Color.fromARGB(255, 194, 195, 205),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, login);
                  },
                  child: Text(
                    "Login",
                    style: body.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:chat_app/core/constants/strings.dart';
import 'package:chat_app/core/enums/enums.dart';
import 'package:chat_app/core/services/auth_service.dart';
import 'package:chat_app/core/services/database_service.dart';
import 'package:chat_app/ui/screens/auth/signup/signup_viewmodel.dart';
import 'package:chat_app/ui/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:chat_app/ui/widgets/textfield_widget.dart';
import 'package:chat_app/core/constants/styles.dart';
import 'package:provider/provider.dart';
import 'package:chat_app/core/extension/widget_extension.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SignupViewmodel(AuthService(), DatabaseService()),
      child: Consumer<SignupViewmodel>(
        builder: (context, model, _) {
          return Scaffold(
            body: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: 1.sw * 0.05,
                vertical: 10.h,
              ),
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

                  /// Name Field
                  CustomTextfield(
                    onChanged: model.setName,
                    hintText: "Enter name",
                  ),
                  20.verticalSpace,

                  /// Email Field
                  CustomTextfield(
                    onChanged: model.setEmail,
                    hintText: "Enter email",
                  ),
                  20.verticalSpace,

                  /// Password Field
                  CustomTextfield(
                    onChanged: model.setPassword,
                    hintText: "Enter password",
                  ),
                  20.verticalSpace,

                  /// Confirm Password Field
                  CustomTextfield(
                    onChanged: model.setConfirmPassword,
                    hintText: "Confirm password",
                  ),
                  30.verticalSpace,

                  /// Sign Up Button
                  CustomButton(
                    loading: model.state == ViewState.loading,
                    text: "Sign up",
                    onPressed: model.state == ViewState.loading
                        ? null
                        : () async {
                            if (!model.passwordsMatch()) {
                              context.showSnackBar("Passwords do not match.");
                              return;
                            }
                            if (!model.isFormValid()) {
                              context.showSnackBar("All fields are required.");
                              return;
                            }

                            final result = await model.signup();

                            if (context.mounted) {
                              if (result.success) {
                                context.showSnackBar("Signup successful!");
                                Navigator.pop(context);
                              } else {
                                context.showSnackBar(result.message);
                              }
                            }
                          },
                  ),

                  20.verticalSpace,

                  /// Already have account
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
                          " Login",
                          style: body.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

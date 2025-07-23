import 'package:chat_app/core/constants/strings.dart';
import 'package:chat_app/core/enums/enums.dart';
import 'package:chat_app/core/extension/widget_extension.dart';
import 'package:chat_app/core/services/auth_service.dart';
import 'package:chat_app/ui/screens/auth/login/login_viewmodel.dart';
import 'package:chat_app/ui/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:chat_app/ui/widgets/textfield_widget.dart';
import 'package:chat_app/core/constants/styles.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginViewmodel(AuthService()),
      child: Consumer<LoginViewmodel>(
        builder: (context, model, _) {
          return Scaffold(
            body: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 1.sw * 0.05,
                vertical: 10.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  40.verticalSpace,
                  Text("Login", style: h),
                  2.verticalSpace,
                  Text(
                    "Please login to your account",
                    style: body.copyWith(
                      color: const Color.fromARGB(255, 188, 189, 198),
                    ),
                  ),
                  24.verticalSpace,
                  CustomTextfield(
                    onChanged: model.setEmail,
                    hintText: "Enter Email",
                  ),
                  20.verticalSpace,
                  CustomTextfield(
                    onChanged: model.setPassword,
                    hintText: "Enter Password",
                  ),
                  20.verticalSpace,
                  CustomButton(
                    loading: model.state == ViewState.loading,
                    text: "Login",
                    onPressed: model.state == ViewState.loading
                        ? null
                        : () async {
                            try {
                              await model.login();
                              Navigator.pushReplacementNamed(context, home);
                            } catch (e) {
                              context.showSnackBar(e.toString());
                            }
                          },
                  ),
                  20.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: body.copyWith(
                          color: const Color.fromARGB(255, 188, 189, 198),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, signup);
                        },
                        child: Text(
                          "Sign up",
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

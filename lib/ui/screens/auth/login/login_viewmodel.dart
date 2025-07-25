import 'dart:developer';
import 'package:chat_app/core/enums/enums.dart';
import 'package:chat_app/core/other/base_viewmodel.dart';
import 'package:chat_app/core/services/auth_service.dart';

class LoginViewmodel extends BaseViewmodel {
  final AuthService _authService;

  LoginViewmodel(this._authService);

  String email = '';
  String password = '';

  void setEmail(String value) {
    email = value;
    notifyListeners();
  }

  void setPassword(String value) {
    password = value;
    notifyListeners();
  }

  Future<void> login() async {
    setState(ViewState.loading);
    try {
      await _authService.login(email, password);
      setState(ViewState.idle);
    } catch (e) {
      log("Login Error: $e");
      setState(ViewState.idle);
    }
  }
}

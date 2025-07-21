import 'dart:developer';
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
    try {
      await _authService.login(email, password);
    } catch (e) {
      log("Login Error: $e");
    }
  }
}

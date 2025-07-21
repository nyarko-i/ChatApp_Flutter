import 'dart:developer';
import 'package:chat_app/core/other/base_viewmodel.dart';
import 'package:chat_app/core/services/auth_service.dart';

class SignupViewmodel extends BaseViewmodel {
  final AuthService _authService;

  SignupViewmodel(this._authService);

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

  Future<void> signup() async {
    try {
      await _authService.signup(email, password);
      log("Signup successful");
    } catch (e) {
      log("Signup Error: $e");
    }
  }
}

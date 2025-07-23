import 'dart:developer';
import 'package:chat_app/core/enums/enums.dart';
import 'package:chat_app/core/models/user_models.dart';
import 'package:chat_app/core/other/base_viewmodel.dart';
import 'package:chat_app/core/services/auth_service.dart';
import 'package:chat_app/core/services/database_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignupViewmodel extends BaseViewmodel {
  final AuthService _authService;
  final DatabaseService _db;

  SignupViewmodel(this._authService, this._db);

  String name = '';
  String email = '';
  String password = '';
  String confirmPassword = '';

  void setName(String value) {
    name = value;
    notifyListeners();
  }

  void setEmail(String value) {
    email = value;
    notifyListeners();
  }

  void setPassword(String value) {
    password = value;
    notifyListeners();
  }

  void setConfirmPassword(String value) {
    confirmPassword = value;
    notifyListeners();
  }

  bool passwordsMatch() => password == confirmPassword;

  bool isFormValid() =>
      name.isNotEmpty && email.isNotEmpty && password.isNotEmpty;

  Future<AuthResult> signup() async {
    setState(ViewState.loading);
    try {
      final res = await _authService.signup(email, password, name: name);
      if (res != null) {
        UserModel user = UserModel(uid: res.uid, name: name, email: email);
        await _db.saveUser(user.toMap());
      }

      setState(ViewState.idle);

      if (res != null) {
        return AuthResult(success: true);
      } else {
        return AuthResult(
          success: false,
          message: "Signup failed. Please try again.",
        );
      }
    } on FirebaseAuthException catch (e) {
      log("Firebase Signup Error: ${e.code}");
      return AuthResult(success: false, message: _friendlyError(e.code));
    } catch (e) {
      setState(ViewState.idle);
      log("Unexpected signup error: $e");
      return AuthResult(
        success: false,
        message: "Something went wrong. Please try again later.",
      );
    }
  }

  String _friendlyError(String code) {
    switch (code) {
      case 'email-already-in-use':
        return "Account already registered. Please login.";
      case 'invalid-email':
        return "Please enter a valid email address.";
      case 'weak-password':
        return "Password is too weak (must be at least 6 characters).";
      case 'operation-not-allowed':
        return "Email/password signup is not enabled. Contact support.";
      default:
        return "Signup failed. Please check your input.";
    }
  }
}

class AuthResult {
  final bool success;
  final String message;

  AuthResult({required this.success, this.message = ''});
}

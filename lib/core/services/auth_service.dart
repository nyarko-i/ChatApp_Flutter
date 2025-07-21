import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final _auth = FirebaseAuth.instance;

  Future<User?> signup(String email, String password) async {
    try {
      final authCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      log("User created successfully");
      return authCredential.user;
    } on FirebaseAuthException catch (e) {
      log("Firebase Signup Error [${e.code}]: ${e.message}");
      return null;
    } catch (e) {
      log("Unexpected Signup Error: $e");
      return null;
    }
  }

  Future<User?> login(String email, String password) async {
    try {
      final authCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      log("User logged in successfully");
      return authCredential.user;
    } on FirebaseAuthException catch (e) {
      log("Firebase Login Error [${e.code}]: ${e.message}");
      return null;
    } catch (e) {
      log("Unexpected Login Error: $e");
      return null;
    }
  }

  Future<void> logout() async {
    try {
      await _auth.signOut();
      log("User logged out successfully");
    } catch (e) {
      log("Logout Error: $e");
    }
  }
}

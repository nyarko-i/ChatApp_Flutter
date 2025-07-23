import 'package:chat_app/core/services/auth_service.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () {
            AuthService().logout();
          },
          child: Text("Welcome"),
        ),
      ),
    );
  }
}

import 'package:chat_app/core/constants/strings.dart';
import 'package:chat_app/ui/screens/splash/splash_screen.dart';
import 'package:chat_app/ui/screens/home/home_screen.dart';
import 'package:chat_app/ui/screens/auth/login/login_screen.dart';
import 'package:chat_app/ui/screens/auth/signup/signup_screen.dart';

import 'package:flutter/material.dart';

class RouteUtils {
  static Route <dynamic>? onGenerateRoute(RouteSettings settings){
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (context) => SplashScreen());
        //Auth
      case signup:
        return MaterialPageRoute(builder: (context) => SignupScreen());
      case login:
        return MaterialPageRoute(builder: (context) => LoginScreen());

        //Auth
      case home:
        return MaterialPageRoute(builder: (context) => HomeScreen());
      default:
        return MaterialPageRoute(builder: (context)=> Scaffold(body: Text(" No route Found"),));
    }

  }
}
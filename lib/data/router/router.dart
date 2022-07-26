import 'package:flutter/material.dart';
import 'package:synopv2/data/constants.dart';
import 'package:synopv2/presentation/screens/regular/Auth/login.dart';
import 'package:synopv2/presentation/screens/regular/Home/add.dart';
import 'package:synopv2/presentation/screens/regular/Home/home.dart';
import 'package:synopv2/presentation/screens/splash_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );

      case login:
        return MaterialPageRoute(builder: (_) => const LoginPage());

      case home:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );

      case add:
        return MaterialPageRoute(
          builder: (_) => const AddData(),
        );
    }
  }
}

import 'package:flutter/material.dart';
import 'package:synop/data/constants.dart';
import 'package:synop/presentation/login.dart';
import 'package:synop/presentation/screens/add.dart';
import 'package:synop/presentation/screens/regular/Home/home.dart';
import '../../presentation/screens/splash_screen.dart';

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

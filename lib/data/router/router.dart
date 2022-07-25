import 'package:flutter/material.dart';
import 'package:synopv2/data/constants.dart';
import 'package:synopv2/presentation/screens/splash_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:synop/data/api.dart';
import 'package:synop/data/constants.dart';
import 'package:synop/data/cubit/user_cubit.dart';
import 'package:synop/data/repository/repo.dart';
import 'package:synop/presentation/login.dart';
import 'package:synop/presentation/screens/add.dart';
import 'package:synop/presentation/screens/regular/Home/home.dart';
import '../../presentation/screens/splash_screen.dart';

class AppRouter {
  late Repository repository;
  AppRouter() {
    repository = Repository(
      api: ApiCall(),
    );
  }
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );

      case login:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => UserCubit(repository: repository),
            child: const LoginPage(),
          ),
        );

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

import 'package:flutter/material.dart';
import 'package:synop/data/constants.dart';
import 'package:synop/data/router/router.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter().generateRoute,
      theme: ThemeData(
        scaffoldBackgroundColor: ScaffoldColor,
        brightness: Brightness.dark,
        appBarTheme: AppBarTheme(
          backgroundColor: ScaffoldColor,
        ),
      ),
    ),
  );
}

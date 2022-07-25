import 'package:flutter/material.dart';
import 'package:synopv2/data/constants.dart';
import 'package:synopv2/data/router/router.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter().generateRoute,
      theme: ThemeData(
        scaffoldBackgroundColor: ScaffoldColor,
        brightness: Brightness.dark,
      ),
    ),
  );
}

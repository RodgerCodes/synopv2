import 'package:flutter/material.dart';

// routes
const splash = '/';
const wrapper = '/wrapper';
const login = '/login';
const home = '/home';
const add = '/data';

// colors
final ScaffoldColor = Colors.blueGrey[900];
const whiteColor = Colors.white;
const errorColor = Colors.red;

// element styling
final btnStyle = BoxDecoration(
  color: Colors.blue[800],
  borderRadius: const BorderRadius.all(
    Radius.circular(
      8.6,
    ),
  ),
);

const textStyle = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.w700,
);

// editing controllers
final TextEditingController email = TextEditingController();
final TextEditingController password = TextEditingController();

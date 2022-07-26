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
final btnColor = Colors.blue[800];

// element styling
final btnStyle = BoxDecoration(
  color: Colors.blue[800],
  borderRadius: const BorderRadius.all(
    Radius.circular(
      8.6,
    ),
  ),
);

final secBtnStyle = BoxDecoration(
  color: Colors.green[800],
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

const tabletStyle = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.bold,
);

// editing controllers
final TextEditingController email = TextEditingController();
final TextEditingController password = TextEditingController();

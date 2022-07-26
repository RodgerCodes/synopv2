import 'package:flutter/material.dart';
import 'package:synopv2/data/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, add);
        },
        elevation: 50.5,
        backgroundColor: btnColor,
        child: const Icon(
          Icons.add,
          color: whiteColor,
        ),
      ),
    );
  }
}

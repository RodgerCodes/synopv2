import 'package:flutter/material.dart';
import 'package:synop/data/constants.dart';

class Loader extends StatelessWidget {
  const Loader({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            color: btnColor,
          ),
          const SizedBox(
            height: 10,
          ),
          const Text("Signin into your account"),
        ],
      ),
    );
  }
}

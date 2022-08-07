import 'package:flutter/material.dart';
import 'package:synop/data/constants.dart';

class Addbutton extends StatelessWidget {
  const Addbutton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.pushNamed(context, add);
      },
      elevation: 50.5,
      backgroundColor: btnColor,
      child: const Icon(
        Icons.add,
        color: whiteColor,
      ),
    );
  }
}

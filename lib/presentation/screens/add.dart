import 'package:flutter/material.dart';
import 'package:synop/presentation/screens/regular/add_mobile_ul.dart';
import 'package:synop/presentation/screens/tablet/add_ul.dart';

class AddData extends StatefulWidget {
  const AddData({Key? key}) : super(key: key);

  @override
  State<AddData> createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 600) {
        return const AddMobile();
      } else {
        return const AddTabletul();
      }
    }));
  }
}

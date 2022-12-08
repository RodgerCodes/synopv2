import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:synop/data/cubit/codes_cubit.dart';
import 'package:synop/presentation/widgets/add_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "SYNOP",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocConsumer<CodesCubit, CodesState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              return ListView(
                children: [],
              );
            },
          ),
        ),
      ),
      floatingActionButton: const Addbutton(),
    );
  }
}

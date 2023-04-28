import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:synop/data/constants.dart';
import 'package:synop/data/cubit/codes_cubit.dart';
import 'package:synop/presentation/widgets/add_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CodesCubit>(context).getStationData();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "SYNOP",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.setBool("isLoggedin", false);

              // ignore: use_build_context_synchronously
              Navigator.pushReplacementNamed(context, login);
            },
            child: const Icon(
              Icons.logout,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocConsumer<CodesCubit, CodesState>(
            listener: (context, state) {
              // Pray this state is not emitted
              if (state is ForbiddenError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      state.msg,
                    ),
                  ),
                );

                // navigator to login page
                Navigator.pushReplacementNamed(context, login);
              }
            },
            builder: (context, state) {
              if (state is FetchedCodes) {
                if (state.data.isEmpty) {
                  return const Center(
                    child: Text("No data available for your station"),
                  );
                } else {
                  return ListView(
                    children: [
                      const Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Text("Data", style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize:25,
                        ),),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                        itemBuilder: (context, index){
                          return Container(
                            margin: const EdgeInsets.symmetric(vertical: 10,),
                            child: Card(
                              color: Colors.blueGrey[800],
                              child: ListTile(
                                title:Text(state.data[index]['station']['station_name'], style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),) ,
                                subtitle: Container(
                                  margin: const EdgeInsets.symmetric(vertical: 9,),
                                  child: Text(state.data[index]['code'], style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),),
                                ),
                                trailing: const Icon(Icons.delete,),
                              ),
                            ),
                          );
                      }, itemCount: state.data.length,),
                    ],
                  );
                }
              } else if (state is Error) {
                return Center(
                  child: Text(state.msg),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(
                    color: btnColor,
                  ),
                );
              }
            },
          ),
        ),
      ),
      floatingActionButton: const Addbutton(),
    );
  }
}

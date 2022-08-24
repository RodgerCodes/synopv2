import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:synop/data/constants.dart';
import 'package:synop/data/cubit/user_cubit.dart';
import 'package:synop/data/data.dart';
import 'package:synop/presentation/widgets/station_pop_up.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool available = false;
  void data() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final stationNumber = prefs.getInt("station");
    if (stationNumber == null) {
      print("not available");
    } else {
      setState(() {
        available = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    data();
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<UserCubit>(context).checkStation();
    final _formkey = GlobalKey<FormState>();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<UserCubit, UserState>(
          builder: (context, state) {
            if (state is Available) {
              return SingleChildScrollView(
                child: Center(
                  child: Container(
                    height: size.height,
                    width: size.width,
                    child: Form(
                      key: _formkey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: stationNumber,
                            decoration: const InputDecoration(
                              hintText: "Station Number",
                              labelText: "Station Number",
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: whiteColor,
                                  width: 1.0,
                                ),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: errorColor,
                                  width: 2,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 1.0,
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: errorColor,
                                  width: 2,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () async {
                              // SharedPreferences prefs =
                              //     await SharedPreferences.getInstance();
                              // var station = prefs.setInt(
                              //     "station", int.parse(stationNumber.text));
                              // BlocProvider.of<UserCubit>(context)
                              //     .checkStation();
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.9,
                              padding: const EdgeInsets.all(14.5),
                              decoration: btnStyle,
                              child: const Text(
                                "Login",
                                textAlign: TextAlign.center,
                                style: textStyle,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            } else {
              return SingleChildScrollView(
                child: Center(
                  child: Container(
                    height: size.height,
                    width: size.width * 0.9,
                    child: Form(
                      key: _formkey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextFormField(
                            validator: (value) {
                              if (value == '') {
                                return 'Please Enter your First name';
                              }
                              return null;
                            },
                            controller: email,
                            decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.email,
                                color: whiteColor,
                              ),
                              hintText: "Email",
                              labelText: "Met Email address",
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: whiteColor,
                                  width: 1.0,
                                ),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: errorColor,
                                  width: 2,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 1.0,
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: errorColor,
                                  width: 2,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value == '') {
                                return 'Please Enter your First name';
                              }
                              return null;
                            },
                            controller: password,
                            obscureText: true,
                            decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.lock,
                                color: whiteColor,
                              ),
                              hintText: "Password",
                              labelText: "Account Password",
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: whiteColor,
                                  width: 1.0,
                                ),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: errorColor,
                                  width: 2,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 1.0,
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: errorColor,
                                  width: 2,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacementNamed(context, home);
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.9,
                              padding: const EdgeInsets.all(14.5),
                              decoration: btnStyle,
                              child: const Text(
                                "Login",
                                textAlign: TextAlign.center,
                                style: textStyle,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

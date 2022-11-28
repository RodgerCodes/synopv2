import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:synop/data/constants.dart';
import 'package:synop/data/cubit/user_cubit.dart';
import 'package:synop/presentation/widgets/loader.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // bool available = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _formkey = GlobalKey<FormState>();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            height: size.height,
            width: size.width * 0.9,
            child: BlocConsumer<UserCubit, UserState>(
              listener: (context, state) {
                if (state is LoggedIn) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.msg),
                    ),
                  );

                  Navigator.pushReplacementNamed(context, home);
                }

                if (state is LoginError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.msg),
                    ),
                  );
                }
              },
              builder: (context, state) {
                if (state is LogginIn) {
                  return Loader(size: size);
                } else {
                  return Form(
                    // key: _formkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextFormField(
                          validator: (value) {
                            if (value == '') {
                              return 'Please Enter your email name';
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
                            BlocProvider.of<UserCubit>(context).signIn();

                            // final form = _formkey.currentState;
                            // if (form != null && form.validate()) {
                            // }
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
                  );
                }
              },
            ),
          ),
        ),
      )),
    );
  }
}

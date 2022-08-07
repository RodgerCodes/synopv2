import 'package:flutter/material.dart';
import 'package:synop/data/constants.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formkey = GlobalKey<FormState>();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:synop/data/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void init() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final loggedIn = prefs.getBool("isLoggedin");

    await Future.delayed(
      const Duration(seconds: 3),
      () async => {
        if (loggedIn == null || loggedIn == false)
          {
            Navigator.pushReplacementNamed(context, login),
          }
        else
          {
            Navigator.pushReplacementNamed(context, home),
          }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text(
              "SYNOP",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SpinKitThreeBounce(
              color: Colors.white,
              size: 30,
            )
          ],
        ),
      ),
    );
  }
}

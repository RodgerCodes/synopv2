import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:synop/data/constants.dart';
import 'package:synop/data/data.dart';

// ignore: non_constant_identifier_names
Future<void> ShowDialog(String title, BuildContext context) async {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: TextFormField(
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
          actions: [
            TextButton(
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setInt("station", int.parse(stationNumber.text.trim()));
                // ignore: use_build_context_synchronously
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Station number saved!"),
                  ),
                );
              },
              child: const Text(
                'Submit',
              ),
            )
          ],
        );
      });
}

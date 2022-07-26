import 'package:flutter/material.dart';
import 'package:synopv2/data/constants.dart';
import 'package:synopv2/data/data.dart';

class AddData extends StatelessWidget {
  const AddData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Form(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Section A: Data Inclusion",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: whiteColor,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(
                        5.0,
                      ),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                          hint: const Text('Wind Speed source indicator'),
                          items: windSpeedIndicator
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(
                                value,
                              ),
                            );
                          }).toList(),
                          onChanged: (value) {}),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: whiteColor,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(
                        5.0,
                      ),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        hint: const Text('Rainfall Data Inclusion'),
                        items: windSpeedIndicator
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(
                              value,
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {},
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: whiteColor,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(
                        5.0,
                      ),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                          hint: const Text('Present Past weather inclusion'),
                          items: windSpeedIndicator
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(
                                value,
                              ),
                            );
                          }).toList(),
                          onChanged: (value) {}),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Section B: Visual Observation",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Height',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: heightToLowestCloud,
                    decoration: const InputDecoration(
                      hintText: "Height of the base to Lowest Cloud",
                      labelText: "Height of the base to Lowest Cloud",
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
                  const Text(
                    'Horizontal Visibility',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: visibility,
                    decoration: const InputDecoration(
                      hintText: "Horizontal Visibility",
                      labelText: "Horizontal Visibility",
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
                  const Text(
                    'Total Cloud Amount',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: cloudAmount,
                    decoration: const InputDecoration(
                      hintText: "Cloud Amount",
                      labelText: "Cloud Amount",
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
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Section C: Wind",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Wind Direction',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: windDirection,
                    decoration: const InputDecoration(
                      hintText: "Wind Direction in degrees",
                      labelText: "Wind Direction in degrees",
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
                  const Text(
                    'Wind Speed',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: heightToLowestCloud,
                    decoration: const InputDecoration(
                      hintText: "Wind Speed",
                      labelText: "Wind Speed",
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
                    height: 30,
                  ),
                  const Text(
                    "Section D: Rainfall",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Rainfall Amount',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: rainfallAmount,
                    decoration: const InputDecoration(
                      hintText: "Rainfall Amount",
                      labelText: "Rainfall Amount",
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
                    height: 30,
                  ),
                  const Text(
                    "Section E: Temperature",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Dry bulb Temperature',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: drybulbTemp,
                    decoration: const InputDecoration(
                      hintText: "Dry Bulb Temperature",
                      labelText: "Dry Bulb Temperature",
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
                  const Text(
                    'Wet Bulb Temp',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: wetbulbTemp,
                    decoration: const InputDecoration(
                      hintText: "Wet Bulb Temperature",
                      labelText: "Wet Bulb Temperature",
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
                  const Text(
                    'Maximum Temperature',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: maxTemp,
                    decoration: const InputDecoration(
                      hintText: "Maximum Temperaure",
                      labelText: "Maximum Temperature",
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
                  const Text(
                    'Minimum Temperature',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: minTemp,
                    decoration: const InputDecoration(
                      hintText: "Minimum Temperature",
                      labelText: "Minimum Temperature",
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
                  const Text(
                    'Ground Maximum',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: groundMax,
                    decoration: const InputDecoration(
                      hintText: "Ground Maximum Temp",
                      labelText: "Ground Maximum Temp",
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
                  const Text(
                    "Section F: Pressure",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Station Pressure',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: stationPressure,
                    decoration: const InputDecoration(
                      hintText: "Ground Maximum Temp",
                      labelText: "Ground Maximum Temp",
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
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: whiteColor,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(
                        5.0,
                      ),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                          hint: const Text('Standard isobaric Pressure'),
                          items: isobaricPressure
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(
                                value,
                              ),
                            );
                          }).toList(),
                          onChanged: (value) {}),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Station Pressure',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: geoPotentialHeight,
                    decoration: const InputDecoration(
                      hintText: "Geopotential height",
                      labelText: "Geopotential height",
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
                  const Text(
                    "Section G: Clouds",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}

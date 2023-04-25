import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:synop/data/constants.dart';
import 'package:synop/data/data.dart';
import 'package:synop/data/utils/synop_generator.dart';

class AddMobile extends StatefulWidget {
  const AddMobile({Key? key}) : super(key: key);

  @override
  State<AddMobile> createState() => _AddMobileState();
}

class _AddMobileState extends State<AddMobile> {
  String iw = "Obtained from Anemometer in m/s";
  String ir = "Data included";
  String ix = "No significant Phenomena";
  String isobaricValue = "925";
  String lowcloud = "No low Clouds";
  String middlecloud = "No Medium Clouds";
  String highcloud = "No high Clouds";
  String panoption = "USA opena pan mesh Cover";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.arrow_back),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Text(
                    "Add Weather Data",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
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
                          value: iw,
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
                          onChanged: (value) {
                            setState(() {
                              iw = value.toString();
                            });
                          }),
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
                        value: ir,
                        hint: const Text('Rainfall Data Inclusion'),
                        items: rainfallDataInclusion
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(
                              value,
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            ir = value.toString();
                          });
                        },
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
                        value: ix,
                        hint: const Text('Present Past weather inclusion'),
                        items: presentWeatherInclusion
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(
                              value,
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          ix = value.toString();
                        },
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
                    controller: windSpeed,
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
                    enabled: ir == 'Data included' ? true : false,
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
                    'Dew Point Temperature',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: dewPoint,
                    decoration: const InputDecoration(
                      hintText: "Dew Point",
                      labelText: "Dew Point",
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
                      hintText: "Station Pressure",
                      labelText: "Station Pressure",
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
                          value: isobaricValue,
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
                          onChanged: (value) {
                            setState(() {
                              isobaricValue = value.toString();
                            });
                          }),
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
                          value: lowcloud,
                          hint: const Text('Low Clouds'),
                          items: lowClouds
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(
                                value,
                              ),
                            );
                          }).toList(),
                          onChanged: (value) {
                            lowcloud = value.toString();
                          }),
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
                          value: middlecloud,
                          hint: const Text('Middle Clouds'),
                          items: middleClouds
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(
                                value,
                              ),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              middlecloud = value.toString();
                            });
                          }),
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
                          value: highcloud,
                          hint: const Text('High Clouds'),
                          items: highClouds
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(
                                value,
                              ),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              highcloud = value.toString();
                            });
                          }),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Section H: Past and Present Weather",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Present Weather (code)',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: presentweather,
                    decoration: const InputDecoration(
                      hintText: "Present Weather",
                      labelText: "Present Weather",
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
                    'Past Weather (code)',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: pastweather,
                    decoration: const InputDecoration(
                      hintText: "Past Weather",
                      labelText: "Past Weather",
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
                    'Past 24 hour weather (code)',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: pastTwentyFourWeather,
                    decoration: const InputDecoration(
                      hintText: "Past 24 hour weather",
                      labelText: "Past 24 hour weather",
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
                    "Section I: Sunshine",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Sunshine',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: sunshine,
                    decoration: const InputDecoration(
                      hintText: "Sunshine",
                      labelText: "Sunshine",
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
                    "Section J: Evaporation",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Evaporation',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: evaporation,
                    decoration: const InputDecoration(
                      hintText: "Evaporation",
                      labelText: "Evaporation",
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
                          value: panoption,
                          hint: const Text('Evaporation instrument Type'),
                          items: evaporationpan
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(
                                value,
                              ),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              panoption = value.toString();
                            });
                          }),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    // onTap: () {
                    //   Navigator.pushNamed(context, home);
                    // },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(14.5),
                      decoration: btnStyle,
                      child: const Text(
                        "Save Data",
                        textAlign: TextAlign.center,
                        style: textStyle,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () async {
                      // data convertion
                      // TODO Ger current date and time from device

                      // Get station nummber
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      var stationNumber = prefs.getInt("stationNumber");

                      generateSynop(
                        stationNumber!,
                        iw,
                        ir,
                        ix,
                        heightToLowestCloud.text,
                        visibility.text,
                        cloudAmount.text,
                        windDirection.text,
                        windSpeed.text,
                        rainfallAmount.text,
                        drybulbTemp.text,
                        dewPoint.text,
                        maxTemp.text,
                        minTemp.text,
                        stationPressure.text,
                          isobaricValue,
                        geoPotentialHeight.text,
                        lowcloud,
                        middlecloud,
                        highcloud
                      );
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(14.5),
                      decoration: secBtnStyle,
                      child: const Text(
                        "Save and Generate Synop",
                        textAlign: TextAlign.center,
                        style: textStyle,
                      ),
                    ),
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

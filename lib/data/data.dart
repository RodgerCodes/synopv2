import 'package:flutter/material.dart';

// Editing controller
final TextEditingController heightToLowestCloud = TextEditingController();
final TextEditingController visibility = TextEditingController();
final TextEditingController cloudAmount = TextEditingController();
final TextEditingController windDirection = TextEditingController();
final TextEditingController windSpeed = TextEditingController();
final TextEditingController drybulbTemp = TextEditingController();
final TextEditingController wetbulbTemp = TextEditingController();
final TextEditingController maxTemp = TextEditingController();
final TextEditingController minTemp = TextEditingController();
final TextEditingController groundMax = TextEditingController();
final TextEditingController soilFirst = TextEditingController();
final TextEditingController soilSecond = TextEditingController();
final TextEditingController soilThird = TextEditingController();
final TextEditingController lowestCloudAmount = TextEditingController();
final TextEditingController rainfallAmount = TextEditingController();
final TextEditingController stationPressure = TextEditingController();
final TextEditingController geoPotentialHeight = TextEditingController();

final List<String> windSpeedIndicator = [
  'Estimated in m/s',
  'OBtained from Anemometer in m/s',
  'Estimatedin Knots',
  'Obtained from Anemometer in Knots'
];

final List<String> rainfallDataInclusion = [
  'Data included',
  'Precipitation equals 0',
  'Available but not reported'
];

final List<String> presentWeatherInclusion = [
  'Data included',
  'No significant Phenomena',
  'Data not available'
];

final List<String> isobaricPressure = [
  "1000",
  "925",
  "500",
  "700",
  "850",
];

final List<String> lowClouds = ['No Clouds', 'Cumulus', ''];

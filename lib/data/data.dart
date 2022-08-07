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
final TextEditingController sunshine = TextEditingController();
final TextEditingController evaporation = TextEditingController();
final TextEditingController pastweather = TextEditingController();
final TextEditingController presentweather = TextEditingController();
final TextEditingController pastTwentyFourWeather = TextEditingController();

final List<String> windSpeedIndicator = [
  'Estimated in m/s',
  'Obtained from Anemometer in m/s',
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

final List<String> lowClouds = [
  'No low Clouds',
  'Cumulus with little extent',
  'Towering Cumulus',
  'Cb without Anvil',
  'Sc by cumulus Spreading',
  'Sc without Cu spreading',
  'Stratus of continous layer',
  'Cu or Sc of bad weather',
  'Cu & Sc at different height',
  'Cb with Anvil top',
  'Clouds invisible',
];

final List<String> middleClouds = [
  'No Medium Clouds',
  'Altostratus translucidus',
  'Altostratus opacus / nimbostratus',
  'Altocumulus as single level',
  'Patches of Ac',
  'AC in bands',
  'Ac from spreading of Cu',
  'Ac with altostratus and nimbostratus',
  'Ac castellanus',
  'Ac of chaotic sky',
  'Middle Clouds invisible'
];

final List<String> highClouds = [
  'No high Clouds',
  'Cirrus fibratus',
  'Cirrus Spissatis in patches',
  'Cb or Cirrus floccus',
  'Cirrus spissatus',
  'Cirrus uncinus',
  'Cirrus and Cirrostratus below 45 degrees',
  'Cirrus and Cirrostatus  abaove 45 degrees',
  'Cirrostratus Covering the sky',
  'Cirrostratus not progressively invading sky',
  'CirroCumulus alone',
  'High clouds invisible'
];

final List<String> evaporationpan = [
  'USA open pan without cover',
  'USA opena pan mesh Cover',
  'Others (Kenya Type)'
];

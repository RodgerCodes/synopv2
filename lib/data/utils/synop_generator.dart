import 'package:shared_preferences/shared_preferences.dart';
import 'package:synop/data/utils/converters.dart';

String generateSynop(
  int stationNumber,
  String windSpeedIndicator,
  String rainfallDataInclusion,
  String pastPresentWeatherInclusion,
  String cloudHeight,
  String horizontalVisibilityData,
  String cloudAmountData,
  String windDirectionData,
  String windSpeedData,
  String? rainfallAmountData,
) {
  // data inclusion
  var speedIndicator = windUnitsCode(windSpeedIndicator);
  var rainfallInclusion = rainfallDataAvailability(rainfallDataInclusion);
  var pastPresentAvailable = presentAndPastWeather(pastPresentWeatherInclusion);

  // visual observations
  var cloudBaseHeight = cloudHeightConverter(cloudHeight);
  var horizontalVisibility =
      Visibilityinfo.visibilityData(int.parse(horizontalVisibilityData));
  // use cloud amount data variables

  // Wind data variables
  var windDirection = windDirectionData;

  // check if wind direction is variable of unknown
  if (windDirection.toLowerCase() == 'variable' ||
      windDirection.toLowerCase() == 'unkwown' ||
      windDirection == '') {
    windDirection = WindData.windDirection(999);
  } else if (windDirection.toLowerCase() == 'calm') {
    windDirection = WindData.windDirection(00);
  } else {
    windDirection = WindData.windDirection(double.parse(windDirection));
  }

  var windSpeed = double.parse(windSpeedData).round();
  // TODO change units value if units in knots

  // RAINFALL DATA CONVERTERS
  dynamic rainfallAmount;
  if (rainfallAmountData != null) {
    rainfallAmount = rainfallAmount(double.parse(rainfallAmountData));
  }

  // TEMPERATURE DATA CONVERTERS

  return stationNumber.toString();
}

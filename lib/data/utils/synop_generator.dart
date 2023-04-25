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
    String? dryBulbTemperature,
    String? dewPointTemperature,
    String? maximumTemperature,
    String? minimumTemperature,
    String? stationPressure,
    String? isobaricValue,
    String? geoHeight,
    String lowClouds,
    String middleClouds,
    String highClouds,
    String? pastWeatherCode,
    String? presentWeatherCode,
    String? past24hourWeatherCode,
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

  var windSpeed = double.parse(windSpeedData) .round();
  // TODO change units value if units in knots

  // RAINFALL DATA CONVERTERS
  dynamic rainfallAmount;
  if (rainfallAmountData != null) {
    rainfallAmount = rainfallAmount(double.parse(rainfallAmountData));
  }

  // TEMPERATURE DATA CONVERTERS
  // Dry bulb temperature
  var numtemp =  double.parse(dryBulbTemperature!);
  var newTemp = (numtemp * 10).round().toString();

  // dew point temperature
  var newDew = double.parse(dewPointTemperature!);
  var dewPoint = (newDew * 10).round().toString();

  // maximum temp
  var maxTemp = double.parse(maximumTemperature!);
  var finalMaxTemp = (maxTemp * 10).round().toString();

  // minimum temp
  var minTemp = double.parse(minimumTemperature!);
  var finalMinTemp = (minTemp * 10).round().toString();

  // PRESSURE DATA CONVERTERS

  //get station pressure from parameter,
  var isoValue = IsobaricValue(isobaricValue!);

  // get geopotential height from parameter


  // CLOUDS
  var lowCloud = LowClouds.Low(lowClouds);
  var middleCloud = MiddleClouds.Middle(middleClouds);
  var highCloud = HighClouds.High(highClouds);

  // PAST AND PRESENT WEATHER

  // get present weather code from parameter

  // @REMINDER get past weather code from parameter

  // @REMINDER get past 24 hour weather code from parameter




  return stationNumber.toString();
}

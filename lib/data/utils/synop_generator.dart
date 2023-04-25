import 'package:synop/data/utils/converters.dart';

String generateSynop(
  int stationNumber,
  dynamic date,
  // dynamic time,
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
    // extra cloud groups
    String? lowCloudAmount,
    String? lowerCloudType,
    String? lowerCloudHeight,

    String? middleCloudAmount,
    String? middleCloudType,
    String? middleCloudHeight,

    String? higherCloudAmount,
    String? higherCloudType,
    String? higherCloudHeight,

    String? pastWeatherCode,
    String? presentWeatherCode,
    String? past24hourWeatherCode,
    String? sunshine,
    String? evaporation
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
  dynamic rainfallAmountInfo;
  if (rainfallAmountData != null) {
    rainfallAmountInfo = rainfallAmount(double.parse(rainfallAmountData));
  }

  // TEMPERATURE DATA CONVERTERS
  // Dry bulb temperature
  var numtemp =  double.parse(dryBulbTemperature!);
  var newTemp = (numtemp * 10).round().toString();

  // dew point temperature
  var newDew = double.parse(dewPointTemperature!);
  var dewPointTemp = (newDew * 10).round().toString();

  // maximum temp
  var maxTemp = double.parse(maximumTemperature!);
  var finalMaxTemp = (maxTemp * 10).round().toString();

  // minimum temp
  var minTemp = double.parse(minimumTemperature!);
  var finalMinTemp = (minTemp * 10).round().toString();

  var tempSign = Tempsign(numtemp);

  // PRESSURE DATA CONVERTERS

  //get station pressure from parameter,
  var isoValue = IsobaricValue(isobaricValue!);

  // get geoPotential height from parameter


  // CLOUDS
  var lowCloud = LowClouds.Low(lowClouds);
  var middleCloud = MiddleClouds.Middle(middleClouds);
  var highCloud = HighClouds.High(highClouds);

  // PAST AND PRESENT WEATHER

  // get present weather code from parameter

  // @REMINDER get past weather code from parameter

  // @REMINDER get past 24 hour weather code from parameter


  // GENERATE SYNOP
  var synop;
  // TODO get current date and time

  //This is the original synop returned when all fields are not empty
  synop = "AAXX ${date}time${speedIndicator} 67${stationNumber} "
      "${rainfallInclusion}${pastPresentAvailable}${cloudBaseHeight}${horizontalVisibility} "
      "${cloudAmountData}${windDirection}${windSpeed} 10${newTemp} 20${dewPointTemp} 3${stationPressure} 4${isoValue} 6${rainfallAmountInfo}24"
      " 7${presentWeatherCode}${pastWeatherCode}  "
      "333 20${finalMinTemp} 50${evaporation} 5${sunshine} 8${lowCloudAmount}${lowerCloudType}${lowerCloudHeight} 8${middleCloudAmount}${middleCloudType}${middleCloudHeight}"
      " ${higherCloudAmount}${higherCloudType}${higherCloudHeight} "
      "555 10${finalMaxTemp} 7//${past24hourWeatherCode}=";




  return synop.toString();
}

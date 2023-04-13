import 'package:shared_preferences/shared_preferences.dart';
import 'package:synop/data/utils/converters.dart';

String generateSynop(int stationNumber, String windSpeedIndicator,
    String rainfallDataInclusion, String pastPresentWeatherInclusion) {
  // data inclusion
  var speedIndicator = windUnitsCode(windSpeedIndicator);
  var rainfallInclusion = rainfallDataAvailability(rainfallDataInclusion);
  var pastPresentAvailable = presentAndPastWeather(pastPresentWeatherInclusion);

  // visual observations

  return stationNumber.toString();
}

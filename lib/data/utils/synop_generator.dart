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
    String? evaporation,
    String? maxGroundTemp,
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
      windDirection == '' || windDirection.toLowerCase() == 'vrb') {
    windDirection = WindData.windDirection(999);
  } else if (windDirection.toLowerCase() == 'calm') {
    windDirection = WindData.windDirection(00);
  } else {
    windDirection = WindData.windDirection(double.parse(windDirection));
  }

  var windSpeed = double.parse(windSpeedData) .round();
  // TODO change units value if units in knots

  // RAINFALL DATA CONVERTERS
  dynamic rainfallAmountInfo, rainPeriod;
  print(rainfallAmountData);
  rainfallAmountInfo = CheckDataAvailability(rainfallAmountData);
  rainPeriod ='/';

  if (rainfallAmountInfo != '///') {
    rainfallAmountInfo = rainfallAmount(double.parse(rainfallAmountData!));
    rainPeriod = '4';
  }



  // TEMPERATURE DATA CONVERTERS
  // Dry bulb temperature

  var numtemp;
  numtemp = dataAvailabilityChecker(dryBulbTemperature);
  var newTemp = dataAvailabilityChecker(dryBulbTemperature);
  if(numtemp != '/'){
    numtemp = double.parse(dryBulbTemperature!);
    newTemp = (numtemp * 10).round().toString();
  }



  // dew point temperature
  var newDew = double.parse(dewPointTemperature!);
  var dewPointTemp = (newDew * 10).round().toString();

  // maximum temp
  var maxTemp;
  maxTemp = dataAvailabilityChecker(maximumTemperature);
  var finalMaxTemp = dataAvailabilityChecker(maximumTemperature);
  if(maxTemp != '/'){
    maxTemp = double.parse(maximumTemperature!);
  finalMaxTemp = (maxTemp * 10).round().toString();
  }


  // minimum temp
  var minTemp;
  minTemp = dataAvailabilityChecker(minimumTemperature);
  var finalMinTemp = dataAvailabilityChecker(minimumTemperature);
  if(minTemp != '/'){
    minTemp = double.parse(minimumTemperature!);
    finalMinTemp = (minTemp * 10).round().toString();
  }

  var maxground;
  maxground = CheckDataAvailability(maxGroundTemp);
  var finalMaxGround = CheckDataAvailability(maxGroundTemp);
  if(maxground != '///'){
    maxground = double.parse(maxGroundTemp!);
    finalMaxGround = (maxground * 10).round().toString();
  }



  var tempSign = Tempsign(numtemp);

  // PRESSURE DATA CONVERTERS
  var stPressure;
  stPressure = CheckDataAvailability(stationPressure);
  if(stPressure != '///'){
    stPressure = stationPressure;
  }

  //get station pressure from parameter,
  var isoValue = IsobaricValue(isobaricValue!);

  // get geoPotential height from parameter
  var geoPHeight = CheckDataAvailability(geoHeight);


  // CLOUDS
  var lowCloud = LowClouds.Low(lowClouds);
  var middleCloud = MiddleClouds.Middle(middleClouds);
  var highCloud = HighClouds.High(highClouds);

  // PAST AND PRESENT

  // get present weather code from parameter

  // @REMINDER get past weather code from parameter

  // @REMINDER get past 24 hour weather code from parameter

  // evaporation and sunshine value checker
  var sunshineChecker = CheckDataAvailability(sunshine);
  var evaporationChecker = CheckDataAvailability(evaporation);

  // GENERATE SYNOP
  var synop;
  // TODO get current date and time

  //This is the original synop returned when all fields are not empty
  synop = "AAXX ${date}time${speedIndicator} 67${stationNumber} "
          "${rainfallInclusion}${pastPresentAvailable}${cloudBaseHeight}${horizontalVisibility} "
          "${cloudAmountData}${windDirection}${windSpeed} 10${newTemp} 20${dewPointTemp} 3${stPressure} 4${isoValue}${geoPHeight} 6${rainfallAmountInfo}24"
          " 7${presentWeatherCode}${pastWeatherCode} 8amount${lowCloud}${middleCloud}${highCloud} "
          "333 20${finalMinTemp} 50${evaporationChecker} 5${sunshineChecker} 8${lowCloudAmount}${lowerCloudType}${lowerCloudHeight} 8${middleCloudAmount}${middleCloudType}${middleCloudHeight}"
          " ${higherCloudAmount}${higherCloudType}${higherCloudHeight} "
          "555 10${finalMaxTemp} 7//${past24hourWeatherCode}=";

  if(pastPresentAvailable == 1){
  //   check rain data available
    if(rainfallInclusion == '3' || rainfallInclusion == '4'){

      if(cloudBaseHeight == '9' || cloudBaseHeight == '/'){
        synop = "AAXX ${date}time${speedIndicator} 67${stationNumber} "
            "${rainfallInclusion}${pastPresentAvailable}${cloudBaseHeight}${horizontalVisibility} "
            "${cloudAmountData}${windDirection}${windSpeed} 10${newTemp} 20${dewPointTemp} 3${stPressure} 4${isoValue}${geoPHeight} "
            " 7${presentWeatherCode}${pastWeatherCode} 8amount${lowCloud}${middleCloud}${highCloud} "
            "333 0${finalMaxGround} 20${finalMinTemp} 5${evaporationChecker} 55${sunshineChecker} "
            "555 10${finalMaxTemp} 7//${past24hourWeatherCode}=";
      } else if(lowCloudAmount == null && middleCloudAmount == null){
        synop = "AAXX ${date}time${speedIndicator} 67${stationNumber} "
                "${rainfallInclusion}${pastPresentAvailable}${cloudBaseHeight}${horizontalVisibility} "
                "${cloudAmountData}${windDirection}${windSpeed} 10${newTemp} 20${dewPointTemp} 3${stPressure} 4${isoValue}${geoPHeight} "
                " 7${presentWeatherCode}${pastWeatherCode} 8amount${lowCloud}${middleCloud}${highCloud}  "
                "333 0${finalMaxGround} 20${finalMinTemp} 5${evaporationChecker} 55${sunshineChecker} "
                " 8${higherCloudAmount}${higherCloudType}${higherCloudHeight} "
                "555 10${finalMaxTemp} 7//${past24hourWeatherCode}=";
      } else if(lowCloudAmount == null){
        synop = "AAXX ${date}time${speedIndicator} 67${stationNumber} "
                "${rainfallInclusion}${pastPresentAvailable}${cloudBaseHeight}${horizontalVisibility} "
                "${cloudAmountData}${windDirection}${windSpeed} 10${newTemp} 20${dewPointTemp} 3${stPressure} 4${isoValue}${geoPHeight} "
                " 7${presentWeatherCode}${pastWeatherCode} 8amount${lowCloud}${middleCloud}${highCloud}  "
                "333 0${finalMaxGround} 20${finalMinTemp} 5${evaporationChecker} 55${sunshineChecker} 8${middleCloudAmount}${middleCloudType}${middleCloudHeight}"
                " 8${higherCloudAmount}${higherCloudType}${higherCloudHeight} "
                "555 10${finalMaxTemp} 7//${past24hourWeatherCode}=";
      } else if(middleCloudAmount == null){
        synop = "AAXX ${date}time${speedIndicator} 67${stationNumber} "
            "${rainfallInclusion}${pastPresentAvailable}${cloudBaseHeight}${horizontalVisibility} "
            "${cloudAmountData}${windDirection}${windSpeed} 10${newTemp} 20${dewPointTemp} 3${stPressure} 4${isoValue}${geoPHeight} "
            " 7${presentWeatherCode}${pastWeatherCode} 8amount${lowCloud}${middleCloud}${highCloud}  "
            "333 0${finalMaxGround} 20${finalMinTemp} 5${evaporationChecker} 55${sunshineChecker} 8${lowCloudAmount}${lowerCloudType}${lowerCloudHeight} "
            " ${higherCloudAmount}${higherCloudType}${higherCloudHeight} "
            "555 10${finalMaxTemp} 7//${past24hourWeatherCode}=";
      }

    } else {
    //   Rainfall data available else

      if(cloudBaseHeight == '9' || cloudBaseHeight == '/'){
        synop = "AAXX ${date}time${speedIndicator} 67${stationNumber} "
            "${rainfallInclusion}${pastPresentAvailable}${cloudBaseHeight}${horizontalVisibility} "
            "${cloudAmountData}${windDirection}${windSpeed} 10${newTemp} 20${dewPointTemp} 3${stPressure} 4${isoValue}${geoPHeight} 6${rainfallAmountInfo}4"
            " 7${presentWeatherCode}${pastWeatherCode} 8amount${lowCloud}${middleCloud}${highCloud} "
            "333 0${finalMaxGround} 20${finalMinTemp} 50${evaporationChecker} 55${sunshineChecker} "
            "555 10${finalMaxTemp} 7//${past24hourWeatherCode}=";
      } else if(lowCloudAmount == null && middleCloudAmount == null){
        synop = "AAXX ${date}time${speedIndicator} 67${stationNumber} "
            "${rainfallInclusion}${pastPresentAvailable}${cloudBaseHeight}${horizontalVisibility} "
            "${cloudAmountData}${windDirection}${windSpeed} 10${newTemp} 20${dewPointTemp} 3${stPressure} 4${isoValue}${geoPHeight} 6${rainfallAmountInfo}4"
            " 7${presentWeatherCode}${pastWeatherCode} 8amount${lowCloud}${middleCloud}${highCloud}  "
            "333 0${finalMaxGround} 20${finalMinTemp} 5${evaporationChecker} 55${sunshineChecker} "
            " 8${higherCloudAmount}${higherCloudType}${higherCloudHeight} "
            "555 10${finalMaxTemp} 7//${past24hourWeatherCode}=";
      } else if(lowCloudAmount == null){
        synop = "AAXX ${date}time${speedIndicator} 67${stationNumber} "
            "${rainfallInclusion}${pastPresentAvailable}${cloudBaseHeight}${horizontalVisibility} "
            "${cloudAmountData}${windDirection}${windSpeed} 10${newTemp} 20${dewPointTemp} 3${stPressure} 4${isoValue}${geoPHeight} 6${rainfallAmountInfo}4"
            " 7${presentWeatherCode}${pastWeatherCode} 8amount${lowCloud}${middleCloud}${highCloud}  "
            "333 0${finalMaxGround} 20${finalMinTemp} 5${evaporationChecker} 55${sunshineChecker} 8${middleCloudAmount}${middleCloudType}${middleCloudHeight}"
            " ${higherCloudAmount}${higherCloudType}${higherCloudHeight} "
            "555 10${finalMaxTemp} 7//${past24hourWeatherCode}=";
      } else if(middleCloudAmount == null){
        synop = "AAXX ${date}time${speedIndicator} 67${stationNumber} "
            "${rainfallInclusion}${pastPresentAvailable}${cloudBaseHeight}${horizontalVisibility} "
            "${cloudAmountData}${windDirection}${windSpeed} 10${newTemp} 20${dewPointTemp} 3${stPressure} 4${isoValue}${geoPHeight} 6${rainfallAmountInfo}4"
            " 7${presentWeatherCode}${pastWeatherCode} 8amount${lowCloud}${middleCloud}${highCloud}  "
            "333 0${finalMaxGround} 20${finalMinTemp} 5${evaporationChecker} 55${sunshineChecker} ${lowCloudAmount}${lowerCloudType}${lowerCloudHeight} "
            " ${higherCloudAmount}${higherCloudType}${higherCloudHeight} "
            "555 10${finalMaxTemp} 7//${past24hourWeatherCode}=";
      }



    //   rainfall data inclusion ends here

    }
  }else {
  //   present weather not available

  //   rainfall inclusion
    if(rainfallInclusion == '3' || rainfallInclusion == '4'){

      if(cloudBaseHeight == '9' || cloudBaseHeight == '/'){
        synop = "AAXX ${date}time${speedIndicator} 67${stationNumber} "
            "${rainfallInclusion}${pastPresentAvailable}${cloudBaseHeight}${horizontalVisibility} "
            "${cloudAmountData}${windDirection}${windSpeed} 10${newTemp} 20${dewPointTemp} 3${stPressure} 4${isoValue}${geoPHeight} "
            " 8amount${lowCloud}${middleCloud}${highCloud} "
            "333 0${finalMaxGround} 20${finalMinTemp} 5${evaporationChecker} 55${sunshineChecker} "
            "555 10${finalMaxTemp} 7//${past24hourWeatherCode}=";
      } else if(lowCloudAmount == null && middleCloudAmount == null){
        synop = "AAXX ${date}time${speedIndicator} 67${stationNumber} "
            "${rainfallInclusion}${pastPresentAvailable}${cloudBaseHeight}${horizontalVisibility} "
            "${cloudAmountData}${windDirection}${windSpeed} 10${newTemp} 20${dewPointTemp} 3${stPressure} 4${isoValue}${geoPHeight} "
            " 8amount${lowCloud}${middleCloud}${highCloud}  "
            "333 0${finalMaxGround} 20${finalMinTemp} 5${evaporationChecker} 55${sunshineChecker} "
            " 8${higherCloudAmount}${higherCloudType}${higherCloudHeight} "
            "555 10${finalMaxTemp} 7//${past24hourWeatherCode}=";
      } else if(lowCloudAmount == null){
        synop = "AAXX ${date}time${speedIndicator} 67${stationNumber} "
            "${rainfallInclusion}${pastPresentAvailable}${cloudBaseHeight}${horizontalVisibility} "
            "${cloudAmountData}${windDirection}${windSpeed} 10${newTemp} 20${dewPointTemp} 3${stPressure} 4${isoValue}${geoPHeight} "
            " 8amount${lowCloud}${middleCloud}${highCloud}  "
            "333 0${finalMaxGround} 20${finalMinTemp} 5${evaporationChecker} 55${sunshineChecker} 8${middleCloudAmount}${middleCloudType}${middleCloudHeight}"
            " 8${higherCloudAmount}${higherCloudType}${higherCloudHeight} "
            "555 10${finalMaxTemp} 7//${past24hourWeatherCode}=";
      } else if(middleCloudAmount == null){
        synop = "AAXX ${date}time${speedIndicator} 67${stationNumber} "
            "${rainfallInclusion}${pastPresentAvailable}${cloudBaseHeight}${horizontalVisibility} "
            "${cloudAmountData}${windDirection}${windSpeed} 10${newTemp} 20${dewPointTemp} 3${stPressure} 4${isoValue}${geoPHeight} "
            " 8amount${lowCloud}${middleCloud}${highCloud}  "
            "333 0${finalMaxGround} 20${finalMinTemp} 5${evaporationChecker} 55${sunshineChecker} ${lowCloudAmount}${lowerCloudType}${lowerCloudHeight} "
            " ${higherCloudAmount}${higherCloudType}${higherCloudHeight} "
            "555 10${finalMaxTemp} 7//${past24hourWeatherCode}=";
      }

    } else {
    //   rainfall data available

      if(cloudBaseHeight == '9' || cloudBaseHeight == '/'){
        synop = "AAXX ${date}time${speedIndicator} 67${stationNumber} "
            "${rainfallInclusion}${pastPresentAvailable}${cloudBaseHeight}${horizontalVisibility} "
            "${cloudAmountData}${windDirection}${windSpeed} 10${newTemp} 20${dewPointTemp} 3${stPressure} 4${isoValue}${geoPHeight} 6${rainfallAmountInfo}4"
            " 8amount${lowCloud}${middleCloud}${highCloud} "
            "333 0${finalMaxGround} 20${finalMinTemp} 50${evaporationChecker} 55${sunshineChecker} "
            "555 10${finalMaxTemp} 7//${past24hourWeatherCode}=";
      } else if(lowCloudAmount == null && middleCloudAmount == null){
        synop = "AAXX ${date}time${speedIndicator} 67${stationNumber} "
            "${rainfallInclusion}${pastPresentAvailable}${cloudBaseHeight}${horizontalVisibility} "
            "${cloudAmountData}${windDirection}${windSpeed} 10${newTemp} 20${dewPointTemp} 3${stPressure} 4${isoValue}${geoPHeight} 6${rainfallAmountInfo}4"
            " 8amount${lowCloud}${middleCloud}${highCloud}  "
            "333 0${finalMaxGround} 20${finalMinTemp} 5${evaporationChecker} 55${sunshineChecker} "
            " 8${higherCloudAmount}${higherCloudType}${higherCloudHeight} "
            "555 10${finalMaxTemp} 7//${past24hourWeatherCode}=";
      } else if(lowCloudAmount == null){
        synop = "AAXX ${date}time${speedIndicator} 67${stationNumber} "
            "${rainfallInclusion}${pastPresentAvailable}${cloudBaseHeight}${horizontalVisibility} "
            "${cloudAmountData}${windDirection}${windSpeed} 10${newTemp} 20${dewPointTemp} 3${stPressure} 4${isoValue}${geoPHeight} 6${rainfallAmountInfo}4"
            " 7${presentWeatherCode}${pastWeatherCode} 8amount${lowCloud}${middleCloud}${highCloud}  "
            "333 0${finalMaxGround} 20${finalMinTemp} 5${evaporationChecker} 55${sunshineChecker} 8${middleCloudAmount}${middleCloudType}${middleCloudHeight}"
            " 8${higherCloudAmount}${higherCloudType}${higherCloudHeight} "
            "555 10${finalMaxTemp} 7//${past24hourWeatherCode}=";
      } else if(middleCloudAmount == null){
        synop = "AAXX ${date}time${speedIndicator} 67${stationNumber} "
            "${rainfallInclusion}${pastPresentAvailable}${cloudBaseHeight}${horizontalVisibility} "
            "${cloudAmountData}${windDirection}${windSpeed} 10${newTemp} 20${dewPointTemp} 3${stPressure} 4${isoValue}${geoPHeight} 6${rainfallAmountInfo}4"
            " 8amount${lowCloud}${middleCloud}${highCloud}  "
            "333 0${finalMaxGround} 20${finalMinTemp} 5${evaporationChecker} 55${sunshineChecker} ${lowCloudAmount}${lowerCloudType}${lowerCloudHeight} "
            " 8${higherCloudAmount}${higherCloudType}${higherCloudHeight} "
            "555 10${finalMaxTemp} 7//${past24hourWeatherCode}=";
      }

    }


  }






  return synop.toString();
}

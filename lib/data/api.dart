import 'package:shared_preferences/shared_preferences.dart';

class ApiCall {
  var baseUrl = 'http://10.0.2.2:8080';

  Future login() async {}

  // check if station number is available in local storage
  Future stationNumber() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var data = prefs.getInt("station");
    if (data == null) {
      return {
        'available': false,
      };
    } else {
      print(data);
      return {
        'available': true,
      };
    }
  }
}

import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:synop/data/constants.dart';
import 'package:synop/data/data.dart';

class ApiCall {
  var baseUrl = 'http://10.0.2.2:8000';

  Future login() async {
    try {
      // local storage instance
      SharedPreferences prefs = await SharedPreferences.getInstance();
      // http request
      final request = await http.post(
        Uri.parse("$baseUrl/api/user/login/"),
        body: {
          'email': email.text.trim(),
          'password': password.text.trim(),
        },
      );

      final response = convert.jsonDecode(request.body);

      if (request.statusCode == 401) {
        return {
          'err': true,
          'msg': response['detail'],
        };
      } else {
        final token = response['access'];
        final stationNumber = response['station_number'];
        prefs.setString("token", token);
        prefs.setInt("stationNumber", stationNumber);
        prefs.setBool("isLoggedin", true);

        return {
          'err': false,
          'msg': 'Successfully logged in to your account',
        };
      }

      // decode data
    } on SocketException {
      return {
        'err': true,
        'type': 'net',
        'msg': 'Network error, check your connection',
      };
    } on HttpException {
      return {
        'err': true,
        'type': 'http',
        'msg': 'Server Error! Contact system Admin',
      };
    }
  }

  // get station data by station number
  Future getData() async {
    try {
      // local storage instance
      SharedPreferences prefs = await SharedPreferences.getInstance();

      final token = prefs.getString("token");
      final stationNumber = prefs.getInt("stationNumber");

      // http request
      final request = await http.get(
        Uri.parse("$baseUrl/dashboard/api/data/station/$stationNumber/"),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      if (request.statusCode == 401) {
        prefs.setBool("isLoggedin", false);
        return {
          'err': true,
          'type': '403',
          'msg': 'Forbidden',
        };
      } else {
        //  decode data
        final response = convert.jsonDecode(request.body);
        return {
          'err': false,
          'msg': response,
        };
      }
    } on SocketException {
      return {
        'err': true,
        'type': 'socket',
        'msg': 'Network Error',
      };
    } on HttpException {
      return {
        'err': true,
        'type': 'http',
        'msg': 'Server Error! Contact system Admin',
      };
    }
  }

  Future submitData(String? isoValue, String lowCloud, String middleCloud, String highCloud, String synop ) async {
    try{
     SharedPreferences prefs = await SharedPreferences.getInstance();
     final token = prefs.getString("token");

    //  http request
      final request = await http.post(Uri.parse("$baseUrl/dashboard/api/data/submit-data"),
          body: {
         'wind_speed':windSpeed.text,
         'wind_direction':windDirection.text,
            'max_temperature':maxTemp.text,
            'min_temperature':minTemp.text,
            'dry_bulb':drybulbTemp.text,
            'wet_bulb':wetbulbTemp.text,
            'dew_point':dewPoint.text,
            'pressure_value':stationPressure.text,
            'isobaric_value':isoValue,
            'ground_max_temp':groundMax.text,
            'low_clouds':lowCloud,
            'middle_clouds':middleCloud,
            'high_clouds':highCloud,
            'sunshine':sunshine.text,
            'evaporation':evaporation.text,
            'rainfall_amount':rainfallAmount.text,
            'total_Cloud_amount':cloudAmount.text,
            'lowcloud_amount':lowCloudAmount.text,
            'middlecloud_amount':middleCloudAmount.text,
            'highcloud_amount':highCloudAmount.text,
            'synop':synop,
      }, headers: {
        'Authorization' :'Bearer $token'
      });

      if(request.statusCode != 201){

      } else {
        return {
          'err':false,
          'msg':'Data submitted successfully',
        };
      }
    }on SocketException {
       return  {
         'err':true,
         'type':'net',
         'msg':'Oops! Network Error, check your connection',
       };
    } on HttpException{
      return {
        'err' :true,
        'type':'http',
        'msg':'Server Error! contact system Admin',
      };
    }

  }
}

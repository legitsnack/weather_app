import 'dart:convert';
import 'dart:developer';
import 'package:weather_app/models/daily_forecast.dart';
import 'package:weather_app/utilities/constants.dart';
import 'package:weather_app/utilities/location.dart';
import 'package:http/http.dart' as http;


class WeatherAPI {

  Future<DailyForecast> fetchWeatherForecast({String city, bool isCity}) async {

    Location location = Location();
    await location.getCurrentLocation();
    Map<String, String> parameters;

    if(isCity == true) {
      var params = {
        'appid':Constants.API_APP_ID,
        'units':'metric',
        'q':city
      };
      parameters = params;
    } else {
      var params = {
        'appid': Constants.API_APP_ID,
        'units':'metric',
        'lat': location.latitude.toString(),
        'lon': location.longitude.toString(),
      };
      parameters = params;
    }


    var uri = Uri.https(Constants.BASE_URL, Constants.API_TYPE, parameters);
    log('request: ${uri.toString()}');

    var response = await http.get(uri);

    print('response: ${response?.body}');

    if (response.statusCode == 200) {
      return DailyForecast.fromJson(json.decode(response.body));
    } else {
      return Future.error('Error response');
    }
  }
}
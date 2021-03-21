import 'package:flutter/material.dart';
import 'package:weather_app/models/daily_forecast.dart';
import 'package:weather_app/utilities/forecast_util.dart';

class CityView extends StatelessWidget {
  final AsyncSnapshot<DailyForecast> snapshot;
  const CityView({this.snapshot});

  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.data.list;
    var city = snapshot.data.city.name;
    var formattedDate = DateTime.fromMillisecondsSinceEpoch(forecastList[0].dt * 1000);
    return Container(
      child: Column(
        children: <Widget>[
          Text(
            '$city',
            style: TextStyle(
              fontSize: 28.0,
              color: Colors.black87,
            ),
          ),
          Text(
            '${Util.getFormattedDate(formattedDate)}',
            style: TextStyle(
              fontSize: 15.0,
            ),
          ),
        ],
      ),
    );
  }
}
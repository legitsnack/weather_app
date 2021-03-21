import 'package:flutter/material.dart';
import 'package:weather_app/models/daily_forecast.dart';

class TempView extends StatelessWidget {
  final AsyncSnapshot<DailyForecast> snapshot;
  const TempView({this.snapshot});

  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.data.list;
    var icon = forecastList[0].getIconUrl();
    var temp = forecastList[0].temp.day.toStringAsFixed(0);
    var feelslike = forecastList[0].feelsLike.day.toStringAsFixed(0);
    var description = forecastList[0].weather[0].description.toUpperCase();
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(width: 20.0),
          Column(
            children: <Widget>[
              Row(
                children: [
                  Text(
                    '$temp°',
                    style: TextStyle(
                      fontSize: 40.0,
                      color: Colors.black87,
                    ),
                  ),
                  Image.network(icon, scale: 0.8),
                ],
              ),
              Text(
                '$description',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.black87,
                ),
              ),
              Text(
                'feels like '.toUpperCase() + '$feelslike°',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

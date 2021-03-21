import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_app/models/daily_forecast.dart';

class DetailView extends StatelessWidget {

  final AsyncSnapshot<DailyForecast> snapshot;
  const DetailView({this.snapshot});

  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.data.list;
    var pressure = forecastList[0].pressure * 0.750062;
    var pressureR = pressure.round();
    var humidity = forecastList[0].humidity;
    var wind = forecastList[0].speed;
    var windI = wind.toInt();
    return Container(
      padding: EdgeInsets.all(20),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Row(
                children: [
                  Icon(FontAwesomeIcons.thermometerThreeQuarters),
                  SizedBox(width: 10.0),
                  Text(pressureR.toString() +' mm Hg',),
                ],
              ),
              SizedBox(height: 10.0),
              Row(
                children: [
                  Icon(FontAwesomeIcons.cloudRain),
                  SizedBox(width: 10.0),
                  Text(humidity.toString() + ' %'),
                ],
              ),
              SizedBox(height: 10.0),
              Row(
                children: [
                  Icon(FontAwesomeIcons.wind),
                  SizedBox(width: 10.0),
                  Text(windI.toString() + '  m/s',),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
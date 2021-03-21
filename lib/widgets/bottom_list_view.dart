import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/models/daily_forecast.dart';

import 'forecast_card.dart';

class BottomListView extends StatelessWidget {
  final AsyncSnapshot<DailyForecast> snapshot;
  const BottomListView({this.snapshot});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          '7-day forecast'.toUpperCase(),
          style: TextStyle(
              fontSize: 18.0,
              color: Colors.black87,
              ),
        ),
        Container(
          height: 140,
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => SizedBox(width: 12),
            itemCount: snapshot.data.list.length,
            itemBuilder: (context, index) => Container(
              width: MediaQuery.of(context).size.width / 2.7,
              height: 150,
              color: Colors.deepPurple[300],
              child: forecastCard(snapshot, index),
            ),
          ),
        ),
      ],
    );
  }
}
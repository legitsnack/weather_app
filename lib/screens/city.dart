import 'package:flutter/material.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[300],
      body: Container(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    cursorColor: Colors.black45,
                    style: TextStyle(color: Colors.black87),
                    decoration: InputDecoration(
                      hintText: 'Enter city',
                      hintStyle: TextStyle(color: Colors.black45),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                          borderSide: BorderSide.none),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.search),
                        color: Colors.black45,
                        onPressed: () {
                          Navigator.pop(context, cityName);
                        },
                      )
                    ),
                    onChanged: (value) {
                      cityName = value;
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
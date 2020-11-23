import 'package:flutter/material.dart';
import 'package:temperature_check/model/Temperature.dart';
import 'package:temperature_check/services/database_service.dart';

class TemperatureCard extends StatelessWidget {
  final Temperature temperature;

  TemperatureCard({this.temperature});

  @override
  Widget build(BuildContext context) {
    final DatabaseService _data = DatabaseService();
    return Card(
      elevation: 10,
      margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
      child: Container(
        padding: EdgeInsets.all(20),
        child: Row(children: <Widget>[
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    'Temperature',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "${temperature.temperatureValue} °C",
                    style: TextStyle(fontSize: 40),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Text(
                    'Time',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    width: 70,
                  ),
                  Text(temperature.time),
                ],
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
